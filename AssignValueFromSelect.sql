BEGIN
 
-- Declaring a variable @v_Emp_ID
DECLARE @v_Emp_ID integer = 1;
 
DECLARE @v_First_Name varchar(30);
DECLARE @v_Last_Name varchar(30);
DECLARE @v_Dept_ID integer;
 
-- Assgin values to variables
SELECT
  @v_First_Name = emp.First_Name,
  @v_Last_Name = emp.Last_Name,
  @v_Dept_Id = emp.Dept_Id
FROM Employee Emp
WHERE Emp.Emp_ID = @v_Emp_Id;
 
-- Print out values
PRINT '@v_First_Name = ' + @v_First_Name;
PRINT '@v_Last_Name = ' + @v_Last_Name;
PRINT '@v_Dept_Id = ' + CAST(@v_Dept_ID AS varchar(15));
 
END;