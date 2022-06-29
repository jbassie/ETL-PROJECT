SELECT
    employee_id,
    CONCAT(first_name, ' ', last_name) as full_name,
    department
FROM {{source ('whiskey', 'employees') }}
JOIN {{source ('whiskey', 'departments') }}
USING(department_id)
