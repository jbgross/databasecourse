-- Lab: Aggregation and Joins with simple_bank (PostgreSQL)
-- Data source: simple_bank/simple_bank_db_postgres.sql

-- 1. Count the number of bank accounts by account type.
--    Return columns: account_type, account_count
--    Order by account_type.
--    Expected rows: 2
SELECT 1;

-- 2. Show each account_id and the number of transactions for that account.
--    Return columns: account_id, tx_count
--    Order by account_id.
--    Expected rows: 10
SELECT 2;

-- 3. For transactions in 2025 only, show the average transaction amount by transaction_type.
--    Return columns: transaction_type, avg_amount
--    Order by transaction_type.
--    Expected rows: 3
SELECT 3;

-- 4. List checking account information with holder names.
--    Return columns: holder_name, account_id, account_type, balance
--    Use a join between account_holder and bank_account.
--    Order by holder_name.
--    Expected rows: 5
SELECT 4;

-- 5. Count deposit transactions per account holder.
--    Return columns: holder_id, holder_name, deposit_count
--    Include only holders with at least one deposit transaction.
--    Use joins across account_holder, bank_account, and account_transaction.
--    Order by holder_id.
--    Expected rows: 8
SELECT 5;

-- 6. Self join problem: find account holders who have both a checking and a savings account.
--    Return columns: holder_id, holder_name, checking_account_id, savings_account_id
--    Use a self join on bank_account.
--    Order by holder_id.
--    Expected rows: 2
SELECT 6;

-- 7. Outer join problem: list all account holders and any accounts they have.
--    Return columns: holder_id, holder_name, account_id, account_type
--    Include holders with no accounts.
--    Use LEFT OUTER JOIN.
--    Order by holder_id, account_id.
--    Expected rows: 11
SELECT 7;

-- 8. Count deposit transactions by account type.
--    Return columns: account_type, deposit_tx_count
--    Use a join between bank_account and account_transaction.
--    Order by account_type.
--    Expected rows: 2
SELECT 8;

-- 9. Show all holders with the number of accounts each holder has.
--    Return columns: holder_id, holder_name, account_count
--    Include holders with zero accounts.
--    Use LEFT OUTER JOIN and aggregation.
--    Order by holder_id.
--    Expected rows: 9
SELECT 9;
