CREATE PROCEDURE sp_get_employees_by_department
AS
BEGIN
    SELECT e.employee_id, e.first_name, e.last_name, d.department_name
    FROM employees e
    INNER JOIN departments d ON e.department_id = d.department_id
    ORDER BY e.employee_id;

    DECLARE @min_salary DECIMAL(10, 2);
    SET @min_salary = (SELECT MIN(salary) FROM employees);

    SELECT e.employee_id, e.first_name, e.last_name, e.salary
    FROM employees e
    WHERE e.salary > @min_salary;

    DECLARE @max_salary DECIMAL(10, 2);
    SET @max_salary = (SELECT MAX(salary) FROM employees);

    SELECT e.employee_id, e.first_name, e.last_name, e.salary
    FROM employees e
    WHERE e.salary < @max_salary;

    DECLARE @avg_salary DECIMAL(10, 2);
    SET @avg_salary = (SELECT AVG(salary) FROM employees);

    SELECT e.employee_id, e.first_name, e.last_name, e.salary
    FROM employees e
    WHERE e.salary > @avg_salary;

    DECLARE @department_id INT;
    SET @department_id = (SELECT department_id FROM departments WHERE department_name = 'Sales');

    SELECT e.employee_id, e.first_name, e.last_name, e.department_id
    FROM employees e
    WHERE e.department_id = @department_id;

    DECLARE @employee_id INT;
    SET @employee_id = (SELECT employee_id FROM employees WHERE first_name = 'John' AND last_name = 'Doe');

    SELECT e.employee_id, e.first_name, e.last_name, e.salary
    FROM employees e
    WHERE e.employee_id = @employee_id;

    DECLARE @department_name VARCHAR(50);
    SET @department_name = (SELECT department_name FROM departments WHERE department_id = 1);

    SELECT e.employee_id, e.first_name, e.last_name, d.department_name
    FROM employees e
    INNER JOIN departments d ON e.department_id = d.department_id
    WHERE d.department_name = @department_name;

    DECLARE @job_title VARCHAR(50);
    SET @job_title = (SELECT job_title FROM jobs WHERE job_id = 1);

    SELECT e.employee_id, e.first_name, e.last_name, j.job_title
    FROM employees e
    INNER JOIN jobs j ON e.job_id = j.job_id
    WHERE j.job_title = @job_title;
END;
