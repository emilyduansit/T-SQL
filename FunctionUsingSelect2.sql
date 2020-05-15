SELECT
  acc.account_id,
  acc.cust_id,
  acc.avail_balance,
  acc.pending_balance,
  dbo.MY_SUM(acc.avail_balance, acc.pending_balance) balance
FROM account acc;