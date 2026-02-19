SELECT count(*)
FROM account_transaction;

SELECT count(*), transaction_time
FROM account_transaction;

SELECT count(*), transaction_type
FROM account_transaction
WHERE transaction_time < '2026-01-01';

SELECT count(*), transaction_type
FROM account_transaction
GROUP BY transaction_type;

SELECT count(*), transaction_type
FROM account_transaction
WHERE transaction_time < '2026-01-01'
GROUP BY transaction_type;

SELECT sum(amount), account_id
FROM account_transaction
GROUP BY account_id;

SELECT avg(amount), transaction_type
FROM account_transaction
WHERE transaction_time < '2026-01-01'
GROUP BY transaction_type;

SELECT sum(atx.amount) as sum, atx.account_id
FROM account_transaction atx
GROUP BY atx.account_id;