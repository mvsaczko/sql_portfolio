-- MIS 331 - Lab 3
-- This prompts are meant to help you. However, the if there is any difference
-- between the prompts and the lab instructions, you must follow the instructions!

-- Be sure to use your workspace schema (database).
USE saczko_workspace;

---------------------------------------------------------------------------
-- 5. Insert data the your tables
--    It is VERY important that you insert data into the tables in the 
--    order specified below! Failure to do so will result in errors.
---------------------------------------------------------------------------

-- Insert data into the regions table
INSERT INTO regions
( region_name )
VALUES
('North America');

-- Insert data into the countries table
INSERT INTO countries
( country_id, country_name, region_id )
VALUES
('US', 'United States', '1'),
('CA', 'Canada' ,'1');

-- Insert data into the locations table
INSERT INTO locations
(
    street_address,
    postal_code,
    city,
    state_province,
    country_id
)
VALUES
('123 Main St', '12345', 'New York', 'NY', 'US'),
('456 Elm St', '67890', 'Los Angeles', 'CA', 'US'),
('789 Oak St',	'54321', 'Toronto', 'ON', 'CA');

-- Insert data into the jobs table
INSERT INTO jobs
(
    job_title,
    min_salary,
    max_salary
)
VALUES
('Manager', '50000','80000'),
('Software Engineer', '60000', '100000'), 
('Sales Representative', '40000', '70000'),
('Accountant', '45000', '75000'),
('HR Specialist', '40000', '70000'),
('Marketing Coordinator', '40000', '70000'),
('Customer Support', '35000', '60000'),
('Data Analyst', '50000', '90000'),
('Product Manager', '60000', '110000'),
('Warehouse Clerk',	'30000', '50000');

-- Insert data into the departments table
INSERT INTO departments
(
	department_name,
    location_id
)
VALUES
('HR', '1'),
('Engineering', '2'),
('Sales', '3'),
('Finance', '1'),
('Marketing', '3');

-- Insert data into the employees table
INSERT INTO employees
(
	first_name,
    last_name,
    email,
    phone_number,
    hire_date,
    job_id,
    salary,
    manager_id,
    department_id
)
VALUES
('John', 'Smith', 'john.smith@example.com', '123-456-7890', '2022-01-15', '1', '75000',	 NULL, '1'),
('Mary', 'Johnson', 'mary.johnson@example.com', '987-654-3210', '2021-12-20', '2', '85000',	'1', '2'),
('Jennifer', 'Davis', 'jennifer.davis@example.com', '555-123-4567', '2022-02-10', '3', '65000', '1', '3'),
('Robert', 'Lee', 'robert.lee@example.com', '555-987-6543', '2022-03-15', '4', '60000',	'1', '4'),
('Linda', 'Wilson', 'linda.wilson@example.com', '555-789-0123', '2022-04-20', '6', '55000', '1', '5'),
('David', 'Clark', 'david.clark@example.com', '555-234-5678', '2022-05-25', '8', '70000', '2', '2'),
('Karen', 'Moore', 'karen.moore@example.com', '555-876-5432', '2022-06-30', '7', '60000', '2', '5'),
('Steven', 'Taylor', 'steven.taylor@example.com', '555-432-1098', '2022-07-05', '10', '55000', '2',	'3'),
('Susan', 'Brown', 'susan.brown@example.com', '555-210-9876', '2022-08-10', '5', '70000', '3', '4'),
('Michael', 'Anderson', 'michael.anderson@example.com', '555-654-3210', '2022-09-15', '9', '65000', '3', '2'),
('Patricia', 'Harris', 'patricia.harris@example.com', '555-321-0987', '2022-10-20', '6', '60000', '4', '5'),
('Richard', 'Martin', 'richard.martin@example.com', '555-789-0123', '2022-11-25', '4', '75000',	'4', '4'),
('Jessica', 'White', 'jessica.white@example.com', '555-234-5678', '2022-12-30', '2', '80000', '5', '1'),
('Daniel', 'Thompson', 'daniel.thompson@example.com', '555-432-1098', '2023-01-05', '1', '85000', '5', '2'),
('Nancy', 'Garcia', 'nancy.garcia@example.com', '555-876-5432', '2023-02-10', '3', '70000', '5', '3'),
('Matthew', 'Lewis', 'matthew.lewis@example.com', '555-210-9876', '2023-03-15', '8', '75000', '6', '1'),
('Laura', 'Hall', 'laura.hall@example.com', '555-654-3210', '2023-04-20', '7', '65000', '6', '2'),
('Kevin', 'Young', 'kevin.young@example.com', '555-321-0987', '2023-05-25', '10', '70000', '6',	'3'),
('Kimberly', 'Adams', 'kimberly.adams@example.com', '555-123-4567', '2023-06-30', '5', '75000', '7', '4'),
('Paul'	, 'Wright', 'paul.wright@example.com', '555-987-6543', '2023-07-05', '9', '80000', '7', '5');

