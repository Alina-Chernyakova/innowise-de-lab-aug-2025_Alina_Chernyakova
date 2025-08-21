--исправленный вариант
BEGIN:
WITH new_employee AS ( --получается, создае временную как бы таблицу new_employee
    INSERT INTO employees (FirstName, LastName, Department, Salary) -- тут записываем инфу про нового сотрудника в таблицу employees
    VALUES ('New', 'Worker', 'IT', 75000)
    RETURNING EmployeeID -- а здесь возвращаем айди записи с новый сотрудником
) -- и на выходе полкчаем что-то типа временной таблицы с одной записью по столбцу EmployeeID, на сколько я поняла
INSERT INTO employeeprojects (EmployeeID, ProjectID, HoursWorked) -- а тут раз есть таблица временная, то используем select вместе с insert
SELECT  -- чтобы вставить данные в одну таблицу(employeeprojects), выбирая их из другой(new_employee) 
    ne.EmployeeID, --берем айди из временной таблицы new_employee
    (SELECT ProjectID FROM projects WHERE ProjectName = 'Website Redesign'),-- еще сделаем подзапрос, найти айди нужного проекта и туда назначить сотрудника
    80
FROM 
    new_employee ne; --как раз показываем из какой таблцы select 

COMMIT;
