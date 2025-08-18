-- Функции и представления
CREATE OR REPLACE FUNCTION CalculateAnnualBonus ( --создаю функцию с помощью create. replace нам надо для того, чтобы перезаписать функцию, 
employeeid integer, salary numeric(10, 2)			-- если такая уже есть
)--входные параметры и их тип данных
returns numeric(10, 2)--тип данных возвращаемого элемента. Функция должна что-то возвращать!
LANGUAGE plpgsql --выбираем язык PL/pgSQL, чтобы использовать переменные, условные операторы и тд, то есть разные опции
AS $$
	DECLARE  
		bonus_sum numeric(10, 2);-- это как бы внутренняя переменная и ее тип данных. Буду ее использовать внутри функции 
	BEGIN 
		IF salary IS NULL or salary=0 THEN --решила добавить условие, чтобы корректнее делать вычисления. Если salary 0 или null, то вернет 0
			RETURN 0;
		ELSE
		bonus_sum :=0.1*salary; --считаем бонус к зарплате( он составляет 10% от зарплаты)
		RETURN bonus_sum;--возвращаем значение бонуса
		END IF; 
	END;
$$;
SELECT employeeid, Salary, CalculateAnnualBonus(employeeid, Salary) --вызываем функцию в select,передаем параметры 
FROM employees;

--создаем представление
CREATE VIEW IT_Department_View as 
SELECT firstname, lastname, salary --тут создаю вьюху, фильтрую по department в where
FROM employees 
WHERE department='IT';

SELECT * FROM IT_Department_View;-- а здесь вызываю вьюху. Она просто паказывает данные, но не хранит 
