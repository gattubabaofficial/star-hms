const fs = require('fs');
const path = require('path');

function walk(dir) {
  let results = [];
  const list = fs.readdirSync(dir);
  list.forEach(file => {
    file = path.join(dir, file);
    const stat = fs.statSync(file);
    if (stat && stat.isDirectory()) {
      results = results.concat(walk(file));
    } else {
      if (file.endsWith('.ts') || file.endsWith('.tsx')) {
        results.push(file);
      }
    }
  });
  return results;
}

const files = walk('src');

files.forEach(f => {
  let contents = fs.readFileSync(f, 'utf8');
  let original = contents;
  
  // Replace ../../lib/prisma with @/lib/prisma
  contents = contents.replace(/['"](\.\.\/)+lib\/prisma['"]/g, "'@/lib/prisma'");
  contents = contents.replace(/['"](\.\.\/)+lib\/auth['"]/g, "'@/lib/auth'");
  contents = contents.replace(/['"](\.\.\/)+lib\/apiClient['"]/g, "'@/lib/apiClient'");
  contents = contents.replace(/['"](\.\.\/)+components\/shared\/([^'"]+)['"]/g, "'@/components/shared/$2'");

  if (contents !== original) {
    fs.writeFileSync(f, contents, 'utf8');
    console.log(`Updated ${f}`);
  }
});
