-- 1. Show the names and birthdates of all account holders, in alphabetical order by name?

SELECT holder_name, birthdate
FROM account_holder
ORDER BY holder_name;

-- 2. Show the balances and account types of all bank accounts, ordered from highest balance to lowest?

SELECT balance, account_type
FROM bank_account
ORDER BY balance DESC;

-- 3. Show the holder_id and balance of all accounts that have accounts with a balance greater than 1000?  return the results ordered by holder_id

SELECT holder_id, balance
FROM bank_account
WHERE balance > 1000
ORDER BY holder_id;

-- 4. Show all attributes of bank accounts that are Savings accounts AND have a balance greater than 5000?

SELECT *
FROM bank_account
WHERE account_type = 'Savings'
  AND balance > 5000
ORDER BY balance;

-- 5. Show the account ID, type, and balance for all accounts that are either Checking accounts OR have a balance less than 100?

SELECT account_id, account_type, balance
FROM bank_account
WHERE account_type = 'Checking'
   OR balance < 100
ORDER BY balance;



-- 6. Show the account ID and balance for all accounts with balances between 100 and 1000 (inclusive)?

SELECT account_id, balance
FROM bank_account
WHERE balance BETWEEN 100 AND 1000
ORDER BY balance;

-- 7. Show the holder ID, the account ID, and the account type for all accounts that are in either Checking or Savings? (IN condition)

SELECT holder_id, account_id, account_type
FROM bank_account
WHERE account_type IN ('Checking', 'Savings')
ORDER BY holder_id, account_id;

-- 8. Show the account ID, account type, and interest rate for all accounts have an interest rate set, and which do not? (IS NOT NULL and IS NULL)

SELECT account_id, account_type, interest_rate
FROM bank_account
WHERE interest_rate IS NOT NULL
ORDER BY account_id;

-- 9. Show the name and birthdate of all account holders whose names
-- are at least 7 characters long
SELECT holder_name, birthdate
FROM account_holder
WHERE holder_name LIKE '_______%';

-- 10. Show the name and birthdate of all account holders whose
-- names begin with the letter 'A'
SELECT holder_name, birthdate
FROM account_holder
WHERE holder_name LIKE 'A%';


