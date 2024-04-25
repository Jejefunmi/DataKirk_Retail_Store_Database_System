----Order Total Calculation Trigger
Create Trigger TotalAmount_Calculation
on OrderDetails
After Insert, Update, DELETE
AS
BEGIN
    DECLARE @orderID int, @ totalAmount INT

    ---- Insert LOgic
    IF EXISTS (Select 1 from inserted)
    BEGIN
        SELECT @orderID = OrderID from Inserted;
        Select @totalAmount =Sum (Quantity * UnitPrice) from Inserted;

        Update SaleOrders
        SET TotalAmount = @totalAmount 
        Where OrderID = @orderId;
    END

    -- Update logic 
    IF EXISTS (SELECT 1 from DELETE)
    BEGIN
        SELECT @orderID = orderID from deleted;
        SELECT @totalAmount = sum (Quantity * UnitPrice) FROM deleted;

        Update SalesOrders
        SET TotalAmount = TotalAmount - @totalAmount
        Where orderID = @orderid;
    END;
END;