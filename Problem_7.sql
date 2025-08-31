-- revenue for each pizza category

SELECT p.category,
       ROUND(SUM(o.quantity * pi.price), 2) AS total_revenue
FROM pizza_types p
JOIN pizzas pi ON pi.pizza_type_id = p.pizza_type_id
JOIN orders_details o ON o.pizza_id = pi.pizza_id
GROUP BY p.category
ORDER BY total_revenue DESC;