select 
    customer_id,
    CONCAT(first_name, ' ', last_name) as full_name,
    credit_provider
from {{ source('whiskey', 'customers') }}
