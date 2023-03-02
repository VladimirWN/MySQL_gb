DROP DATABASE IF EXISTS hw6;
CREATE DATABASE IF NOT EXISTS hw6;
USE hw6;

-- 1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DROP FUNCTION IF EXISTS sec_to_simpletime;
delimiter $$
CREATE FUNCTION sec_to_simpletime (sec INT)
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
	DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    
    SET days = sec DIV 86400;
    SET sec = sec MOD 86400;
    SET hours = sec DIV 3600;
    SET sec = sec MOD 3600;
    SET minutes = sec DIV 60;
    SET sec = sec MOD 60;
    RETURN CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', sec, ' seconds');
END $$
delimiter ;
SELECT sec_to_simpletime(123456);

-- 2.	Выведите только четные числа от 1 до 10 включительно. (Через функцию / процедуру) Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
DROP PROCEDURE IF EXISTS evens;
delimiter // 
CREATE PROCEDURE evens()
BEGIN
	DECLARE num INT DEFAULT 1;
    DECLARE result VARCHAR(30) DEFAULT '';
    WHILE num <= 10 DO
		IF num % 2 = 0 THEN
			SET result = CONCAT(result, ' ', num);
		END IF;
        SET num = num + 1;
	END WHILE;
    SELECT result;
END //
delimiter ;

CALL evens();