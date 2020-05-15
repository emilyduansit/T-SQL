USE [learningsql]
GO

DECLARE @RC int
DECLARE @p_Emp_Id int
DECLARE @v_First_Name varchar(50)
DECLARE @v_Last_Name varchar(50)
DECLARE @v_Dept_Id int

-- TODO: Set parameter values here.
set  @p_Emp_Id =1

EXECUTE @RC = [dbo].[Get_Employee_Infos] 
   @p_Emp_Id
  ,@v_First_Name OUTPUT
  ,@v_Last_Name OUTPUT
  ,@v_Dept_Id OUTPUT
GO


