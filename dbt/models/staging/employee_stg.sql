SELECT
    employee_id,
    CONCAT(first_name, ' ', last_name) as full_name,
    department
FROM {{source('whiskey', 'customers')}}
JOIN {{source('whiskey', 'departments')}}
USING(department_id)
