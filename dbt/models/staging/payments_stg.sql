SELECT
    payment_id,
    customer_id,
    employee_id,
    product_id,
    Datetrunc('month', month)
FROM payments
    