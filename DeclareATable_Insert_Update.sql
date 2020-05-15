BEGIN
 
 DECLARE @v_Emp_ID integer = 1;
 
 -- Declare a variable of type TABLE.
 DECLARE @v_Table TABLE (
   First_Name varchar(30),
   Last_Name varchar(30),
   Dept_Id integer,
   Salary float DEFAULT 1000
 );
 
 -- Using INSERT INTO statement to insert data into @v_Table.
 INSERT INTO @v_Table (First_name, Last_Name, Dept_ID)
   SELECT
     emp.First_Name,
     emp.Last_Name,
     emp.Dept_Id
   FROM Employee Emp
   WHERE Emp.Emp_ID < 4;
 
 -- Update @v_Table
 UPDATE @v_Table
 SET Salary = Salary + 100
 WHERE First_name = 'Susan';
 
 -- Query @v_Table.
 SELECT
   *
 FROM @v_Table;
 
END;