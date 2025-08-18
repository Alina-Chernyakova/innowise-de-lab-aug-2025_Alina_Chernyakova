create user hr_user with password '1111';--Сщздала нового пользователя и задала пароль 
CREATE ROLE hr_manager; -- тут создала роль, чтобы дать привилегии роли, а роль потом присвоить пользователю
GRANT SELECT ON Employees TO hr_manager;--тут даю привилегию на чтение данных из таблицы
GRANT hr_manager TO hr_user; --тут присвоила роль пользователю 
GRANT INSERT, UPDATE ON Employees TO hr_manager;-- здесь даю роли привилегии на добавление и изменение данных, но выдало ошибку,
-- что нет доступа к последовательности employees_employeeid_seq. Поэтому дала привилегии на доступ к 
GRANT USAGE, SELECT ON SEQUENCE employees_employeeid_seq TO hr_manager;-- последовательности. Привилегия usage дает 
--доступ к последовательности( или схеме и другому объекту), а привелегия select on sequence дает доступ к данным последовательности