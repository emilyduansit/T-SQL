-- Check the existence of the function
-- If it did exist, should drop it in order to create a new one.
IF OBJECT_ID(N'dbo.My_Sum', N'FN') IS NOT NULL
DROP FUNCTION My_Sum;
GO
 
CREATE FUNCTION My_Sum (@p_a float, @p_b float)
RETURNS float
AS
BEGIN
 
-- Declaring a variable type of Float
DECLARE @v_C float;
 
-- Assign value for v_C
SET @V_C = @p_A + @p_B;
 
-- Return value.
RETURN @v_C;
 
END;