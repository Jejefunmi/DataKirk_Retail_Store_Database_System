
----Stock Availability Trigger
CREATE trigger Check_Stock_Avalable
on Ordedetails
Before insert, UPDATE
AS
BEGIN
    Declare @available INT
    Declare @inquantity INT
    Declare @productID INT
    ---- Get details from inserted/updated row
    Select @productID = ProductID from inserted
    Select @inquantity = Quantity from inserted
    ---- Check available stock for the Product
    select @available = Available_Stock
    from Stockavailable
    where ProductID = @productID;
    ---- If available stock is less than the inserted quantity
    if(@available < @inquantity)
        begin
            RAISERROR('Insufficient Stock', 16, 1);
            rollback transaction; ---Prevent insert/update Stock is insufficient
        END
END