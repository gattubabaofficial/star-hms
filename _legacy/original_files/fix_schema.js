const fs = require('fs');
const path = require('path');

const schemaPath = path.join(__dirname, 'packages/api/prisma/schema.prisma');
let schemaDoc = fs.readFileSync(schemaPath, 'utf8');

// 1. Change provider
schemaDoc = schemaDoc.replace(/provider\s*=\s*"mongodb"/g, 'provider = "postgresql"');

// 2. We need to parse each model to identify its ID field (the one with @unique that ends with Code)
const models = [...schemaDoc.matchAll(/model\s+(\w+)\s+{([^}]+)}/g)];
const modelToPk = {};

models.forEach(match => {
    const modelName = match[1];
    const body = match[2];
    
    // Find the line that has Int @unique and often ends in Code (but not necessarily just Code, some are like OpgCode, CmpCode)
    // Actually, looking at the models, the first field that is Int @unique is almost always the PK.
    const pkMatch = body.match(/(\w+)\s+Int\s+@unique/);
    if (pkMatch) {
        modelToPk[modelName] = pkMatch[1];
    }
});

// Now execute the replacements line by line:
const lines = schemaDoc.split('\n');
const newLines = [];
let currentModel = null;

for (let line of lines) {
    const modelMatch = line.match(/^model\s+(\w+)\s+{/);
    if (modelMatch) {
        currentModel = modelMatch[1];
        newLines.push(line);
        continue;
    }
    
    if (line.trim() === '}') {
        currentModel = null;
        newLines.push(line);
        continue;
    }
    
    if (currentModel) {
        // Drop the old ObjectId primary key
        if (line.includes('@map("_id")') && line.includes('@id')) {
            continue;
        }
        
        // Promote the @unique field to @id if we found it
        const pk = modelToPk[currentModel];
        if (pk && line.trim().startsWith(pk) && line.includes('@unique')) {
            line = line.replace('@unique', '@id @default(autoincrement())');
        }
        
        // Change foreign key types from String? @db.ObjectId to Int?
        if (line.includes('@db.ObjectId')) {
            line = line.replace('String?', 'Int?').replace('String', 'Int').replace('@db.ObjectId', '');
        }
        
        // Update relation references: [id] -> references: [Pk]
        if (line.includes('@relation') && line.includes('references: [id]')) {
            // Find which model it relations to
            const relModelMatch = line.match(/(\w+)\s+@relation/);
            const relModelMatchOptional = line.match(/(\w+)\??\s+@relation/);
            
            let relatedModel = null;
            if (relModelMatchOptional) {
                // The type of the relation is the second word on the line usually:
                // e.g. "Patient PatMast @relation..." -> the type is PatMast
                const words = line.trim().split(/\s+/);
                const typeWord = words[1].replace('?', '');
                relatedModel = typeWord;
            }
            
            if (relatedModel && modelToPk[relatedModel]) {
                line = line.replace('references: [id]', `references: [${modelToPk[relatedModel]}]`);
            }
        }
    }
    
    newLines.push(line);
}

// 3. Add SyncLog and SyncConfig models at the end
newLines.push(`
model SyncLog {
  id        Int      @id @default(autoincrement())
  tableName String
  timestamp DateTime @default(now())
  status    String
  records   Int
  error     String?
}

model SyncConfig {
  id           Int      @id @default(autoincrement())
  lastSyncTime DateTime
  status       String
}
`);

fs.writeFileSync(schemaPath, newLines.join('\n'));
console.log('Schema transformed for PostgreSQL.');
