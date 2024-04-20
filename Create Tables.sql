-- Create Table Statements

-- CashierLogin
CREATE TABLE CashierLogin (
  cashier_id INT PRIMARY KEY IDENTITY(1,1),
  password VARCHAR(255) NOT NULL
);

-- OwnerLogin
CREATE TABLE OwnerLogin (
  owner_id INT PRIMARY KEY IDENTITY(1,1),
  password VARCHAR(255) NOT NULL
);

-- Customer
CREATE TABLE Customer (
  customer_id INT PRIMARY KEY IDENTITY(1,1),
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  phone_number VARCHAR(255),
  address VARCHAR(255)
);

-- Product
CREATE TABLE Product (
  product_id INT PRIMARY KEY IDENTITY(1,1),
  name VARCHAR(255) NOT NULL,
  company_name VARCHAR(255) NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  tax DECIMAL(10,2) NOT NULL,
  sales_price DECIMAL(10,2) NOT NULL,
  unit_quantity INT NOT NULL
);

-- Invoice
CREATE TABLE Invoice (
  invoice_id INT PRIMARY KEY IDENTITY(1,1),
  product_id INT,
  name VARCHAR(255),
  quantity INT,
  unit VARCHAR(255),
  gst DECIMAL(10,2),
  total DECIMAL(10,2),
  FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Returns
CREATE TABLE Returns (
  return_id INT PRIMARY KEY IDENTITY(1,1),
  product_id INT,
  invoice_id INT,
  reason VARCHAR(255),
  date_return DATE,
  FOREIGN KEY (product_id) REFERENCES Product(product_id),
  FOREIGN KEY (invoice_id) REFERENCES Invoice(invoice_id)
);

-- ForecastedSales
CREATE TABLE ForecastedSales (
  forecast_id INT PRIMARY KEY IDENTITY(1,1),
  product_id INT,
  product_name VARCHAR(255),
  forecasted_weekly_sale INT,
  forecasted_week_start DATE,
  forecasted_week_end DATE,
  FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
