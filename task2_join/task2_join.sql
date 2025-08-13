--Получите список заказов вместе с именем клиента, который сделал заказ.
SELECT 
	first_name, 
	last_name, 
	item, 
	amount
FROM customers c 
LEFT JOIN orders --left join использую, чтобы сохранить записи из таблицы Customers, даже если там нет записей
ON orders.customer_id = c.customer_id

--Выведите список доставок со статусом и именем клиента. 
SELECT 
	status,
	first_name,
	last_name
FROM shippings s
LEFT JOIN customers c
ON s.customer = c.customer_id

--В первом задании использовала LEFT JOIN, потому что нужно увидеть всех клиентов, даже если у них нет заказов
--и без LEFT JOIN можно потерять клиентов, которые ничего не заказывали

--Во втором задании использовала LEFT JOIN, потому что нужно увидеть все доставки, даже если
--клиент удален из базы( с помощью LEFT JOIN запись о доставке останется).

--Если же нам важны только те клиенты, которые сделали заказ, нужно использовать INNER JOIN