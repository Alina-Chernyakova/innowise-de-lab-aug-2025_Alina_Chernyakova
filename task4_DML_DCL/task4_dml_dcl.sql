
--Увеличить Salary всех сотрудников в отделе 'HR' на 10%. 
UPDATE employees e --простое обновление с where
SET salary= salary*1.1 --умножаю на 1.1, потому что это тоже самое, есди бы я написала salary+salary*0.1
WHERE e.department ='HR';

--Обновить Department любого сотрудника с Salary выше 70000.00 на 'Senior IT'
UPDATE employees e  
SET department='Senior IT' --тоже обновление данных с фильтрацией
WHERE salary>70000.00 and e.firstname ='Bob'and e.lastname ='Johnson';

--Удалить всех сотрудников, которые не назначены ни на один проект в таблице EmployeeProjects.
DELETE FROM employees e
WHERE NOT EXISTS --фильтруем сотрудников, которых не существует исходя из условия в скобках(ep.employeeid = e.employeeid не верно,
(SELECT 1 --значит, нет проекта). если совпадений нет, то not exist возвращает true, а значит сотрудник удаляется
FROM employeeprojects ep 
WHERE ep.employeeid = e.employeeid );   

-- Вставить новый проект и назначить на него двух существующих сотрудников с определенным количеством HoursWorked в EmployeeProjects
BEGIN;--начало транзакции
INSERT INTO projects  (ProjectName, Budget, StartDate, EndDate) VALUES --самый простой способ вставить сотрудников на проект и добавить сам проект
('Mobile App', 300000.00, '2024-01-17', '2024-09-20');            --просто вручную добавила проект и так же добавила сотрудников с помощью insert
INSERT INTO employeeprojects (EmployeeID, ProjectID, HoursWorked) --подскажите,пожалуйста, если есть какой-то более правильный вариант
VALUES (1, (SELECT MAX(ProjectID) FROM projects), 120),
 (2, (SELECT MAX(ProjectID) FROM projects), 80);
COMMIT ;-- закрепление результатов, сохранине и конец транзакции
SELECT * FROM employees e --проверяем
