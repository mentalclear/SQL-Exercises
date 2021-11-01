

-- +------------+--------------+---------+
-- | account_id | acct_type    | balance |
-- +------------+--------------+---------+
-- |        123 | MONEY MARKET |  785.22 |
-- |        456 | SAVINGS      |    0.00 |
-- |        789 | CHECKING     | -324.22 |
-- +------------+--------------+---------+

SELECT account_id, SIGN(balance), ABS(balance)
FROM account;