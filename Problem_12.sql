-- Analyze the cumulative revenue generated over time.

SELECT date,
SUM(revenue) OVER(ORDER BY date) AS cum_revenue
FROM
(SELECT o.order_date AS date, SUM(p.price*od.quantity) AS revenue
FROM orders o
JOIN orders_details od
ON o.order_id = od.order_id
JOIN pizzas p
ON od.pizza_id = p.pizza_id
GROUP BY date) AS sales;