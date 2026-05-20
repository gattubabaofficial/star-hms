import axios from 'axios';
import dotenv from 'dotenv';
import cron from 'node-cron';
import ADODB from 'node-adodb';

dotenv.config();

const API_URL = process.env.API_URL || 'http://localhost:3001';
const SYNC_INTERVAL = process.env.SYNC_INTERVAL || '*/5 * * * *'; // default 5 mins
const DB_PATH = process.env.DB_PATH || 'C:\\HMS\\Database\\HmsWin.mdb';

// Initialize ADODB connection
const connection = ADODB.open(`Provider=Microsoft.Jet.OLEDB.4.0;Data Source=${DB_PATH};`);

console.log('HMS Local Sync Agent starting...');
console.log(`Target API: ${API_URL}`);
console.log(`Sync Interval: ${SYNC_INTERVAL}`);
console.log(`Source Database: ${DB_PATH}`);

/**
 * Sync logic for individual tables
 */
const syncTable = async (tableName: string, apiPath: string, idField: string) => {
  console.log(`[Sync] Checking table: ${tableName}...`);
  try {
    // Query legacy DB for records not yet synced (assuming RecState or similar indicates new/updated)
    // For this replica, we'll try to sync everything that isn't deleted (RecState <> 0)
    // In a production environment, we'd use a RowVersion or SyncFlag
    const records = await connection.query(`SELECT TOP 50 * FROM ${tableName} WHERE RecState <> 0`) as any[];
    
    if (records.length > 0) {
      console.log(`[Sync] Found ${records.length} records in ${tableName}. Pushing to Cloud...`);
      for (const record of records) {
        await axios.post(`${API_URL}/api/${apiPath}`, record);
      }
      console.log(`[Sync] Successfully synced ${tableName}.`);
    } else {
      console.log(`[Sync] No new records for ${tableName}.`);
    }
  } catch (error) {
    console.warn(`[Sync Error] Failed to sync ${tableName}: ${(error as Error).message}`);
  }
};

const syncData = async () => {
  console.log(`[${new Date().toISOString()}] Starting global sync cycle...`);
  try {
    // Phase 12 Focus: Clinical Transactions and Pharmacy
    await syncTable('OutdBlPyt', 'finance/opd/payment', 'ObpCode');
    await syncTable('IndrBlPyt', 'finance/ipd/payment', 'IpdCode');
    await syncTable('MedSaleHdr', 'pharmacy/sales', 'SahCode');
    await syncTable('MedPurchHdr', 'pharmacy/purchases', 'PuhCode');
    
    // Master data sync
    await syncTable('PatMast', 'masters/patients', 'PttCode');
    await syncTable('MedItmMast', 'pharmacy/items', 'SimCode');

    console.log(`[${new Date().toISOString()}] Sync cycle completed.`);
  } catch (error) {
    console.error('Critical Error during sync cycle:', error);
  }
};

// Schedule the sync job
cron.schedule(SYNC_INTERVAL, syncData);

// Startup sequence
console.log('Sync Agent is active and scheduled.');
syncData();
