-- List the top 5 most ordered pizza types along with their quantities.

SELECT 
    p.name, SUM(o.quantity) AS quantity
FROM
    pizza_types p
        JOIN
    pizzas pi ON p.pizza_type_id = pi.pizza_type_id
        JOIN
    orders_details o ON pi.pizza_id = o.pizza_id
GROUP BY name
ORDER BY quantity DESC
LIMIT 5;