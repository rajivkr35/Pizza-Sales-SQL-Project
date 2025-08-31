-- Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pt.name AS pizza_name, SUM(p.price * o.quantity) AS sales
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    orders_details o ON p.pizza_id = o.pizza_id
GROUP BY pizza_name
ORDER BY sales DESC
LIMIT 3;