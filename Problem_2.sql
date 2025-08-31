-- Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(o.quantity * p.price),2) AS total_sales
FROM
    orders_details o
        JOIN
    pizzas p ON o.pizza_id = p.pizza_id;