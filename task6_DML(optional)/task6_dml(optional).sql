BEGIN;--начианем транзакцию.Надо было делать две транзакции или только для последнего задания?
--Найти ProjectName всех проектов, в которых 'Bob Johnson' работал более 150 часов
SELECT projectname  --ищю название проекта
FROM projects p 
INNER JOIN employeeprojects e --Нам нужны только проекты, где действительно есть Bob Johnson, так что использую inner join
ON e.projectid = p.projectid
INNER JOIN employees e2  -- делаю join дважды, потому что сначала надо соединить таблицы projects и employeeprojects, 
ON e2.employeeid= e.employeeid --а потом еще присоединить таблицу employees 
WHERE e2.firstname ='Bob' and e2.lastname ='Johnson' and e.hoursworked >150;-- а тут просто фильтруем

--Увеличить Budget всех проектов на 10%, если к ним назначен хотя бы один сотрудник из отдела 'IT'
UPDATE projects p --обновляю данные таблицы projects
SET budget =budget*1.1 --тут задаю новое значение для budget*1.1 
WHERE exists( --проверяю существование искомой строки, которая удовл подзапросу
SELECT 1 FROM employeeprojects e --соединяю таблицы  employeeprojects и employee
INNER JOIN employees e1 
ON  e.employeeid =e1.employeeid 
WHERE e.projectid =p.projectid and e1.department ='IT');--фильтрую записи по совпадению айди проектов из таблцы projects и employeeprojects 
--т.е. проверяю вязь с внешним запросом (проверяю только текущий проект), и проверяю отдел ( этот столбец из таблицы employees)

SELECT * FROM projects p ;

--Для любого проекта, у которого еще нет EndDate (EndDate IS NULL), установить EndDate на один год позже его StartDate. 
UPDATE projects p --простое обновление данных 
SET enddate= startdate+interval '1 YEAR'
WHERE p.enddate is null;

SELECT * FROM projects p;
COMMIT;--заканчиваю первую транзакцию. Я не уверена, что нужно было делать 2
--Вставить нового сотрудника и немедленно назначить его на проект 'Website Redesign' с 80 отработанными часами, все в рамках одной 
--транзакции. Использовать предложение RETURNING, чтобы получить EmployeeID вновь вставленного сотрудника. 
BEGIN; --я не нашла информацию в лекции про RETURNING, а операторы return были в функциях, поэтому решила сделать функцию для вставки сотрудника
CREATE OR REPLACE FUNCTION add_employee ()-- функция будет без входных параметров
returns integer --обязательнр должна что-то возвращать, поэтому вместо void я написала integer, пусть вернет тогда EmployeeID
LANGUAGE plpgsql 
AS $$
DECLARE add_id integer; --создаю переменную для функции 
BEGIN
INSERT INTO employees (FirstName, LastName, Department, Salary) -- вставляем информацию о новом сотруднике в employees
    VALUES ('Kris', 'Rok', 'IT', 75000)
    RETURNING EmployeeID INTO add_id; -- получается, returning возвращает айди нового сотрудника и сохраняетего в переменную add_id
	INSERT INTO employeeprojects (EmployeeID, ProjectID, HoursWorked)
    VALUES (
        add_id, -- тут мы используем переменную функции для вставки айли сотрудника в таблицу employeeprojects
        (SELECT ProjectID FROM projects WHERE ProjectName = 'Website Redesign'),--сделала подзапрос, чтобы найти айди нужного проекта
        80
    );
RETURN add_id;-- для баланса вселенной верну значение этой переменной
END;
$$;
SELECT add_employee() -- тут вызову функцию и ее как бы активирую. таблица будет состоять из одного значания

COMMIT;-- заканчиваю транзакцию, сохраняя и фиксируя изменения

SELECT * FROM employees e ;-- здесь можно проверить таблицы на изменения
SELECT * FROM employeeprojects e ;

