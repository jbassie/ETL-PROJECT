select 
    customer_id,
    first_name,
    last_name,
    email,
    credit_provider
from {{source('whiskey', 'customers')}}
