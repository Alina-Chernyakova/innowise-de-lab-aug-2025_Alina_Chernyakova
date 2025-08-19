--Найдите клиентов, которые: 
--1. Сделали хотя бы 2 заказа (любых), 
--2. Имеют хотя бы одну доставку со статусом 'Delivered'. 
--Для каждого такого клиента выведите: 
--● full_name (имя + фамилия), 
--● общее количество заказов, 
--● общую сумму заказов, 
--● страну проживания. 
    --ИСПРАВЛЕННАЯ ВЕРСИЯ
    SELECT 
    (c.first_name || ' ' || c.last_name) AS full_name, 
    c.country  , count(*) as total_orders, sum(o.amount ) as total_amount
FROM  customers c
LEFT JOIN orders o 
ON o.customer_id = c.customer_id
WHERE EXISTS ( SELECT 1
        FROM shippings 
        WHERE customer = c.customer_id AND status = 'Delivered' 
    )
   GROUP BY c.customer_id 
   HAVING COUNT(*) >= 2
