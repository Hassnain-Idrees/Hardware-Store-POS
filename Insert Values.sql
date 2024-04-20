-- Insert Values 

-- Inserting values into CashierLogin
INSERT INTO CashierLogin (password) VALUES ('password1');
INSERT INTO CashierLogin (password) VALUES ('password2');

-- Inserting values into OwnerLogin
INSERT INTO OwnerLogin (password) VALUES ('ownerpassword1');
INSERT INTO OwnerLogin (password) VALUES ('ownerpassword2');

-- Inserting values into Customer
INSERT INTO Customer (first_name, last_name, email, phone_number, address) VALUES ('Ali', 'Khan', 'ali@example.com', '0300XXXXXXX', '123 Main Street, Lahore');
INSERT INTO Customer (first_name, last_name, email, phone_number, address) VALUES ('Sana', 'Ahmed', 'sana@example.com', '0312XXXXXXX', '456 Park Road, Karachi');

-- Inserting values into Product
INSERT INTO Product (name, company_name, unit_price, tax, sales_price, unit_quantity) VALUES ('Hammer', 'ABC Hardware', 500.00, 5.00, 525.00, 10);
INSERT INTO Product (name, company_name, unit_price, tax, sales_price, unit_quantity) VALUES ('Screwdriver', 'XYZ Tools', 200.00, 2.50, 205.00, 20);

-- Inserting values into Invoice
INSERT INTO Invoice (product_id, name, quantity, unit, gst, total) VALUES (1, 'Hammer', 2, 'pcs', 52.50, 1050.00);
INSERT INTO Invoice (product_id, name, quantity, unit, gst, total) VALUES (2, 'Screwdriver', 3, 'pcs', 15.38, 615.00);

-- Inserting values into Returns
INSERT INTO Returns (product_id, invoice_id, reason, date_return) VALUES (1, 1, 'Defective product', '2024-04-19');
INSERT INTO Returns (product_id, invoice_id, reason, date_return) VALUES (2, 2, 'Customer changed mind', '2024-04-20');

-- Inserting values into ForecastedSales
INSERT INTO ForecastedSales (product_id, product_name, forecasted_weekly_sale, forecasted_week_start, forecasted_week_end) VALUES (1, 'Hammer', 20, '2024-04-20', '2024-04-26');
INSERT INTO ForecastedSales (product_id, product_name, forecasted_weekly_sale, forecasted_week_start, forecasted_week_end) VALUES (2, 'Screwdriver', 30, '2024-04-20', '2024-04-26');
