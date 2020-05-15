BEGIN
 
-- Using SELECT INTO statement to insert data into #v_My_Table.  
SELECT
  emp.First_Name,
  emp.Last_Name,
  emp.Dept_Id,
  1000 Salary INTO #v_My_Table
FROM Employee Emp
WHERE Emp.Emp_ID < 4;
 
-- Update #v_My_Table
UPDATE #v_My_Table
SET Salary = Salary + 100
WHERE First_name = 'Susan';
 
-- Query #v_My_Table.
SELECT
  *
FROM #v_My_Table;
 
END;