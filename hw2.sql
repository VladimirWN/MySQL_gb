DROP DATABASE IF EXISTS hw2;
CREATE DATABASE IF NOT EXISTS hw2;
USE hw2;

-- Task 1
CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date VARCHAR(45),
    count_product INT
    );
    
INSERT INTO sales (order_date, count_product)
VALUES
	("2022-01-01", 156),
    ("2022-01-02", 180),
    ("2022-01-03", 21),
    ("2022-01-04", 124),
    ("2022-01-05", 341);
    
SELECT 
	id AS "id заказа",
	if(count_product < 100, "маленький заказ",
		if(count_product BETWEEN 100 AND 300, "средний заказ", "большой заказ"))
	AS "Тип заказа"
FROM sales;

-- Task 2
CREATE TABLE orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(45),
    amount FLOAT,
    order_status VARCHAR(45)
);
INSERT INTO orders (employee_id, amount, order_status)
VALUES
	("e03", 15.00, "OPEN"),
    ("e01", 25.50, "OPEN"),
    ("e05", 100.70, "CLOSED"),
    ("e02", 22.18, "OPEN"),
    ("e04", 9.50, "CANCELLED");

SELECT *, 
	CASE
		WHEN order_status = "OPEN" THEN "Order is in open state"
        WHEN order_status = "CLOSED" THEN "Order is closed"
        WHEN order_status = "CANCELLED" THEN "Order is cancelled"
        ELSE "ERROR"
	END AS full_order_status
FROM orders;