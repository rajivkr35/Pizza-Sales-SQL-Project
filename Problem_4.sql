-- Identify the most common pizza size ordered.

SELECT p.size, COUNT(o.order_details_id) AS total_order
FROM pizzas p
JOIN orders_details o 
ON p.pizza_id = o.pizza_id
GROUP BY p.size
ORDER BY total_order DESC;