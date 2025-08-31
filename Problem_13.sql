-- Determine the top 3 most ordered pizza types based on revenue for 
-- each pizza category.

SELECT category, name, revenue,rn
FROM
(SELECT category, name, revenue,
RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS rn
FROM
(SELECT pt.category, pt.name, SUM(o.quantity*p.price) AS revenue
FROM pizza_types pt
JOIN pizzas p
ON p.pizza_type_id=pt.pizza_type_id
JOIN orders_details o
ON p.pizza_id=o.pizza_id
GROUP BY pt.category, pt.name) AS a) AS b
WHERE rn<4;