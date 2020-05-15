BEGIN
 
 -- Declaring 2 variables x and y
 DECLARE @x integer = 0;
 DECLARE @y integer = 10;
 
 -- Step
 DECLARE @step integer = 0;
 
 -- While @x < @y
 WHILE (@x < @y)
 BEGIN
 
   SET @step = @step + 1;
 
   -- Every time the loop execute, x increases by 1
   SET @x = @x + 1;
   -- Every time the loop execute, y decreases by 1
   SET @y = @y - 2;
 
   PRINT 'Step =' + CAST(@step AS varchar(10));
   PRINT '@x =' + CAST(@x AS varchar(10)) + ' / @y = ' + CAST(@y AS varchar(10));
 
   -- If @x > 2 then exit the loop
   -- (Although conditions in the WHILE is still true).
   IF @x > 2
     BREAK;
 
 END;
 
 -- Write log
 PRINT 'x,y = ' + CAST(@x AS varchar(10)) + ', ' + CAST(@y AS varchar(10));
 
END;