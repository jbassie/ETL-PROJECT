SELECT
    employee_id,
    first_name,
    last_name,
    department
FROM employees e
JOIN departments d
USING(department_id)
