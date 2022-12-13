-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP SCHEMA IF EXISTS task6;
CREATE SCHEMA task6;

USE task6;

DELIMITER $$
CREATE FUNCTION timecount (number INT)
    RETURNS VARCHAR (100) 
    DETERMINISTIC
    BEGIN
		DECLARE days DOUBLE;
		DECLARE hours DOUBLE;
		DECLARE minutes DOUBLE;
		DECLARE seconds DOUBLE;
        
        SET days = TRUNCATE((number / 86400), 0);                  /* 86400 секунд в сутках */

        SET hours = TRUNCATE(((number % 86400) / 3600), 0); 		/* 3600 секунд в часе */

        SET minutes = TRUNCATE((((number % 86400) % 3600) / 60), 0);   /*60 секунд в минуте*/

        SET seconds = number - minutes * 60 - hours * 3600 - days * 86400;

    RETURN CONCAT (days,' d, ', hours,' h, ', minutes,' m, ', seconds,' s');
END $$ 
DELIMITER ;
SELECT timecount(123456) AS '123456 seconds CONVERTED';


-- Выведите только четные числа от 1 до 10.
-- Пример: 2,4,6,8,10

DELIMITER $$
CREATE FUNCTION evenNum (numStart INT, numEnd INT)
    RETURNS VARCHAR (100) 
    DETERMINISTIC
    BEGIN
	
		DECLARE str VARCHAR(50) DEFAULT '';
		WHILE numStart <= numEnd DO
			IF (numStart % 2 = 0) THEN SET str = CONCAT(str,' ',numStart);
			END IF;
            SET numStart = numstart + 1;
		END WHILE;
        
        RETURN str;
END $$ 
DELIMITER ;
SELECT evenNum(1, 10) AS 'Even numbers between 1 to 10';