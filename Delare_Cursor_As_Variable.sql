USE learningsql;
 
BEGIN
 
--  
-- Declare a variable:
DECLARE @v_Emp_ID integer;
DECLARE @v_First_Name varchar(50);
DECLARE @v_Last_Name varchar(50);
 
-- Declaring a cursor variable.
DECLARE @My_Cursor CURSOR;
 
-- Set Select statement for CURSOR variable.
Set @My_Cursor = CURSOR FOR
SELECT
  Emp.EMP_ID,
  Emp.FIRST_NAME,
  Emp.LAST_NAME
FROM Employee Emp
WHERE Emp.EMP_ID < 3;
 
 
-- Open Cursor
OPEN @My_Cursor;
 
-- Move the cursor to the first line.
-- And assign column values to the variables.
FETCH NEXT FROM @My_Cursor INTO @v_Emp_ID, @v_First_Name, @v_Last_Name;
 
-- The FETCH statement was successful. ( @@FETCH_STATUS = 0)
WHILE @@FETCH_STATUS = 0
BEGIN
  PRINT 'First Name = '+ @v_First_Name+' / Last Name = '+ @v_Last_Name;
 
  -- Move to the next record.
  -- And assign column values to the variables.
  FETCH NEXT FROM @My_Cursor INTO @v_Emp_ID, @v_First_Name, @v_Last_Name;
END
 
-- Close Cursor.
CLOSE @My_Cursor;
DEALLOCATE @My_Cursor;
 
END;