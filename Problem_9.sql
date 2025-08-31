-- Group the orders by date and 
-- calculate the average number of pizzas ordered per day.

SELECT 
    ROUND(AVG(order_per_day), 0) AS avg_pizza_order_per_day
FROM
    (SELECT 
        o.order_date AS Date, SUM(od.quantity) AS order_per_day
    FROM
        orders o
    JOIN orders_details od ON o.order_id = od.order_id
    GROUP BY Date) AS order_quantity;