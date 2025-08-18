--запросы, сделанные от лица пользователя hr_user
SELECT * FROM Employees;
insert into employees (FirstName, LastName, Department, Salary) VALUES 
('Bella', 'Swan',  'Finance', 65000.00);
update employees e 
set lastname ='Kalen'
where e.firstname ='Bella';

select * from employees e 