BEGIN
 
 -- Declaring 2 variables x and y.
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
   -- Every time the loop execute, x decreases by 2
   SET @y = @y - 2;
 
   -- If @x < 3 , then skip the statements below
   -- And continue new step
   IF @x < 3
     CONTINUE;
 
   -- If @x < 3 the statements below 'CONTINUE' will not be run.
   PRINT 'Step =' + CAST(@step AS varchar(10));
   PRINT '@x =' + CAST(@x AS varchar(10)) + ' / @y = ' + CAST(@y AS varchar(10));
 
 END;
 
 -- Write log
 PRINT 'x,y = ' + CAST(@x AS varchar(10)) + ', ' + CAST(@y AS varchar(10));
 
END;