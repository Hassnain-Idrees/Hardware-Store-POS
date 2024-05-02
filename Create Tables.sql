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
CREATE TABLE InvoiceProductType (
  product_id int NULL,
  name varchar(255) NULL,
  quantity int NULL,
  unit varchar(50) NULL,
  gst decimal(5, 2) NULL,
  unit_price decimal(5, 2) NULL,
  subtotal varchar (50) NULL
);

-- Returns
CREATE TABLE Returns (
  return_id INT PRIMARY KEY IDENTITY(1,1), -- Auto-increment primary key
  invoice_id INT,
  reason VARCHAR(255),
  date_return DATE,
  CONSTRAINT FK_Returns_Invoice FOREIGN KEY (invoice_id) REFERENCES Invoice(invoice_id)
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
CREATE TABLE Invoice (
  invoice_id INT IDENTITY(1,1) PRIMARY KEY,
  customer_id INT NULL,
  invoice_date DATE NULL,
  total VARCHAR(50) NULL
);

CREATE TABLE InvoiceProduct (
  invoice_id INT,
  product_id INT,
  name VARCHAR(255),
  quantity INT,                 -- Assuming quantity will be a whole number
  unit VARCHAR(50),
  unit_price VARCHAR(50),       -- Retaining VARCHAR as per your requirement
  gst VARCHAR(50),              -- Retaining VARCHAR, useful if GST is inputted with extra information like "%"
  subtotal VARCHAR(50),         -- Retaining VARCHAR as per your requirement

  CONSTRAINT FK_InvoiceProduct_Invoice FOREIGN KEY (invoice_id) REFERENCES Invoice(invoice_id),
  CONSTRAINT FK_InvoiceProduct_Product FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

