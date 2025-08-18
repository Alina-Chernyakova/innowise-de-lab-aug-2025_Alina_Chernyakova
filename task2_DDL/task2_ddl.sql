--1.Создать новую таблицу с именем Departments
CREATE TABLE Departments(--создаю таблицу с помощью операции create, явно прописываю столбцы и характеристику
DepartmentID SERIAL PRIMARY key,
DepartmentName VARCHAR(50) UNIQUE NOT null,
Location VARCHAR(50)
);

--2. Изменить таблицу Employees, добавив новый столбец с именем Email (VARCHAR(100)). 
ALTER TABLE employees ADD COLUMN Email VARCHAR(100); -- изменяю структуру таблицы employees, добавляя столбец с помощью alert

--3.Добавить ограничение UNIQUE к столбцу Email в таблице Employees, предварительно заполнив любыми значениями
UPDATE employees  --Заполняю столбец уникальными значениями автоматически с помощью update, просто присваивая email(фильтрую его на null) 
SET email = 'unique'|| employeeid ||'@email.wow'-- значение, соединенное из написанных слов и айди для уникальности каждого.
-- Для каждого отдельно долго, так проще, тем более 
WHERE email IS NULL; -- не сказано, какие конкретно значения

ALTER TABLE employees ADD CONSTRAINT  UQ_Email UNIQUE (email);-- а потом создаю ограничение с помощью alert

--Переименовать столбец Location в таблице Departments в OfficeLocation.
ALTER TABLE Departments RENAME COLUMN location TO OfficeLocation;-- просто переименовываю столбец
