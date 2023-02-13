CREATE DATABASE hw1;
USE hw1;
CREATE TABLE phones
(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    model VARCHAR(45),
    brand VARCHAR(45),
    price FLOAT,
    quantity INT
    );

INSERT phones(model, brand, price, quantity)
VALUES
	('A62', 'Samsung', 1089.55, 120),
    ('4578', 'Nokia', 857.14, 1),
    ('Galaxy12', 'Samsung', 790.45, 150),
    ('7', 'OnePlus', 978.10, 15),
    ('Redmi 123', 'Xaiomi', 759.10, 180),
    ('A60', 'Samsung', 1130.55, 133),
    ('7845', 'Nokia', 967.58, 1),
    ('iphone 9', 'Apple', 1390.12, 99),
    ('10iphone', 'Apple', 1790.12, 79),
    ('H', 'Huawei', 1390.12, 99);
    
SELECT model, brand, price 
FROM phones
WHERE quantity > 2;

SELECT model, price 
FROM phones
WHERE brand = 'Samsung';

SELECT brand, model, price
FROM phones
WHERE price * quantity > 100000 AND price * quantity < 140000;

SELECT model, brand
FROM phones
WHERE model LIKE '%iphone%';

SELECT model, brand
FROM phones
WHERE model LIKE '%Galaxy%';

SELECT model, brand
FROM phones
WHERE model RLIKE '[0-9]';

SELECT model, brand
FROM phones
WHERE model RLIKE '8';