--Найдите всех клиентов из страны 'USA', которым больше 25 лет.
SELECT
	c.first_name, 
	c.last_name, 
	c.age, 
	c.country
FROM Customers c
WHERE c.age > 25 AND c.country='USA'
--Использовала WHERE = для точного совпадения. WHERE..LIKE необходим для нечеткого поиска(поиск по шаблону),
--поэтому не использовала

--Выведите все заказы, у которых сумма (amount) больше 1000.
SELECT 
	o.order_id, 
	o.item , 
	o.amount , 
	o.customer_id 
fROM orders o 
WHERE o.amount > 1000

--Здесь WHERE нужен был для фильтрации данных 
 
