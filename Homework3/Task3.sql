DROP SCHEMA task3;
CREATE SCHEMA task3;
USE task3;

CREATE TABLE employee (
	empId INT AUTO_INCREMENT PRIMARY KEY  ,
	empName VARCHAR (50) NOT NULL ,
	empSurname VARCHAR (50) NOT NULL ,
	empSpeciality VARCHAR (50) NOT NULL ,
	empSeniority SMALLINT NOT NULL ,
	empSalary INT NOT NULL ,
	empAge SMALLINT NOT NULL 
); 

INSERT INTO employee (empName, empSurname, empSpeciality, empSeniority, empSalary, empAge)
VALUES
 ('Вася', 'Васькин', 'начальник', 40, 100000, 60),
 ('Петя', 'Петькин', 'начальник', 8, 70000, 30),
 ('Катя', 'Каткина', 'инженер', 2, 70000, 25),
 ('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
 ('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
 ('Петр', 'Петров', 'рабочий', 20, 25000, 40),
 ('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),  
 ('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
 ('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
 ('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
 ('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
 ('Люся', 'Люськина', 'уборщик', 10, 10000, 49);

SELECT * FROM employee;

-- 1.	Отсортируйте поле “зарплата” (salary) в порядке убывания и возрастания

SELECT * FROM Employee ORDER BY empSalary DESC;

SELECT * FROM Employee ORDER BY empSalary;

-- 2.	Выведите 5 максимальных зарплат (salary)

SELECT * FROM Employee ORDER BY empSalary DESC LIMIT 5;

-- 3.	Подсчитать суммарную зарплату(salary) по каждой специальности 

SELECT empSpeciality, SUM(empSalary)  
FROM EMPLOYEE
GROUP BY empSpeciality;

-- 4.	Найти количество сотрудников по специальности “Рабочий” в возрасте от 24 до 42 лет

SELECT COUNT(*) AS  'сотрудников по спец-ти “Рабочий” в возрасте от 24 до 42 лет'
FROM Employee
WHERE empSpeciality = 'рабочий' AND
empAge > 23 AND empAge < 43;

-- 5.	Найти количество специальностей

SELECT COUNT(DISTINCT empSpeciality) AS 'количество специальностей'
FROM Employee; 

-- 6.	Вывести специальности, у которых средний возраст сотрудника меньше 44 лет

SELECT empSpeciality 
AS  'специальности, у которых средний возраст сотрудника меньше 44 лет'
FROM Employee 
GROUP BY empSpeciality 
HAVING AVG(empAge) < 44;

-- 7.	Если не ID, то какое поле можно добавить, чтобы использовать его в качестве первичного ключа

-- Можно добавить поле – номер паспорта или контактный телефон.
