-- Create the database
CREATE DATABASE IF NOT EXISTS MrKottu;
USE MrKottu;

-- Create customer table
CREATE TABLE IF NOT EXISTS customer (
    id  VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100),
    email VARCHAR(50),
    contact VARCHAR(15)
    );

-- Create item table
CREATE TABLE IF NOT EXISTS item (
    id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    category VARCHAR(50)
    );

-- Create orders table
CREATE TABLE IF NOT EXISTS orders (
    id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(id)
    ON UPDATE CASCADE ON DELETE RESTRICT
    );

-- Create order_items table
CREATE TABLE IF NOT EXISTS order_items (
    order_id VARCHAR(10),
    item_id VARCHAR(10),
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES item(id)
    ON UPDATE CASCADE ON DELETE RESTRICT
    );