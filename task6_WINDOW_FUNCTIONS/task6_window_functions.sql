--Для каждого заказа добавьте колонку с суммой всех заказов этого клиента (используя 
--оконную функцию).
SELECT 
	order_id, 
	c.customer_id, 
	item, amount,
	SUM(amount) OVER(PARTITION BY c.customer_id ) AS total_by_customer
FROM customers c 
LEFT JOIN orders o
 ON o.customer_id = c.customer_id
 ORDER BY order_id 
 
 --Использовала WINDOWS FUNCTIONS, чтобы для каждой строки результата определить, к какому клиенту (customer_id) относится строка
-- и в рамках всех строк этого клиента вычислить сумму amount
-- а потом это значение добавляется как новая колонка total_by_customer.  
 -- отличие от GROUP BY в том, что WF охраняет все исходные строки, добавляя новую колонку с вычислением, а не сворачивает строки в группы,
 -- оставляя только вычисленные данные
 --ORDER BY использовала для того, чтобы отсортировать данные по order_id

