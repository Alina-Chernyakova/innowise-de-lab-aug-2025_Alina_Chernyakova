--Найдите клиентов, которые: 
--1. Сделали хотя бы 2 заказа (любых), 
--2. Имеют хотя бы одну доставку со статусом 'Delivered'. 
--Для каждого такого клиента выведите: 
--● full_name (имя + фамилия), 
--● общее количество заказов, 
--● общую сумму заказов, 
--● страну проживания. 

SELECT 
    (c.first_name || ' ' || c.last_name) AS full_name, -- Попробовала || для соединения столбцов. Это конкатенация, объединение строк( как 1+ 1)
    -- и обязательно пробел, чтобы строки не слиплись 
    c.country,
    (SELECT COUNT(*) FROM orders WHERE customer_id = c.customer_id) AS total_orders, --Использую подзапросы, чтобы подсчитать кол-во заказов
    (SELECT SUM(amount) FROM orders WHERE customer_id = c.customer_id) AS total_amount -- и сумму стоимости закозов
FROM  customers c
WHERE 
    (SELECT COUNT(*) FROM orders WHERE customer_id = c.customer_id) >= 2-- Здесь тоже использую подзапрос, чтобы найти клиента с 2 и > заказами
    AND EXISTS ( SELECT 1 -- тут  SELECT 1, потому что нам не важны возвращаемые данные, важен сам факт существования строк
        FROM shippings -- а EXISTS проверяте наличие хотя бы одной строки, удовл условию
        WHERE customer = c.customer_id AND status = 'Delivered' -- Проверяю, чтобы статус заказа был Delivered
    )
