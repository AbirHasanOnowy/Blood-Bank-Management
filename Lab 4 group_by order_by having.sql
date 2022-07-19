
-- Grouping orders by blood type and showing by total number of orders of that blood type in ascending order --
SELECT SUM(Order_amount),Blood_type FROM Orders
GROUP BY Blood_type 
ORDER BY SUM(Order_amount);

-- Grouping orders by hospital id and showing by total number of orders of that blood type in ascending order --
SELECT H_Id,SUM(Order_amount) FROM Orders
GROUP BY H_Id 
ORDER BY SUM(Order_amount);

---- Grouping orders by hospital id and showing by total number of orders of that blood type in ascending order having order more than 15----
SELECT H_Id,SUM(Order_amount) FROM Orders
GROUP BY H_ID
HAVING SUM(Order_amount) > 20
ORDER BY H_Id;

SELECT H_Id,AVG(Order_amount)"Average_order_amount",
SUM(Order_amount)"Total_amount",COUNT(Order_amount)"Number_of_orders" 
FROM Orders
GROUP BY H_Id 
ORDER BY H_Id;

-- Grouping orders by hospital id and showing by total number of orders of that blood type in ascending order --
SELECT H_Id,Blood_type,Order_amount FROM Orders
ORDER BY H_Id ;

-- Again grouping them by blood type and showing total amount --
SELECT H_Id,Blood_type,SUM(Order_amount) FROM Orders
GROUP BY H_ID,Blood_type
ORDER BY H_Id ;


-- notes --
-- HAVING thakle GROUP BY must thakte hobe --
-- GROUP BY thakle AVG/SUM/COUNT must thakte hobe --

