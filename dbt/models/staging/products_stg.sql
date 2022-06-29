SELECT product_id,
        category,
        product_name
FROM {{ source('whiskey', 'products') }}