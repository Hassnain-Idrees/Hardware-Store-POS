-- Stored Procedures And Triggers

-- Cashier Login

-- Insert
CREATE PROCEDURE InsertCashier
    @password VARCHAR(255)
AS
BEGIN
    -- Insert the cashier into CashierLogin table
    INSERT INTO CashierLogin (password)
    VALUES (@password);
    
    SELECT SCOPE_IDENTITY() AS cashier_id; -- Return the generated cashier_id
END;


-- Deletion
CREATE PROCEDURE DeleteCashier
    @cashier_id INT
AS
BEGIN
    -- Check if the cashier exists
    IF EXISTS (SELECT 1 FROM CashierLogin WHERE cashier_id = @cashier_id)
    BEGIN
        -- Delete the cashier
        DELETE FROM CashierLogin WHERE cashier_id = @cashier_id;
        
        SELECT 'Cashier deleted successfully.' AS Message;
    END
    ELSE
    BEGIN
        SELECT 'Cashier with provided ID does not exist.' AS Message;
    END
END;


-- Updation
CREATE PROCEDURE UpdateCashierPassword
    @cashier_id INT,
    @new_password VARCHAR(255)
AS
BEGIN
    -- Check if the cashier exists
    IF EXISTS (SELECT 1 FROM CashierLogin WHERE cashier_id = @cashier_id)
    BEGIN
        -- Update the password
        UPDATE CashierLogin SET password = @new_password WHERE cashier_id = @cashier_id;
        
        SELECT 'Cashier password updated successfully.' AS Message;
    END
    ELSE
    BEGIN
        SELECT 'Cashier with provided ID does not exist.' AS Message;
    END
END;

-- Login
CREATE PROCEDURE CashierLoginProcedure1
    @cashier_id INT,
    @password VARCHAR(255)
AS
BEGIN
    DECLARE @actual_password VARCHAR(255);

    -- Get the actual password for the provided cashier ID
    SELECT @actual_password = password FROM CashierLogin WHERE cashier_id = @cashier_id;

    -- Check if the provided password matches the actual password
    IF @actual_password IS NOT NULL AND @actual_password = @password
    BEGIN
        -- Password matched, return success message or any additional actions
        SELECT 'Login successful.' AS Message;
    END
    ELSE
    BEGIN
        -- Password did not match or cashier ID not found, return error message
        SELECT 'Invalid credentials. Please check your ID and password.' AS Message;
    END
END;





-- OwnerLogin

-- Insert
CREATE PROCEDURE InsertOwner
    @password VARCHAR(255)
AS
BEGIN
    -- Insert the owner into OwnerLogin table
    INSERT INTO OwnerLogin (password)
    VALUES (@password);
    
    SELECT SCOPE_IDENTITY() AS owner_id; -- Return the generated owner_id
END;


-- Deletion
CREATE PROCEDURE DeleteOwner
    @owner_id INT
AS
BEGIN
    -- Check if the owner exists
    IF EXISTS (SELECT 1 FROM OwnerLogin WHERE owner_id = @owner_id)
    BEGIN
        -- Delete the owner
        DELETE FROM OwnerLogin WHERE owner_id = @owner_id;
        
        SELECT 'Owner deleted successfully.' AS Message;
    END
    ELSE
    BEGIN
        SELECT 'Owner with provided ID does not exist.' AS Message;
    END
END;

-- Updation
CREATE PROCEDURE UpdateOwnerPassword
    @owner_id INT,
    @new_password VARCHAR(255)
AS
BEGIN
    -- Check if the owner exists
    IF EXISTS (SELECT 1 FROM OwnerLogin WHERE owner_id = @owner_id)
    BEGIN
        -- Update the password
        UPDATE OwnerLogin SET password = @new_password WHERE owner_id = @owner_id;
        
        SELECT 'Owner password updated successfully.' AS Message;
    END
    ELSE
    BEGIN
        SELECT 'Owner with provided ID does not exist.' AS Message;
    END
END;

-- Login
CREATE PROCEDURE OwnerLoginProcedure
    @owner_id INT,
    @password VARCHAR(255)
AS
BEGIN
    DECLARE @actual_password VARCHAR(255);

    -- Get the actual password for the provided owner ID
    SELECT @actual_password = password FROM OwnerLogin WHERE owner_id = @owner_id;

    -- Check if the provided password matches the actual password
    IF @actual_password IS NOT NULL AND @actual_password = @password
    BEGIN
        -- Password matched, return success message or any additional actions
        SELECT 'Login successful.' AS Message;
    END
    ELSE
    BEGIN
        -- Password did not match or owner ID not found, return error message
        SELECT 'Invalid credentials. Please check your ID and password.' AS Message;
    END
END;



-- Customer

-- Insert
CREATE PROCEDURE InsertCustomer
    @first_name VARCHAR(255),
    @last_name VARCHAR(255),
    @email VARCHAR(255),
    @phone_number VARCHAR(255),
    @address VARCHAR(255)
