---- Email Notification Trigger

CREATE TRIGGER Order_Status_Notification
AFTER UPDATE
ON SalesOrders
AS
BEGIN
  DECLARE @orderId INT, @customerId INT, @salesRepId INT, @orderStatus VARCHAR(50);

  -- Get details from updated row
  SELECT @orderId = OrderID, @customerId = CustomerID, @salesRepId = SalesRepID, @orderStatus = [dbo].[fn_GetOrderStatusName]([Status]) -- Replace with your function to get status name
  FROM inserted;

  -- Identify recipients (customer and/or sales rep based on your logic)
  DECLARE @customerEmail VARCHAR(255), @salesRepEmail VARCHAR(255);

  SELECT @customerEmail = Email FROM Customers WHERE CustomerID = @customerId;
  SELECT @salesRepEmail = Email FROM SalesRepresentatives WHERE SalesRepID = @salesRepId;

  -- Implement email delivery mechanism here (outside the trigger)
  -- This example demonstrates the concept but doesn't send actual emails
  IF @customerEmail IS NOT NULL
  BEGIN
    -- Send email notification to customer about order details and status change
    -- Use @orderId, @customerEmail, and other relevant data to construct the email content
  END;

  IF @salesRepEmail IS NOT NULL
  BEGIN
    -- Send email notification to sales rep about order details and status change
    -- Use @orderId, @salesRepEmail, and other relevant data to construct the email content
  END;
END;