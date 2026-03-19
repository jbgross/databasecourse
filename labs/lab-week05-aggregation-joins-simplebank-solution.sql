-- Lab: Aggregation and Joins with simple_bank (PostgreSQL) - Solution
-- Data source: simple_bank/simple_bank_db_postgres.sql

-- 1. Count the number of bank accounts by account type.
--    Return columns: account_type, account_count
--    Order by account_type.
--    Expected rows: 2
SELECT account_type, COUNT(*) AS account_count
FROM bank_account
GROUP BY account_type
ORDER BY account_type;

-- 2. Show each account_id and the number of transactions for that account.
--    Return columns: account_id, tx_count
--    Order by account_id.
--    Expected rows: 10
SELECT account_id, COUNT(*) AS tx_count
FROM account_transaction
GROUP BY account_id
ORDER BY account_id;

-- 3. For transactions in 2025 only, show the average transaction amount by transaction_type.
--    Return columns: transaction_type, avg_amount
--    Order by transaction_type.
--    Expected rows: 3
SELECT transaction_type, AVG(amount) AS avg_amount
FROM account_transaction
WHERE transaction_time >= '2025-01-01'
  AND transaction_time < '2026-01-01'
GROUP BY transaction_type
ORDER BY transaction_type;

-- 4. List checking account information with holder names.
--    Return columns: holder_name, account_id, account_type, balance
--    Use a join between account_holder and bank_account.
--    Order by holder_name.
--    Expected rows: 5
SELECT h.holder_name, b.account_id, b.account_type, b.balance
FROM account_holder h
JOIN bank_account b ON b.holder_id = h.holder_id
WHERE b.account_type = 'Checking'
ORDER BY h.holder_name;

-- 5. Count deposit transactions per account holder.
--    Return columns: holder_id, holder_name, deposit_count
--    Include only holders with at least one deposit transaction.
--    Use joins across account_holder, bank_account, and account_transaction.
--    Order by holder_id.
--    Expected rows: 8
SELECT h.holder_id, h.holder_name, COUNT(*) AS deposit_count
FROM account_holder h
JOIN bank_account b ON b.holder_id = h.holder_id
JOIN account_transaction tx ON tx.account_id = b.account_id
WHERE tx.transaction_type = 'Deposit'
GROUP BY h.holder_id, h.holder_name
ORDER BY h.holder_id;

-- 6. Self join problem: find account holders who have both a checking and a savings account.
--    Return columns: holder_id, holder_name, checking_account_id, savings_account_id
--    Use a self join on bank_account.
--    Order by holder_id.
--    Expected rows: 2
SELECT c.holder_id,
       h.holder_name,
       c.account_id AS checking_account_id,
       s.account_id AS savings_account_id
FROM bank_account c
JOIN bank_account s ON s.holder_id = c.holder_id
JOIN account_holder h ON h.holder_id = c.holder_id
WHERE c.account_type = 'Checking'
  AND s.account_type = 'Savings'
ORDER BY c.holder_id;

-- 7. Outer join problem: list all account holders and any accounts they have.
--    Return columns: holder_id, holder_name, account_id, account_type
--    Include holders with no accounts.
--    Use LEFT OUTER JOIN.
--    Order by holder_id, account_id.
--    Expected rows: 11
SELECT h.holder_id, h.holder_name, b.account_id, b.account_type
FROM account_holder h
LEFT OUTER JOIN bank_account b ON b.holder_id = h.holder_id
ORDER BY h.holder_id, b.account_id;

-- 8. Count deposit transactions by account type.
--    Return columns: account_type, deposit_tx_count
--    Use a join between bank_account and account_transaction.
--    Order by account_type.
--    Expected rows: 2
SELECT b.account_type, COUNT(*) AS deposit_tx_count
FROM bank_account b
JOIN account_transaction tx ON tx.account_id = b.account_id
WHERE tx.transaction_type = 'Deposit'
GROUP BY b.account_type
ORDER BY b.account_type;

-- 9. Show all holders with the number of accounts each holder has.
--    Return columns: holder_id, holder_name, account_count
--    Include holders with zero accounts.
--    Use LEFT OUTER JOIN and aggregation.
--    Order by holder_id.
--    Expected rows: 9
SELECT h.holder_id, h.holder_name, COUNT(b.account_id) AS account_count
FROM account_holder h
LEFT OUTER JOIN bank_account b ON b.holder_id = h.holder_id
GROUP BY h.holder_id, h.holder_name
ORDER BY h.holder_id;
