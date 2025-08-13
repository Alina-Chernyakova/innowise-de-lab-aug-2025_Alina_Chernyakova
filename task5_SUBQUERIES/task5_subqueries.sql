--Найдите всех клиентов, которые сделали заказ с максимальной суммой. 
SELECT 
	first_name, 
	last_name,
	amount
FROM customers c 
LEFT JOIN orders o
ON o.customer_id = c.customer_id
WHERE 
	o.amount =( SELECT MAX(o.amount ) FROM orders o )
--Использовала JOIN, чтобы связать таблицы customers и orders, чтобы получить информацию о клиентах и их заказах в одном результате
--Подзапрос использовала, чтобы найти максимальную сумму( max(o.amount )), ведь с WHERE напрямую max не используется. А еще значение
--подзапроса вычисляется заранее, т.е сначала выполняется подзапрос, потом соединение таблиц(join), а потом WHERE