AS
BEGIN
    -- Insert the customer into Customer table
    INSERT INTO Customer (first_name, last_name, email, phone_number, address)
    VALUES (@first_name, @last_name, @email, @phone_number, @address);
    
    SELECT SCOPE_IDENTITY() AS customer_id; -- Return the generated customer_id
END;

-- Deletion
CREATE PROCEDURE DeleteCustomer
    @customer_id INT
AS
BEGIN
    -- Check if the customer exists
    IF EXISTS (SELECT 1 FROM Customer WHERE customer_id = @customer_id)
    BEGIN
        -- Delete the customer
        DELETE FROM Customer WHERE customer_id = @customer_id;
        
        SELECT 'Customer deleted successfully.' AS Message;
    END
    ELSE
    BEGIN
        SELECT 'Customer with provided ID does not exist.' AS Message;
    END
END;

-- Updation
CREATE PROCEDURE UpdateCustomer
    @customer_id INT,
    @first_name VARCHAR(255),
    @last_name VARCHAR(255),
    @email VARCHAR(255),
    @phone_number VARCHAR(255),
    @address VARCHAR(255)
AS
BEGIN
    -- Check if the customer exists
    IF EXISTS (SELECT 1 FROM Customer WHERE customer_id = @customer_id)
    BEGIN
        -- Update the customer information
        UPDATE Customer
        SET first_name = @first_name,
            last_name = @last_name,
            email = @email,
            phone_number = @phone_number,
            address = @address
        WHERE customer_id = @customer_id;
        
        SELECT 'Customer information updated successfully.' AS Message;
    END
    ELSE
    BEGIN
        SELECT 'Customer with provided ID does not exist.' AS Message;
    END
END;


-- Product

--Insert
CREATE PROCEDURE InsertProduct
    @name VARCHAR(255),
    @company_name VARCHAR(255),
    @unit_price DECIMAL(10,2),
    @tax DECIMAL(10,2),
    @sales_price DECIMAL(10,2),
    @unit_quantity INT
AS
BEGIN
    -- Insert the product into Product table
    INSERT INTO Product (name, company_name, unit_price, tax, sales_price, unit_quantity)
    VALUES (@name, @company_name, @unit_price, @tax, @sales_price, @unit_quantity);
    
    SELECT SCOPE_IDENTITY() AS product_id; -- Return the generated product_id
END;

-- Deletion
CREATE PROCEDURE DeleteProduct
    @product_id INT
AS
BEGIN
    -- Check if the product exists
    IF EXISTS (SELECT 1 FROM Product WHERE product_id = @product_id)
    BEGIN
        -- Delete the product
        DELETE FROM Product WHERE product_id = @product_id;
        
        SELECT 'Product deleted successfully.' AS Message;
    END
    ELSE
    BEGIN
        SELECT 'Product with provided ID does not exist.' AS Message;
    END
END;

-- Updation
CREATE PROCEDURE UpdateProduct
    @product_id INT,
    @name VARCHAR(255),
    @company_name VARCHAR(255),
    @unit_price DECIMAL(10,2),
    @tax DECIMAL(10,2),
    @sales_price DECIMAL(10,2),
    @unit_quantity INT
AS
BEGIN
    -- Check if the product exists
    IF EXISTS (SELECT 1 FROM Product WHERE product_id = @product_id)
    BEGIN
        -- Update the product details
        UPDATE Product 
        SET name = @name,
            company_name = @company_name,
            unit_price = @unit_price,
            tax = @tax,
            sales_price = @sales_price,
            unit_quantity = @unit_quantity
        WHERE product_id = @product_id;
        
        SELECT 'Product details updated successfully.' AS Message;
    END
    ELSE
    BEGIN
        SELECT 'Product with provided ID does not exist.' AS Message;
    END
END;


-- Invoice

-- Insert
CREATE PROCEDURE InsertInvoice
    @product_id INT,
    @name VARCHAR(255),
    @quantity INT,
    @unit VARCHAR(255),
    @gst DECIMAL(10,2),
    @total DECIMAL(10,2)
AS
BEGIN
    -- Insert the invoice into Invoice table
    INSERT INTO Invoice (product_id, name, quantity, unit, gst, total)
    VALUES (@product_id, @name, @quantity, @unit, @gst, @total);
    
    SELECT SCOPE_IDENTITY() AS invoice_id; -- Return the generated invoice_id
END;

-- Deletion
CREATE PROCEDURE DeleteInvoice
    @invoice_id INT
AS
BEGIN
    -- Check if the invoice exists
    IF EXISTS (SELECT 1 FROM Invoice WHERE invoice_id = @invoice_id)
    BEGIN
        -- Delete the invoice
        DELETE FROM Invoice WHERE invoice_id = @invoice_id;
        
        SELECT 'Invoice deleted successfully.' AS Message;
    END
    ELSE
    BEGIN
        SELECT 'Invoice with provided ID does not exist.' AS Message;
    END
END;

