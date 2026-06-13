# HMS Phase 3 – Data Model Discovery

## Evidence Found in Source
- Total project files: 2554
- VB6 forms discovered: 61

## Inferred Core Tables

patients
patient_categories
doctors
doctor_categories
doctor_roles
referral_categories
referral_sources
services
service_groups
diagnoses
procedures
floors
wards
beds

opd_registrations
opd_receipts
opd_bills
opd_payments
opd_refunds

ipd_admissions
ipd_receipts
ipd_bills
ipd_payments
ipd_refunds
ipd_deposits

lab_receipts
lab_reports
lab_payments
lab_refunds

products
product_groups
product_companies
stock_transactions
purchase_transactions
sales_transactions

users
roles
permissions

account_ledgers
account_groups
voucher_types
journal_entries
bank_transactions
cash_transactions

## ERD Draft Relationships

Patient -> OPD Registration
Patient -> IPD Admission
Patient -> Lab Receipt
Patient -> Pharmacy Bill

Doctor -> OPD Registration
Doctor -> IPD Admission

Floor -> Ward -> Bed

Patient -> Bill -> Payment

Product -> Stock Transaction

User -> Role -> Permission
