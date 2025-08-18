-- Практика базовой вставки, выборки, простого обновления и удаления данных
--1.Вставить двух новых сотрудников в таблицу Employees.
INSERT INTO employees (FirstName, LastName, Department, Salary) VALUES --использую insert into... values, так как нужно было вставить 2 
('Victor', 'Krasnov',  'Finance', 65000.00),						-- записи с данными, которые я знаю. Я явно указала значения для каждого столбца
('Robert', 'Patison',  'IT', 70000.00);

--2.Выбрать всех сотрудников из таблицы Employees
SELECT * FROM Employees;-- эта команда выбирает все записи из таблицы Employees

--3.Выбрать только FirstName и LastName сотрудников из отдела 'IT'.
SELECT FirstName, LastName
FROM employees e 
WHERE e.department ='IT' --с помощью where отфильтровала данные

--4.Обновить Salary 'Alice Smith' до 65000.00.
UPDATE employees e  --с помощью команды update обновила salary, использовала фильтрацию в where для того, чтобы обночить только определенную запись,
SET salary= 65000.00 --а не всю таблицу
WHERE FirstName='Alice' and e.lastname ='Smith'

--5.Удалить сотрудника, чья LastName — 'Prince'. 
--Вообще, есть 3 варианта. Первый: я удалила связанные записи в employeeprojects перед удалением сотрудника
DELETE FROM employeeprojects 
WHERE employeeid= (SELECT employeeid FROM employees WHERE lastname = 'Prince');--удаляем связанную запись
DELETE FROM employees  -- удаляем сотрудника
WHERE lastname = 'Prince';
--Второй способ: использовать on delete cascade, чтобы удалить и связанные данные
--Третий спопоб: если бы в таблице employeeprojects employeeid не был бы not null( а это ограничение есть), то можно было бы
--обновить записи в employeeprojects, заменив ссылку на удаляемого сотрудника на null(это с помощью update)
-- а потом безопасно удалить сотрудника с помощью delete

--6.Проверить все изменения, используя SELECT * FROM Employees;. 
SELECT * FROM Employees;