-- Updation
CREATE PROCEDURE UpdateInvoice
    @invoice_id INT,
    @product_id INT,
    @name VARCHAR(255),
    @quantity INT,
    @unit VARCHAR(255),
    @gst DECIMAL(10,2),
    @total DECIMAL(10,2)
AS
BEGIN
    -- Check if the invoice exists
    IF EXISTS (SELECT 1 FROM Invoice WHERE invoice_id = @invoice_id)
    BEGIN
        -- Update the invoice
        UPDATE Invoice 
        SET 
            product_id = @product_id,
            name = @name,
            quantity = @quantity,
            unit = @unit,
            gst = @gst,
            total = @total
        WHERE invoice_id = @invoice_id;
        
        SELECT 'Invoice updated successfully.' AS Message;
    END
    ELSE
    BEGIN
        SELECT 'Invoice with provided ID does not exist.' AS Message;
    END
END;


-- Returns

-- Insert
CREATE PROCEDURE InsertReturn
    @product_id INT,
    @invoice_id INT,
    @reason VARCHAR(255),
    @date_return DATE
AS
BEGIN
    -- Insert the return into Returns table
    INSERT INTO Returns (product_id, invoice_id, reason, date_return)
    VALUES (@product_id, @invoice_id, @reason, @date_return);
    
    SELECT SCOPE_IDENTITY() AS return_id; -- Return the generated return_id
END;

-- Delete
CREATE PROCEDURE DeleteReturn
    @return_id INT
AS
BEGIN
    -- Check if the return exists
    IF EXISTS (SELECT 1 FROM Returns WHERE return_id = @return_id)
    BEGIN
        -- Delete the return
        DELETE FROM Returns WHERE return_id = @return_id;
        
        SELECT 'Return deleted successfully.' AS Message;
    END
    ELSE
    BEGIN
        SELECT 'Return with provided ID does not exist.' AS Message;
    END
END;

-- Updation
CREATE PROCEDURE UpdateReturn
    @return_id INT,
    @product_id INT,
    @invoice_id INT,
    @reason VARCHAR(255),
    @date_return DATE
AS
BEGIN
    -- Check if the return exists
    IF EXISTS (SELECT 1 FROM Returns WHERE return_id = @return_id)
    BEGIN
        -- Update the return
        UPDATE Returns 
        SET product_id = @product_id,
            invoice_id = @invoice_id,
            reason = @reason,
            date_return = @date_return
        WHERE return_id = @return_id;
        
        SELECT 'Return updated successfully.' AS Message;
    END
    ELSE
    BEGIN
        SELECT 'Return with provided ID does not exist.' AS Message;
    END
END;


-- ForecastedSales

-- Insert
CREATE PROCEDURE InsertForecastedSale
    @product_id INT,
    @product_name VARCHAR(255),
    @forecasted_weekly_sale INT,
    @forecasted_week_start DATE,
    @forecasted_week_end DATE
AS
BEGIN
    -- Insert the forecasted sale into ForecastedSales table
    INSERT INTO ForecastedSales (product_id, product_name, forecasted_weekly_sale, forecasted_week_start, forecasted_week_end)
    VALUES (@product_id, @product_name, @forecasted_weekly_sale, @forecasted_week_start, @forecasted_week_end);
    
    SELECT SCOPE_IDENTITY() AS forecast_id; -- Return the generated forecast_id
END;


-- Delete
CREATE PROCEDURE DeleteForecastedSale
    @forecast_id INT
AS
BEGIN
    -- Check if the forecasted sale exists
    IF EXISTS (SELECT 1 FROM ForecastedSales WHERE forecast_id = @forecast_id)
    BEGIN
        -- Delete the forecasted sale
        DELETE FROM ForecastedSales WHERE forecast_id = @forecast_id;
        
        SELECT 'Forecasted sale deleted successfully.' AS Message;
    END
    ELSE
    BEGIN
        SELECT 'Forecasted sale with provided ID does not exist.' AS Message;
    END
END;

-- Updation
CREATE PROCEDURE UpdateForecastedSale
    @forecast_id INT,
    @product_id INT,
    @product_name VARCHAR(255),
    @forecasted_weekly_sale INT,
    @forecasted_week_start DATE,
    @forecasted_week_end DATE
AS
BEGIN
    -- Check if the forecasted sale exists
    IF EXISTS (SELECT 1 FROM ForecastedSales WHERE forecast_id = @forecast_id)
    BEGIN
        -- Update the forecasted sale
        UPDATE ForecastedSales 
        SET 
            product_id = @product_id,
            product_name = @product_name,
            forecasted_weekly_sale = @forecasted_weekly_sale,
            forecasted_week_start = @forecasted_week_start,
            forecasted_week_end = @forecasted_week_end
        WHERE forecast_id = @forecast_id;
        
        SELECT 'Forecasted sale updated successfully.' AS Message;
    END
    ELSE
    BEGIN
        SELECT 'Forecasted sale with provided ID does not exist.' AS Message;
    END
END;





