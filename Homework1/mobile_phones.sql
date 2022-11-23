CREATE SCHEMA `mobile_phones` ;

CREATE TABLE `mobile_phones`.`availability` (
  `phone_id` INT NOT NULL AUTO_INCREMENT,
  `model` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `year_of_issue` YEAR(4) NOT NULL,
  `price` INT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`phone_id`),
  UNIQUE INDEX `model_UNIQUE` (`model` ASC) VISIBLE);

INSERT INTO `mobile_phones`.`availability` (`model`, `manufacturer`, `year_of_issue`, `price`, `quantity`) VALUES ('Iphone11', 'Apple', 2020, '500', '5');
INSERT INTO `mobile_phones`.`availability` (`model`, `manufacturer`, `year_of_issue`, `price`, `quantity`) VALUES ('Iphone SE', 'Apple', 2015, '300', '1');
INSERT INTO `mobile_phones`.`availability` (`model`, `manufacturer`, `year_of_issue`, `price`, `quantity`) VALUES ('Iphone 14', 'Apple', 2022, '1000', '2');
INSERT INTO `mobile_phones`.`availability` (`model`, `manufacturer`, `year_of_issue`, `price`, `quantity`) VALUES ('Galaxy Fold', 'Samsung', 2020, '500', '3');
INSERT INTO `mobile_phones`.`availability` (`model`, `manufacturer`, `year_of_issue`, `price`, `quantity`) VALUES ('Galaxy S22+', 'Samsung', 2021, '700', '8');
INSERT INTO `mobile_phones`.`availability` (`model`, `manufacturer`, `year_of_issue`, `price`, `quantity`) VALUES ('Galaxy Z Flip', 'Samsung', 2022, '900', '4');
INSERT INTO `mobile_phones`.`availability` (`model`, `manufacturer`, `year_of_issue`, `price`, `quantity`) VALUES ('3310', 'Nokia', 1999, '100', '1');
INSERT INTO `mobile_phones`.`availability` (`model`, `manufacturer`, `year_of_issue`, `price`, `quantity`) VALUES ('Redmi 10', 'Xiaomi', 2021, '800', '6');

SELECT manufacturer, price FROM mobile_phones.availability
WHERE quantity > 2;

SELECT * FROM mobile_phones.availability
WHERE manufacturer = "Samsung";