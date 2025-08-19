--Для каждого заказа добавьте колонку с суммой всех заказов этого клиента (используя 
--оконную функцию).
SELECT 
	order_id, 
	c.customer_id, 
	item, amount,
	SUM(amount) OVER(PARTITION BY c.customer_id ) AS total_by_customer
FROM  orders o
LEFT JOIN customers c
 ON o.customer_id = c.customer_id
 ORDER BY order_id 
 --исправленный вариант 

