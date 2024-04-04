-- Questions on Built-in Functions

USE saczko_workspace;

-- Create the tables and populate them with results.
-- The drops must be done in this order, if you have foreign keys!
DROP TABLE IF EXISTS dependents;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS regions;

CREATE TABLE regions (
	region_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	region_name VARCHAR (25) DEFAULT NULL
);

CREATE TABLE countries (
	country_id CHAR (2) PRIMARY KEY,
	country_name VARCHAR (40) DEFAULT NULL,
	region_id INT (11) NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE locations (
	location_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	street_address VARCHAR (40) DEFAULT NULL,
	postal_code VARCHAR (12) DEFAULT NULL,
	city VARCHAR (30) NOT NULL,
	state_province VARCHAR (25) DEFAULT NULL,
	country_id CHAR (2) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE jobs (
	job_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	job_title VARCHAR (35) NOT NULL,
	min_salary DECIMAL (8, 2) DEFAULT NULL,
	max_salary DECIMAL (8, 2) DEFAULT NULL
);

CREATE TABLE departments (
	department_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	department_name VARCHAR (30) NOT NULL,
	location_id INT (11) DEFAULT NULL,
	FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE employees (
	employee_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT (11) NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT (11) DEFAULT NULL,
	department_id INT (11) DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);

CREATE TABLE dependents (
	dependent_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	relationship VARCHAR (25) NOT NULL,
	employee_id INT (11) NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Insert data into the regions table
INSERT INTO regions (region_name) VALUES
    ('North America');

-- Insert data into the countries table
INSERT INTO countries (country_id, country_name, region_id) VALUES
    ('US', 'United States', 1),
    ('CA', 'Canada', 1);

-- Insert data into the locations table
INSERT INTO locations (street_address, postal_code, city, state_province, country_id) VALUES
    ('123 Main St', '12345', 'New York', 'NY', 'US'),
    ('456 Elm St', '67890', 'Los Angeles', 'CA', 'US'),
    ('789 Oak St', '54321', 'Toronto', 'ON', 'CA');

-- Insert data into the jobs table
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES
    ('Manager', 50000.00, 80000.00),
    ('Software Engineer', 60000.00, 100000.00),
    ('Sales Representative', 40000.00, 70000.00),
    ('Accountant', 45000.00, 75000.00),
    ('HR Specialist', 40000.00, 70000.00),
    ('Marketing Coordinator', 40000.00, 70000.00),
    ('Customer Support', 35000.00, 60000.00),
    ('Data Analyst', 50000.00, 90000.00),
    ('Product Manager', 60000.00, 110000.00),
    ('Warehouse Clerk', 30000.00, 50000.00);

-- Insert data into the departments table
INSERT INTO departments (department_name, location_id) VALUES
    ('HR', 1),
    ('Engineering', 2),
    ('Sales', 3),
    ('Finance', 1),
    ('Marketing', 3);

-- Insert data into the employees table
-- Assuming some random data for 20 employees
INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES
    ('John', 'Smith', 'john.smith@example.com', '123-456-7890', '2022-01-15', 1, 75000.00, NULL, 1),
    ('Mary', 'Johnson', 'mary.johnson@example.com', '987-654-3210', '2021-12-20', 2, 85000.00, 1, 2),
    ('Jennifer', 'Davis', 'jennifer.davis@example.com', '555-123-4567', '2022-02-10', 3, 65000.00, 1, 3),
    ('Robert', 'Lee', 'robert.lee@example.com', '555-987-6543', '2022-03-15', 4, 60000.00, 1, 4),
    ('Linda', 'Wilson', 'linda.wilson@example.com', '555-789-0123', '2022-04-20', 6, 55000.00, 1, 5),
    ('David', 'Clark', 'david.clark@example.com', '555-234-5678', '2022-05-25', 8, 70000.00, 2, 2),
    ('Karen', 'Moore', 'karen.moore@example.com', '555-876-5432', '2022-06-30', 7, 60000.00, 2, 5),
    ('Steven', 'Taylor', 'steven.taylor@example.com', '555-432-1098', '2022-07-05', 10, 55000.00, 2, 3),
    ('Susan', 'Brown', 'susan.brown@example.com', '555-210-9876', '2022-08-10', 5, 70000.00, 3, 4),
    ('Michael', 'Anderson', 'michael.anderson@example.com', '555-654-3210', '2022-09-15', 9, 65000.00, 3, 2),
    ('Patricia', 'Harris', 'patricia.harris@example.com', '555-321-0987', '2022-10-20', 6, 60000.00, 4, 5),
    ('Richard', 'Martin', 'richard.martin@example.com', '555-789-0123', '2022-11-25', 4, 75000.00, 4, 4),
    ('Jessica', 'White', 'jessica.white@example.com', '555-234-5678', '2022-12-30', 2, 80000.00, 5, 1),
    ('Daniel', 'Thompson', 'daniel.thompson@example.com', '555-432-1098', '2023-01-05', 1, 85000.00, 5, 2),
    ('Nancy', 'Garcia', 'nancy.garcia@example.com', '555-876-5432', '2023-02-10', 3, 70000.00, 5, 3),
    ('Matthew', 'Lewis', 'matthew.lewis@example.com', '555-210-9876', '2023-03-15', 8, 75000.00, 6, 1),
    ('Laura', 'Hall', 'laura.hall@example.com', '555-654-3210', '2023-04-20', 7, 65000.00, 6, 2),
    ('Kevin', 'Young', 'kevin.young@example.com', '555-321-0987', '2023-05-25', 10, 70000.00, 6, 3),
    ('Kimberly', 'Adams', 'kimberly.adams@example.com', '555-123-4567', '2023-06-30', 5, 75000.00, 7, 4),
    ('Paul', 'Wright', 'paul.wright@example.com', '555-987-6543', '2023-07-05', 9, 80000.00, 7, 5);
    
UPDATE employees
SET phone_number = REPLACE(phone_number, '-', '');

-- Insert data into the dependents table
-- Assuming some random data for 30 dependents
INSERT INTO dependents (first_name, last_name, relationship, employee_id) VALUES
    ('Emily', 'Smith', 'Spouse', 1),
    ('Michael', 'Smith', 'Child', 1),
    ('Sara', 'Johnson', 'Spouse', 2),
    ('Olivia', 'Davis', 'Child', 1),
    ('Ethan', 'Smith', 'Child', 1),
    ('Grace', 'Johnson', 'Child', 2),
    ('Sophia', 'Lee', 'Child', 2),
    ('Logan', 'Wilson', 'Child', 3),
    ('Ava', 'Clark', 'Child', 3),
    ('Mason', 'Moore', 'Child', 4),
    ('Liam', 'Taylor', 'Child', 4),
    ('Harper', 'Brown', 'Child', 5),
    ('Oliver', 'Anderson', 'Child', 5),
    ('Ella', 'Harris', 'Child', 6),
    ('Lucas', 'Martin', 'Child', 6),
    ('Scarlett', 'White', 'Child', 7),
    ('Noah', 'Thompson', 'Child', 7),
    ('Lily', 'Garcia', 'Child', 8),
    ('Isabella', 'Lewis', 'Child', 8),
    ('Jackson', 'Hall', 'Child', 9),
    ('Aiden', 'Young', 'Child', 9),
    ('Carter', 'Adams', 'Child', 10),
    ('Zoe', 'Wright', 'Child', 10),
    ('Chloe', 'Davis', 'Child', 11),
    ('Emma', 'Lee', 'Child', 11),
    ('Landon', 'Wilson', 'Child', 12),
    ('James', 'Clark', 'Child', 12),
    ('Lily', 'Moore', 'Child', 13),
    ('Aiden', 'Taylor', 'Child', 13),
    ('Zoe', 'Brown', 'Child', 14),
    ('Joey', 'Brown', 'Child', 1);
    
    
-----------------------------------------------------------------------------------
---------------------------------------------------------------------------------

-- 1, Find the length of the longest employee first name.
SELECT 
	MAX(CHAR_LENGTH(first_name)) AS max_name_length
FROM 
	employees;


-- 2. List the tenure (how many years they have worked for the 
-- company) of each employee. Sort the results from longest 
-- to shortest tenure.
SELECT   employee_id, DATEDIFF(CURRENT_DATE(), hire_date / 365) AS tenure_years
FROM     employees 
ORDER BY tenure_years ASC;

--

SELECT 
	first_name, 
    last_name, 
    YEAR(CURRENT_DATE) - YEAR(hire_date) AS tenure
FROM 
	employees
ORDER BY
	tenure DESC;

-- 3. Display the first and last names of employees and the 
-- the date of their next hiring anniversary date.
-- Sort the results by the soonest 
-- anniversary first and the latest last.
SELECT   first_name, last_name, DATE_ADD(hire_date, INTERVAL YEAR(CURRENT_DATE())-YEAR (hire_date) + 1 YEAR)
AS       next_hire_anniversary
FROM     employees
ORDER BY next_hire_anniversary ASC;

--

SELECT 
	first_name, 
    last_name, 
	   CONCAT(YEAR(CURRENT_DATE) + IF(DATE_FORMAT(CURRENT_DATE, '%m-%d') > DATE_FORMAT(hire_date, '%m-%d'), 1, 0),
			  DATE_FORMAT(hire_date, '-%m-%d')) AS aniversary_date
FROM employees
ORDER BY aniversary_date ASC;

-- Questions Requiring Creating Functions



-- For these questions, create SQL functions and demonstrate their use. 

-- 4. Calculate the tenure of an employee in years.
-- 	  Name your function calculate_tenure;
--    Show your function works by calling it to show the 
--    tenure of each employee. Order the results from
--    the shortest to longest tenure.
USE employees;
DROP FUNCTION IF EXISTS f_calculate_tenure;
DELIMITER //
CREATE FUNCTION f_calculate_tenure 
(hire_date DATE)
RETURNS INT
NOT DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE tenure_years INT;
    SELECT  tenure_years = TIMESTAMPDIFF(YEAR, hire_date, CURRENT_DATE());
    RETURN  tenure_years;
END //
DELIMITER ;

--

DROP FUNCTION IF EXISTS calculate_tenure;

DELIMITER $$

CREATE FUNCTION calculate_tenure(hire_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN TIMESTAMPDIFF(YEAR, hire_date, CURDATE());
END$$

DELIMITER ;

--

SELECT   first_name, last_name, f_calculate_tenure(hire_date) AS tenure_years
FROM     employees
ORDER BY tenure_years ASC;

SELECT 
	first_name,
    last_name,
    calculate_tenure(hire_date) AS years_tenure
FROM 
	employees
ORDER BY years_tenure ASC;

-- 5. Format phone numbers in a standard format.
-- Write a function to format a phone number to (XXX)XXX-XXXX format. 
-- Name your function format_phone_number.
-- Demonstrate your function works by creating an employee directory
-- returning last_name, first_name, and the phone number correctly 
-- formated. Sort the directory by last and first names.
USE employees;
DROP FUNCTION IF EXISTS f_format_phone_number;
DELIMITER //
CREATE FUNCTION f_format_phone_number
(phone_number VARCHAR(20))
RETURNS VARCHAR(20)
DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE formatted_phone_number VARCHAR(20);
    SET     phone_number = REPLACE(phone_number, '-','');
    SET     phone_number = REPLACE(phone_number, '(','');
	SET     phone_number = REPLACE(phone_number, ')','');
    SET     formatted_phone_number = CONCAT('(', LEFT(phone_number, 3), ')', RIGHT(phone_number, 4));
    RETURN  formatted_phone_number;
END //
DELIMITER ;
    
SELECT   last_name, first_name, f_format_phone_number(phone_number) AS formatted_phone
FROM     employees
ORDER BY last_name, first_name;

-- CREATE FUNCTION format_phone_number(phone_number VARCHAR(20))
-- RETURNS VARCHAR(23)
-- DETERMINISTIC
--  RETURN CONCAT('(', SUBSTRING(phone_number, 1, 3), ')',
--				SUBSTRING(phone_number, 4, 3), '-',
--				SUBSTRING(phone_number, 7, 4));
-- END$$
SELECT 
	last_name,
    first_name,
	format_phone_number(phone_number)
FROM
	employees
ORDER BY
	last_name,
    first_name;
    
-- 6. Determine if an employee's salary is above the average for their department.
-- 	  Demonstrate your function by returning a list of employee names and if their 
--    salary is above their department's average. Sort the list by the employee
--    last and first names.
USE departments
DROP FUNCTION IF EXISTS f_salary_above_department_avg
DELIMITER //
CREATE FUNCTION f_salary_above_department_avg
(empl_id INT)
RETURNS BOOLEAN
DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE dept_avg DECIMAL (10,2);
    DECLARE empl_salary DECIMAL (10,2);
    DECLARE dept_id INT;
    SELECT  department_id, salary 
    INTO    dept_id, empl_salary 
    FROM    employees 
    WHERE   employee_id = empl_id;
    
    SELECT  AVG(salary) 
    INTO    dept_avg 
    FROM    employees
    WHERE   department_id = dept_id;
    
    SELECT  AVG(salary)
    INTO    dept_avg
    FROM    employees
    WHERE   department_id = dept_id;
    
	RETURN  empl_salary > dept_avg;
END //
DELIMITER ;

--

SELECT   last_name, first_name, f_salary_above_department_avg(employee_id) AS salary_average
FROM     employees
GROUP BY last_name, first_name;

DROP FUNCTION IF EXISTS is_salary_above_average;

DELIMITER $$

CREATE FUNCTION is_salary_above_average(emp_id INT)
RETURNS TINYINT(1)  -- 0 for false, 1 for true
-- DETERMINISTIC
BEGIN
  DECLARE avg_salary DECIMAL(10,2);
  DECLARE emp_salary DECIMAL(10,2);

  SELECT AVG(salary) INTO avg_salary
  FROM employees
  WHERE department_id = (SELECT department_id FROM employees WHERE employees.employee_id = emp_id);

  SELECT salary INTO emp_salary
  FROM employees
  WHERE employees.employee_id = emp_id;

  RETURN emp_salary > avg_salary;
END$$

DELIMITER ;

SELECT 
	first_name,
    last_name,
    is_salary_above_average(employee_id) AS above_average
FROM
	employees
ORDER BY 
	last_name,
    first_name;
    
-- Questions Creating and Using Stored Procedures

-- Stored procedures can encapsulate complex queries for reuse and 
-- performance optimization. 

-- 7. Create and use a stored procedure to list employees and their departments.
--    Sort the results by department name, last name, and first name.
-- 	  Stored Procedure: list_employees_departments()
--    Run your procedure to show it works.
DELIMITER //
CREATE PROCEDURE list_employees_departments()
BEGIN
	SELECT e.first_name, e.last_name, d.department_name AS department
    FROM employees e
    INNER JOIN departments d ON e.department_id = d.department_id
    ORDER BY d.department_name, e.last_name, e.first_name;
END //
DELIMITER ;

CALL list_employees_departments();

--

DROP PROCEDURE IF EXISTS ListEmployeesAndDepartments;

DELIMITER $$

CREATE PROCEDURE ListEmployeesAndDepartments()
BEGIN
    SELECT e.first_name, e.last_name, d.department_name
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    ORDER BY d.department_name, e.last_name, e.first_name;
END$$

DELIMITER ;

CALL ListEmployeesAndDepartments();

-- 8. Create a stored procedure to find employees hired in a given year.
--    Test your stored procedure by producing a list of all employees
--    hired in 2022 and sort the result by last and first names.
--    Stored Procedure: employees_hired_in(year INT)
DELIMITER //
CREATE PROCEDURE employees_hired_in(IN year INT)
BEGIN
	SELECT   first_name, last_name, hire_date
    FROM     employees
    WHERE    YEAR(hire_date) = year
    ORDER BY last_name, first_name;
END //
DELIMITER ;

CALL employees_hired_in(2022);

--

DROP PROCEDURE IF EXISTS FindEmployeesHiredInYear;

DELIMITER $$

CREATE PROCEDURE FindEmployeesHiredInYear(IN hire_year INT)
BEGIN
    SELECT employee_id, first_name, last_name, hire_date
    FROM employees
    WHERE YEAR(hire_date) = hire_year
    ORDER BY last_name, first_name;
END$$

DELIMITER ;


CALL FindEmployeesHiredInYear(2023);

-- 9. Create a stored procedure that shows the total number of employees by job title
--    and sort the results by job title.
--    Stored Procedure: count_employees_by_job()
--    Show the procedure works by running it.
DELIMITER //
CREATE PROCEDURE count_employees_by_job()
BEGIN
	SELECT   job_title, COUNT(*) AS total_employees
    FROM     employees
    JOIN     jobs ON employees.job_id = jobs.job_id
    GROUP BY job_title
    ORDER BY job_title;
END //
DELIMITER ;

CALL count_employees_by_job();

--

DROP PROCEDURE IF EXISTS TotalEmployeesByJobTitle;

DELIMITER $$

CREATE PROCEDURE TotalEmployeesByJobTitle()
BEGIN
    SELECT j.job_title, COUNT(e.employee_id) AS total_employees
    FROM employees e
    JOIN jobs j ON e.job_id = j.job_id
    GROUP BY j.job_title
    ORDER BY j.job_title ASC;
END$$

DELIMITER ;

CALL TotalEmployeesByJobTitle();

-- 10. Create a stored procedure named avg_salary_by_location() to 
--     display the average salary of employees in eacg location.
--     The results should by sorted by country, city, and state/province.
--     Be sure to format the average salary in dollars and cents.
--     For example: $65,250.15
--     Show your procedure works by running it.
DELIMITER //
CREATE PROCEDURE avg_salary_by_location()
BEGIN
	SELECT   country_id, city, state_province, FORMAT(AVG(salary), 2) AS avg_salary
    FROM     employees
    JOIN     locations ON employees.department_id = locations.location_id
    GROUP BY country_id, city, state_province
    ORDER BY country_id, city, state_province;
END //
DELIMITER ;

CALL avg_salary_by_location();

--

DROP PROCEDURE IF EXISTS avg_salary_by_location;

DELIMITER $$

CREATE PROCEDURE avg_salary_by_location()
BEGIN
    SELECT l.country_id, l.city, l.state_province,
           CONCAT('$', FORMAT(AVG(e.salary), 2)) AS average_salary
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    JOIN locations l ON d.location_id = l.location_id
    GROUP BY l.country_id, l.city, l.state_province
    ORDER BY l.country_id, l.city, l.state_province;
END$$

DELIMITER ;

CALL avg_salary_by_location();