BEGIN
 
-- In this example the accounts ACCOUNT_ID = 1, 2 actually exists in DB
-- In fact you can write statements to check before the start of transaction
--
-- account A (Already guarantees exist in DB)
DECLARE @Account_Id_A integer = 1;
-- account B (Already guarantees exist in DB)
DECLARE @Account_Id_B integer = 2;
-- Amount
DECLARE @Amount float = 10;
-- Bank
DECLARE @Execute_Branch_Id integer = 1;
 
-- Write out transaction Count.
-- In fact, at this time there is no transaction yet
PRINT '@@TranCount = ' + CAST(@@Trancount AS varchar(5));
 
PRINT 'Begin transaction';
 
-- Begin transaction
BEGIN TRAN;
 
  -- Error trapping.
  BEGIN TRY
    --
    -- Subtract $10 from account A
    UPDATE Account
    SET AVAIL_BALANCE = AVAIL_BALANCE - @Amount
    WHERE Account_Id = @Account_Id_A;
    --
    -- Insert transaction info  into Acc_Transaction table.
    INSERT INTO ACC_TRANSACTION (TXN_DATE, FUNDS_AVAIL_DATE, TXN_TYPE_CD,
     ACCOUNT_ID, AMOUNT, EXECUTION_BRANCH_ID)
      VALUES (CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'CDT',
       @Account_Id_A, -@Amount, @Execute_Branch_Id);
    --
    -- Add $10 to Account B.
    UPDATE Account
    SET AVAIL_BALANCE = AVAIL_BALANCE + @Amount
    WHERE Account_Id = @Account_Id_B;
    --
    -- Insert transaction info  into Acc_Transaction table.
    INSERT INTO ACC_TRANSACTION (TXN_DATE, FUNDS_AVAIL_DATE, TXN_TYPE_CD,
      ACCOUNT_ID, AMOUNT, EXECUTION_BRANCH_ID)
      VALUES (CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'CDT', @Account_Id_B,
       @Amount, @Execute_Branch_Id);
    -- Commit transaction
    IF @@Trancount > 0
      PRINT 'Commit Transaction';
  COMMIT TRAN;
 
END TRY
-- If there are errors Catch block will be execute.
BEGIN CATCH
  PRINT 'Error: ' + ERROR_MESSAGE();
  PRINT 'Error --> Rollback Transaction';
  IF @@Trancount > 0
    ROLLBACK TRAN;
END CATCH;
 
 
 
END;