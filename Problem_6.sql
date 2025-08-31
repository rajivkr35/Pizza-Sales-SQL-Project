-- Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    p.category, SUM(o.quantity) AS quantity
FROM
    pizza_types p
        JOIN
    pizzas pi ON pi.pizza_type_id = p.pizza_type_id
        JOIN
    orders_details o ON o.pizza_id = pi.pizza_id
GROUP BY p.category
ORDER BY quantity DESC; 