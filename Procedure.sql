-- Drop procedure Get_Employee_Infos if it already exists.
-- (To enable recreate)
IF OBJECT_ID(N'dbo.Get_Employee_Infos', N'P') IS NOT NULL
 DROP PROCEDURE Get_Employee_Infos;
GO
 
-- Procedure with input parameter: p_Emp_Id
-- And output: v_First_Name, v_Last_Name, v_Dept_Id.
CREATE PROCEDURE Get_Employee_Infos (@p_Emp_Id integer
       , @v_First_Name varchar(50) OUTPUT
       , @v_Last_Name varchar(50) OUTPUT
       , @v_Dept_Id integer OUTPUT)
AS
BEGIN
 -- Use the Print command to print out a string (for programmers).
 -- Use Cast to convert Integer to string (Varchar).
 -- Use the + operator to concatenate two strings.
 PRINT 'Parameter @p_Emp_Id = ' + CAST(@p_Emp_ID AS varchar(15));
 --
 -- Query data from the table and assign values to variables.
 --
 SELECT
   @v_First_Name = Emp.First_Name,
   @v_Last_Name = Emp.Last_Name,
   @v_Dept_Id = Emp.Dept_Id
 FROM Employee Emp
 WHERE Emp.Emp_Id = @p_Emp_Id;
 
 --
 -- Log (For developers).
 --
 PRINT 'Found Record!';
 PRINT ' @v_First_Name= ' + @v_First_Name;
 PRINT ' @v_Last_Name= ' + @v_Last_Name;
 PRINT ' @v_Dept_Id= ' + CAST(@v_Dept_Id AS varchar(15));
 
END;