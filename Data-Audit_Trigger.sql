---Data-Audit_Trigger

CREATE TRIGGER Product_Audit_Trigger
AFTER INSERT, UPDATE, DELETE
ON Products
AS
BEGIN
  DECLARE @id INT, @time DATETIME, @operation VARCHAR(20);

  SET @time = GETDATE(); -- Use GETDATE for more precise timestamps

  IF EXISTS (SELECT 1 FROM inserted)
  BEGIN
    SET @id = inserted.ProductID;
    SET @operation = 'INSERT';

    INSERT INTO Audit_table (id, operation, Time, Table_name)
    VALUES (@id, @operation, @time, 'Products');
  END;

  IF EXISTS (SELECT 1 FROM deleted)
  BEGIN
    SET @id = deleted.ProductID;
    SET @operation = 'DELETE';

    INSERT INTO Audit_table (id, operation, Time, Table_name)
    VALUES (@id, @operation, @time, 'Products');
  END;

  -- Add logic for UPDATE operation if needed (capturing old and new values)
END;