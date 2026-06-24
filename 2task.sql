use zomatodb;
# Data Aggeration  to 	Find the average order amount for each city.
SELECT r.city,
       ROUND(avg(o.total_cost), 2) AS avg_order_amount
FROM Zomato_orders as  o
JOIN Zomato_restaurants as r
    ON o.restaurant_id = r.restaurant_id
GROUP BY r.city
ORDER BY avg_order_amount DESC;

# showing avg amount and  total number of orders per city in the same 
SELECT r.city,
       COUNT(o.order_id) AS total_orders,
       ROUND(AVG(o.total_cost), 2) AS avg_order_amount
FROM Zomato_orders o
JOIN Zomato_restaurants r
    ON o.restaurant_id = r.restaurant_id
GROUP BY r.city
ORDER BY total_orders DESC;

# Identify the top 5 restaurants with the highest total sales.
SELECT r.restaurant_id,
       r.restaurant_name,
       ROUND(SUM(o.total_cost), 2) AS total_sales
FROM Zomato_orders o
JOIN Zomato_restaurants r
    ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_id, r.restaurant_name
ORDER BY total_sales DESC
LIMIT 5;

# Join the Zomato_Orders and Zomato_Restaurants tables to get restaurant names  with order details.
SELECT o.order_id,
       o.customer_id,
       o.order_date,
       o.order_time,
       o.total_cost,
       o.item_count,
       o.payment_method,
       o.customer_rating,
       r.restaurant_name,
       r.city,
       r.cuisine
FROM Zomato_orders o
JOIN Zomato_restaurants r
    ON o.restaurant_id = r.restaurant_id
ORDER BY o.order_date DESC, o.order_time DESC;


SELECT 
    cuisine,
    COUNT(*) AS cuisine_count
FROM zomato_restaurants
WHERE city = 'Mumbai'   -- replace with your target city
GROUP BY cuisine
ORDER BY cuisine_count DESC;