-- Insert data into the dependents table
INSERT INTO dependents
(
	first_name,
    last_name,
    relationship,
    employee_id
)
VALUES
('Emily', 'Smith', 'Spouse', '1'),
('Michael', 'Smith', 'Child', '1'),
('Sara', 'Johnson', 'Spouse', '2'),
('Olivia', 'Davis', 'Child', '1'),
('Ethan', 'Smith', 'Child', '1'),
('Grace', 'Johnson', 'Child', '2'),
('Sophia', 'Lee', 'Child', '2'),
('Logan', 'Wilson', 'Child', '3'),
('Ava	Clark', 'Child', '3'),
('Mason', 'Moore', 'Child', '4'),
('Liam', 'Taylor', 'Child', '4'),
('Harper', 'Brown', 'Child', '5'),
('Oliver', 'Anderson', 'Child', '5'),
('Ella', 'Harris', 'Child', '6'),
('Lucas', 'Martin', 'Child', '6'), 
('Scarlett', 'White', 'Child', '7'),
('Noah', 'Thompson', 'Child', '7'),
('Lily', 'Garcia', 'Child', '8'),
('Isabella', 'Lewis', 'Child', '8'),
('Jackson', 'Hall', 'Child', '9'),
('Aiden Young', 'Child', '9'),
('Carter Adams', 'Child', '10'),
('Zoe Wright', 'Child', '10'),
('Chloe Davis', 'Child', '11'),
('Emma Lee', 'Child', '11'),
('Landon', 'Wilson', 'Child', '12'),
('James', 'Clark', 'Child', '12'),
('Lily', 'Moore', 'Child', '13'),
('Aiden', 'Taylor', 'Child', '13'),
('Zoe', 'Brown', 'Child','14');


---------------------------------------------------------------------------
-- Update the data in the tables
---------------------------------------------------------------------------

-- 6. Change the street of the Toronto office to Maple St. Keep everything
-- else the same.
UPDATE
	locations
SET 
	street_address = '789 Maple St' 
WHERE 
	'Toronto' = state_province;

-- 7. Check the updated address
SELECT street_address FROM locations;

-- 8. Raise all of the maximum salaries by 10%
UPDATE
	jobs
SET 
	max_salary = max_salary + (max_salary * 10/100);
    
-- max salary = max salary * 1.10

-- 9, Check to ensure the salaries were updated correctly.
SELECT max_salary FROM jobs;

-- 10. Give Karen Moore and Steven Taylor each a 50% raise. 
UPDATE
	employees
SET 
	salary = salary + (salary * 50/100) WHERE 'Moore' = last_name AND 'Karen' = first_name;
    
UPDATE
	employees
SET 
	salary = salary + (salary * 50/100) WHERE 'Taylor' = last_name AND 'Steven' = first_name;
    
SELECT 
		employee_id,
        salary 
FROM 
		employees 
WHERE
		employee_id IN (7, 8);


UPDATE 
		employees
SET		
		salary = salary * 1.50
WHERE
		employee_id IN (7, 8);

-- 11. Check the updated salaries
SELECT 
		salary 
FROM 
		employees 
WHERE
		employee_id IN (7, 8);
        
-- 12. Remove Aiden Taylor from the dependents table
DELETE
FROM
	dependents 
WHERE 
	first_name = 'Aiden' AND
    last_name = 'Taylor';
    
-- 13. Write a select statement to ensure that Aiden was removed successfully.
-- The following should return zero rows.
SELECT 
	* 
FROM
	dependents
WHERE
	first_name = 'Aiden' AND
    last_name = 'Taylor';
    
-- 14. Get the names of Jessica White's dependents
SELECT 
	first_name,
    last_name
FROM
	dependents
WHERE
	employee_id = 13;
    
-- 15. Get the department name of the department in which Nancy Garcia works.
-- First get Nancy's employee number.
SELECT
	department_id
FROM
	employees
WHERE
	first_name = 'Nancy' AND
    last_name = 'Garcia';
    
-- Use the returned value to get the department name
SELECT 
	department_name
FROM
	departments
WHERE
	department_id = 3;
    
-- 16. Get the names of the countries in which we operate sorted alphabetically
SELECT 
	country_name
FROM
	countries
ORDER BY
	country_name;
    
-- 17. Add Jessica White's spouse, Walter White, to the dependents table.
INSERT
	dependents
		(first_name, last_name, relationship, employee_id) 
        VALUES
        ('Walter', 'White', 'Spouse', 13);

-- 18. Change Jessica White’s name to Skylar White.	
UPDATE 
	employees
SET
	first_name = 'Skylar'
WHERE
	employee_id = 13;
    
-- 19. Change Skylar White’s child’s name to Holly White.
UPDATE
	dependents
SET
	first_name = 'Holly',
    last_name = 'White'
WHERE
	first_name = 'Lily' AND
    last_name = 'Moore';
    
-- 20. Add another child for Skylar White. His first name is Walter Jr. and his
--     last name is White.
INSERT
	dependents (first_name, last_name, relationship, employee_id)
VALUES
	('Walter Jr.', 'White', 'Child', 13);
    
-- 21. Change Skylar White's job to Accountant
UPDATE 
	employees
SET
	job_id = 4
WHERE
	employee_id = 13;
    
-- 22. Get Skylar White's entire employee record
SELECT
	*
FROM 
	employees
WHERE
	employee_id = 13;
    
-- 23. Get all of Skylar White's dependent records
SELECT 
	*
FROM
	dependents
WHERE
	employee_id = 13;
    
-- 24. Get a list of employees making more than their job's maximum salary and list the employee names,
-- salaries, and their jobs' maximum salary.
SELECT
	e.first_name,
    e.last_name,
    e.salary,
    j.max_salary
FROM
	employees e,
    jobs j
WHERE
	e.salary > j.max_salary AND
    e.job_id = j.job_id;
    
-- 25. Get a list of employees making more than their job's maximum salary and list the employee names,
-- salaries, and their jobs' maximum salary.

-- Note: no records should be returned.

SELECT
	e.first_name,
    e.last_name,
    e.salary,
    j.min_salary
FROM
	employees e,
    jobs j
WHERE
	e.salary < j.min_salary AND
    e.job_id = j.job_id;