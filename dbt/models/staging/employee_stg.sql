SELECT
    employee_id,
    CONCAT(first_name, ' ', last_name) as full_name,
    department
FROM employees e
JOIN departments d
USING(department_id)
