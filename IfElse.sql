BEGIN
 
 -- Declare a variable
 DECLARE @v_Option integer;
 DECLARE @v_Action varchar(30);
 
 SET @v_Option = 2;
 
 IF @v_Option = 1
   SET @v_Action = 'Run';
 ELSE IF @v_Option = 2
     BEGIN
       PRINT 'In block else if @v_Option = 2';
       SET @v_Action = 'Backup';
     END;
 ELSE IF @v_Option = 3
   SET @v_Action = 'Stop';
 ELSE
   SET @v_Action = 'Invalid';
 
 
 -- Logging
 PRINT '@v_Action= ' + @v_Action;
 
END;