-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pt.category,
    ROUND(SUM(o.quantity * p.price) / (SELECT 
                    ROUND(SUM(o.quantity * p.price), 2) AS total_sales
                FROM
                    orders_details o
                        JOIN
                    pizzas p ON o.pizza_id = p.pizza_id) * 100,
            2) AS sales_percentage
FROM
    pizza_types pt
        JOIN
    pizzas p ON p.pizza_type_id = pt.pizza_type_id
        JOIN
    orders_details o ON p.pizza_id = o.pizza_id
GROUP BY pt.category;
