Begin
 
  -- Declaring a variable
  Declare @v_Result Int;
  -- Declaring a variable with a value of 50
  Declare @v_a Int = 50;
  -- Declaring a variable with a value of 100
  Declare @v_b Int = 100;
 
 
  -- Print out Console (For developer).
  -- Using Cast to convert Int to String
  -- Using + operator to concatenate 2 string
  Print 'v_a= ' + Cast(@v_a as varchar(15));
 
  -- Print out Console
  Print 'v_b= ' + Cast(@v_b as varchar(15));
 
  -- Sum
  Set @v_Result = @v_a + @v_b;
 
  -- Print out Console
  Print 'v_Result= ' + Cast(@v_Result as varchar(15));
 
End;