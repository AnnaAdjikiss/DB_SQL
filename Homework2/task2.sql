DROP SCHEMA task2; 

CREATE SCHEMA task2;

USE task2;

-- 1. Используя операторы языка SQL, создайте таблички "goods" и “sales”. Заполните их данными

CREATE TABLE goods (
  idGoods INT AUTO_INCREMENT PRIMARY KEY,
  nameGoods VARCHAR(100) NOT NULL UNIQUE,
  priceGoods INT NOT NULL,
  quantityGoods INT
); 

INSERT goods(nameGoods, priceGoods, quantityGoods)
VALUES
  ('Блокнот',150, 10),
  ('Тетрадь', 200, 15), 
  ('Ручка', 70, 20),
  ('Карандаш', 80, 20),
  ('Линейка', 100, 8),
  ('Калькулятор', 500, 2),
  ('Папка', 400, 5),
  ('Бумага А4', 350, 12);

SELECT 	
  idGoods as 'ID',
  nameGoods as 'Наименование',
  priceGoods as 'Цена',
  quantityGoods as 'Количество'
FROM goods;

CREATE TABLE sales (
  idSales INT AUTO_INCREMENT PRIMARY KEY, 
  goodsIDSales INT,
  soldThisWeek INT,
  soldThisMonth INT,
  soldThisYear INT,
  FOREIGN KEY (goodsIDSales) REFERENCES goods (idGoods)
);	
	
INSERT sales (goodsIDSales, soldThisWeek, soldThisMonth, soldThisYear)
VALUES
  (1 ,2, 10, 99),
  (2, 3, 14, 100), 
  (3, 7, 20, 101),
  (4, 8, 21, 102),
  (5, 4, 32, 113),
  (6, 1, 5, 25),
  (7, 10, 10, 10),
  (8, 15, 150, 500);

SELECT 
  idSales as 'salesID',
  goodsIDSales as 'goodsID',
  soldThisWeek as 'Продано за неделю',
  soldThisMonth as 'Продано за месяц',
  soldThisYear as 'Продано за год'
FROM sales;

-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300. - CASE

SELECT goodsIDSales AS 'ID товара', soldThisYear AS 'Продано за год',
CASE
    WHEN soldThisYear < 100 THEN 'Меньше 100 шт.'
    WHEN soldThisYear >= 100 AND soldThisYear < 300 THEN '100-300 шт.'
    ELSE 'Больше 300 шт.'
  END AS 'Комментарий'
FROM sales
ORDER BY soldThisYear; 

-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE


CREATE TABLE orders (
  idOrders INT AUTO_INCREMENT PRIMARY KEY, 
  idGoodsOrders INT NOT NULL,
  idSalesOrders INT NOT NULL,
  idCustomer VARCHAR(100) NOT NULL UNIQUE,
  sumOrder INT NOT NULL,
  statusOrder VARCHAR(100),
  FOREIGN KEY (idGoodsOrders) REFERENCES goods(idGoods),
  FOREIGN KEY (idSalesOrders) REFERENCES sales(idSales)
  );  

INSERT  orders (idCustomer, idGoodsOrders, idSalesOrders, sumOrder, statusOrder)
VALUES
  ('customer111', 1, 1,  2000, 'оплачен'),
  ('customer112', 2, 2,1500, 'скомплектован'),
  ('customer113', 3, 3, 5000, 'отгружен'),
  ('customer114', 4, 4, 3000, 'оплачен'),
  ('customer115', 5, 5, 1200, 'возврат'),
  ('customer116', 6, 6, 5700, 'скомплектован'),
  ('customer117', 7, 7,4300, 'возврат'),
  ('customer118', 8, 8, 9300, 'отгружен');

SELECT 
idCustomer AS 'ID покупателя', 
sumOrder AS 'Сумма заказа', 
statusOrder AS 'Статус заказа',
CASE
    WHEN statusOrder = 'оплачен' THEN 'Ожидает'
    WHEN statusOrder = 'скомплектован' THEN 'В работе'
    WHEN statusOrder = 'отгружен' THEN 'В работе'
    WHEN statusOrder = 'возврат' THEN 'Отмена'
  END AS 'Комментарий'
FROM orders; 
CREATE TABLE orders (
  idOrders INT AUTO_INCREMENT PRIMARY KEY, 
  idGoodsOrders INT NOT NULL,
  idSalesOrders INT NOT NULL,
  idCustomer VARCHAR(100) NOT NULL UNIQUE,
  sumOrder INT NOT NULL,
  statusOrder VARCHAR(100),
  FOREIGN KEY (idGoodsOrders) REFERENCES goods(idGoods),
  FOREIGN KEY (idSalesOrders) REFERENCES sales(idSales)
  );  

INSERT  orders (idCustomer, idGoodsOrders, idSalesOrders, sumOrder, statusOrder)
VALUES
  ('customer111', 1, 1,  2000, 'оплачен'),
  ('customer112', 2, 2,1500, 'скомплектован'),
  ('customer113', 3, 3, 5000, 'отгружен'),
  ('customer114', 4, 4, 3000, 'оплачен'),
  ('customer115', 5, 5, 1200, 'возврат'),
  ('customer116', 6, 6, 5700, 'скомплектован'),
  ('customer117', 7, 7,4300, 'возврат'),
  ('customer118', 8, 8, 9300, 'отгружен');

SELECT 
idCustomer AS 'ID покупателя', 
sumOrder AS 'Сумма заказа', 
statusOrder AS 'Статус заказа',
CASE
    WHEN statusOrder = 'оплачен' THEN 'Ожидает'
    WHEN statusOrder = 'скомплектован' THEN 'В работе'
    WHEN statusOrder = 'отгружен' THEN 'В работе'
    WHEN statusOrder = 'возврат' THEN 'Отмена'
  END AS 'Комментарий'
FROM orders; 

-- 4. Чем NULL отличается от 0?

/*
NULL - отсутствие каких либо данных, компьютер точно знает, что переменная пустая
(например выполняется поиск, в  результате которого ничего не нашлось - будет возвращен NULL);
0 - число, абсолютно определенное значение переменной. */