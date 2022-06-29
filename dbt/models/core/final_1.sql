with customers as (
    SELECT * 
    FROM {{ ref('customers_stg') }}
 
),

payemnts as (
    SELECT {{ ref ('employee_stg') }}.* , 
        payment_id,
        date,
        price
    FROM {{ ref ('employee_stg') }}
    JOIN payments
    USING(employee_id)
  
),

products as (
    SELECT *
    FROM {{ ref ('products_stg') }} ) ,

final as ( SELECT *
        FROM customers
        JOIN payments
        USING(customer_id)
        JOIN products
        USING(product_id)
        where date > 2010 )

select * from final