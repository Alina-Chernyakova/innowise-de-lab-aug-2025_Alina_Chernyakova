--Получите список заказов вместе с именем клиента, который сделал заказ.
SELECT 
	first_name, 
	last_name, 
	item, 
	amount
FROM orders 
LEFT JOIN customers c  --left join использую, чтобы сохранить записи из таблицы Customers, даже если там нет записей
ON   c.customer_id=orders.customer_id

--Выведите список доставок со статусом и именем клиента. 
SELECT 
	status,
	first_name,
	last_name
FROM shippings s
LEFT JOIN customers c
ON s.customer = c.customer_id
--исправленный вариант