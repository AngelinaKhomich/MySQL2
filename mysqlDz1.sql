SELECT * FROM mobilephone.phone;
use mobilephone;

 /* Задание 2. Напишите SELECT-запрос, который выводит название товара,
 производителя и цену для товаров,количество которых превышает 2*/

select product_name,manufacturer,price from mobilephone.phone
where product_count>2;

-- Задание 3. Выведите SELECT-запросом весь ассортимент товаров марки “Samsung”

SELECT * FROM mobilephone.phone
WHERE manufacturer = 'Samsung';

-- Задание 4.1  С помощью SELECT-запроса с оператором LIKE / REGEXP найти:Товары, в которых есть упоминание "Iphone"

SELECT * FROM mobilephone.phone
WHERE product_name like 'Iphone%';

-- Задание 4.2  С помощью SELECT-запроса с оператором LIKE / REGEXP найти:Товары, в которых есть упоминание "Iphone"

SELECT * FROM mobilephone.phone
WHERE product_name like 'Samsung%';

-- Задание 4.3  С помощью SELECT-запроса с оператором LIKE / REGEXP найти:Товары, в названии которых есть ЦИФРЫ

SELECT * FROM mobilephone.phone
 WHERE product_name REGEXP '[[:digit:]]' = 1
 
-- Задание 4.4  С помощью SELECT-запроса с оператором LIKE / REGEXP найти:Товары, в названии которых есть ЦИФРА "8"

SELECT * FROM mobilephone.phone
 WHERE product_name REGEXP '[[8]]' = 1 

