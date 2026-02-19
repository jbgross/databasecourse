-- Cartesian product
SELECT b.balance, b.account_type, h.holder_name
FROM bank_account b, account_holder h;

-- See all Checking account information, including holder
SELECT b.balance, b.account_type, h.holder_name
FROM bank_account b, account_holder h
WHERE
    b.holder_id = h.holder_id
    AND
    b.account_type = 'Checking';

-- See account and holder information
SELECT b.balance, b.account_type, h.holder_name
FROM bank_account b
  NATURAL JOIN account_holder h
WHERE
  b.account_type = 'Checking';

SELECT b.balance, b.account_type, h.holder_name
FROM bank_account b
  INNER JOIN account_holder h USING(holder_id)
WHERE
  b.account_type = 'Checking';

SELECT b.balance, b.account_type, h.holder_name
FROM bank_account b
  INNER JOIN account_holder h 
    ON h.holder_id = b.holder_id
WHERE
  b.account_type = 'Checking';

-- See account holder and deposit information information for checking accounts
SELECT h.holder_name, tx.amount, tx.transaction_time
FROM account_holder AS h
  JOIN bank_account b ON b.holder_id = h.holder_id
  JOIN account_transaction tx 
    ON tx.account_id = b.account_id 
WHERE
  b.account_type = 'Checking'
  AND
  tx.transaction_type = 'Deposit';

-- Find checking accounts that have savings accounts for same account holder
SELECT c.balance, c.account_type, s.balance, 
  s.account_type, c.holder_id
FROM bank_account c JOIN bank_account s 
    ON c.holder_id = s.holder_id
WHERE
  c.account_type = 'Checking'
  AND
  s.account_type = 'Savings';


-- Find checking accounts that have savings accounts for same account holder
-- Include checking accounts with no savings account (null values)
-- Doesn't work - WHERE clause happens too early
SELECT c.balance, c.account_type, s.balance, 
  s.account_type, c.holder_id
FROM bank_account c LEFT OUTER JOIN bank_account s 
    ON c.holder_id = s.holder_id
WHERE
  c.account_type = 'Checking'
  AND
  s.account_type = 'Savings';

-- Fixed
SELECT c.balance, c.account_type, s.balance, 
  s.account_type, c.holder_id
FROM bank_account c LEFT OUTER JOIN bank_account s 
    ON c.holder_id = s.holder_id
    AND s.account_type = 'Savings'
WHERE
  c.account_type = 'Checking';

