# 🍕 Pizza Sales Analysis | SQL Project

---

## Project Overview
Analysis of pizza sales data for Pizza Hut to identify top-selling pizzas, popular sizes, peak sales hours, and category performance. Data from 4 Excel sources (Orders – 21K+, Order Details – 48K+, Pizzas – 97, Pizza Types – 33) was imported into MySQL for structured analysis.

---

## Objective
- Integrate and structure pizza sales data in MySQL.  
- Calculate total revenue, order volumes, category-wise distribution, cumulative revenue, and time-based trends.  
- Extract actionable insights for menu optimization and marketing strategy.  

---

## Database & Tables
| Table Name       | Description |
|-----------------|-------------|
| `orders`         | Order ID, date, time |
| `order_details`  | Pizza quantities per order |
| `pizzas`         | Pizza ID, name, size, price, type |
| `pizza_types`    | Type name, category |

> Database: `pizzahut`

---

## SQL Queries & Outputs

### 1️⃣ Total Number of Orders
```sql
SELECT COUNT(Order_id) AS Total_orders
FROM orders;
````

![Total Orders](1 op.png)

---

### 2️⃣ Total Revenue from Pizza Sales

```sql
SELECT ROUND(SUM(order_details.quantity * pizzas.price), 2) AS Total_sales
FROM order_details
JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id;
```

![Total Revenue](2 op.png)

---

### 3️⃣ Highest-Priced Pizza

```sql
SELECT pizza_types.name, pizzas.price
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;
```

![Highest-Priced Pizza](3 op.png)

---

### 4️⃣ Most Common Pizza Size Ordered

```sql
SELECT pizzas.size, COUNT(order_details.Order_details_id) AS order_count
FROM pizzas
JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC;
```

![Most Common Size](screenshots/4_common_size.png)

---

### 5️⃣ Top 5 Most Ordered Pizza Types

```sql
SELECT pizza_types.name, SUM(order_details.quantity) AS Quantity
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;
```

![Top 5 Pizza Types](screenshots/5_top5_types.png)

---

### 6️⃣ Total Quantity of Each Pizza Category

```sql
SELECT pizza_types.category, SUM(order_details.quantity) AS Quantity
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC;
```

![Category Quantity](screenshots/6_category_quantity.png)

---

### 7️⃣ Distribution of Orders by Hour

```sql
SELECT HOUR(order_time) AS Hour, COUNT(order_id) AS Order_Count
FROM orders
GROUP BY HOUR(order_time);
```

![Orders by Hour](screenshots/7_orders_by_hour.png)

---

### 8️⃣ Category-Wise Distribution of Pizzas

```sql
SELECT category, COUNT(name) as Pizza_distribution
FROM pizza_types
GROUP BY category;
```

![Category Distribution](screenshots/8_category_distribution.png)

---

### 9️⃣ Average Number of Pizzas Ordered Per Day

```sql
SELECT ROUND(AVG(quantity), 0) as Avg_pizza_ordered_per_day
FROM (
    SELECT orders.Order_date, SUM(order_details.quantity) AS Quantity
    FROM orders
    JOIN order_details ON orders.Order_id = order_details.Order_id
    GROUP BY orders.Order_date
) AS Order_Quantity;
```

![Average Pizzas per Day](screenshots/9_avg_per_day.png)

---

### 🔟 Top 3 Most Ordered Pizza Types by Revenue

```sql
SELECT pizza_types.name as Name, SUM(order_details.quantity * pizzas.price) AS Revenue
FROM pizza_types
JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;
```

![Top 3 Pizza Revenue](screenshots/10_top3_revenue.png)

---

### 11️⃣ Percentage Contribution of Each Pizza Type to Total Revenue

```sql
SELECT pizza_types.category as Category,
ROUND(SUM(order_details.quantity * pizzas.price) / (
    SELECT ROUND(SUM(order_details.quantity * pizzas.price), 2)
    FROM order_details
    JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id
) * 100, 2) AS Revenue
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue DESC;
```

![Revenue Percentage](screenshots/11_revenue_percentage.png)

---

### 12️⃣ Cumulative Revenue Over Time

```sql
SELECT order_date, SUM(revenue) OVER(ORDER BY order_date) AS Cum_revenue
FROM (
    SELECT orders.Order_date, SUM(order_details.quantity * pizzas.price) AS revenue
    FROM order_details
    JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
    JOIN orders ON orders.Order_id = order_details.Order_id
    GROUP BY orders.Order_date
) AS Sales;
```

![Cumulative Revenue](screenshots/12_cumulative_revenue.png)

---

### 13️⃣ Top 3 Most Ordered Pizza Types by Revenue per Category

```sql
SELECT name, revenue FROM (
    SELECT category, name, revenue,
    RANK() OVER(PARTITION BY category ORDER BY revenue DESC) AS rn
    FROM (
        SELECT pizza_types.category, pizza_types.name,
        SUM(order_details.quantity * pizzas.price) AS revenue
        FROM pizza_types
        JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
        GROUP BY pizza_types.category, pizza_types.name
    ) AS a
) AS b
WHERE rn <= 3;
```

![Top 3 Revenue per Category](screenshots/13_top3_category.png)

---

## Key Insights

* Top-selling pizzas and best-performing categories identified.
* Peak sales hours and popular sizes help optimize staffing and menu planning.
* Insights guide marketing strategy and menu optimization.

---

## Tools & Technologies

* MySQL (Database)
* MySQL Workbench (IDE)
* Excel (Data Source)

---

## Author

**Poonam Gade**
Data Analyst | SQL | Excel | Power BI | Python | R | Statistics
