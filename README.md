# E-Commerce Data Analysis using SQL

## 📌 Business Problem
In an e-commerce business, understanding inventory levels, customer behavior, and sales trends is crucial for optimizing operations. Businesses often struggle with:

- Managing stock efficiently to avoid shortages or overstocking.
- Identifying customer trends and top-performing products.
- Evaluating supplier performance.
- Improve order fulfillment efficiency and minimize cancellations.
- Enhancing profitability through better discount and pricing strategies.

## 🎯 Objective
The goal of this project is to perform data analysis on an e-commerce database to extract meaningful insights that help in:

- Inventory optimization.
- Understanding customer purchasing patterns.
- Supplier performance assessment.
- Revenue and discount impact analysis.
- Improving operational efficiency and customer retention.

## 🗃️ Database Schema
The database consists of multiple related tables:

- **Inventory**: Tracks stock levels and restocking history.
- **Orders**: Stores order details, customer information, and order status.
- **OrderDetails**: Breaks down individual products in an order.
- **Products**: Contains product details, including pricing and category.
- **Suppliers**: Information about suppliers and their contact details.
- **Categories**: Product category classification.
- **CustomersInfo**: Customer profiles and registration details.

## 📊 SQL Queries for Data Analysis

### 1. Inventory Analysis
Find products with the lowest stock levels and their suppliers:
```SQL
SELECT p.ProductID, p.ProductName, i.StockQuantity, s.SupplierName
FROM inventory i
JOIN products p ON i.ProductID = p.ProductID
JOIN suppliers s ON i.SupplierID = s.SupplierID
ORDER BY i.StockQuantity ASC
LIMIT 5;
```

### 2. Order Trends
Monthly trend of total orders placed in the last year:
```sql
SELECT TO_CHAR(OrderDate, 'YYYY-MM') AS Month, COUNT(OrderID) AS TotalOrders
FROM orders
WHERE OrderDate >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY Month
ORDER BY Month;
```

### 3. Customer Insights
Top 5 customers based on total spending:
```sql
SELECT o.CustomerID, c.CustomerName, SUM(o.TotalAmount) AS TotalSpent
FROM orders o
JOIN customers_info c ON o.CustomerID = c.CustomerID
GROUP BY o.CustomerID, c.CustomerName
ORDER BY TotalSpent DESC
LIMIT 5;
```

### 4. Product Performance
Find the highest revenue-generating product in the last 6 months:
```sql
SELECT od.ProductID, p.ProductName, SUM(od.Quantity * od.Price) AS TotalRevenue
FROM order_details od
JOIN products p ON od.ProductID = p.ProductID
JOIN orders o ON od.OrderID = o.OrderID
WHERE o.OrderDate >= CURRENT_DATE - INTERVAL '6 months'
GROUP BY od.ProductID, p.ProductName
ORDER BY TotalRevenue DESC
LIMIT 1;
```

### 5. Supplier Contributions
Find the supplier providing the most variety and quantity of products:
```sql
SELECT i.SupplierID, s.SupplierName, COUNT(DISTINCT i.ProductID) AS TotalProducts, SUM(i.StockQuantity) AS TotalStock
FROM inventory i
JOIN suppliers s ON i.SupplierID = s.SupplierID
GROUP BY i.SupplierID, s.SupplierName
ORDER BY TotalStock DESC
LIMIT 1;
```

### 6. Order Status Breakdown
Find the percentage of orders under each status:
```sql
SELECT OrderStatus, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders) AS Percentage
FROM orders
GROUP BY OrderStatus;
```

### 7. Discount Impact
Calculate revenue lost due to applied discounts:
```sql
SELECT SUM(od.Quantity * od.Price * od.Discount) AS RevenueLost
FROM order_details od;
```

### 8. Restocking Analysis
Find products that require frequent restocking:
```sql
SELECT ProductID, AVG(LastRestockDate - LAG(LastRestockDate) OVER (PARTITION BY ProductID ORDER BY LastRestockDate)) AS AvgRestockInterval
FROM inventory
GROUP BY ProductID
ORDER BY AvgRestockInterval ASC
LIMIT 5;
```

### 9. Category Performance
Find the product category contributing the most to total sales:
```sql
SELECT p.CategoryID, c.CategoryName, SUM(od.Quantity * od.Price) AS TotalSales
FROM order_details od
JOIN products p ON od.ProductID = p.ProductID
JOIN categories c ON p.CategoryID = c.CategoryID
GROUP BY p.CategoryID, c.CategoryName
ORDER BY TotalSales DESC
LIMIT 1;
```

### 10. Customer Retention
Identify repeat customers and calculate the average repeat purchase rate:
```sql
SELECT COUNT(CustomerID) AS RepeatCustomers, AVG(OrderCount) AS AvgOrdersPerCustomer
FROM (
    SELECT CustomerID, COUNT(OrderID) AS OrderCount
    FROM orders
    GROUP BY CustomerID
    HAVING COUNT(OrderID) > 1
) subquery;
```

### 11. Shipping Insights
Calculate the average delivery time for shipped orders:
```sql
SELECT ShippingAddress, AVG(OrderDate - LastRestockDate) AS AvgDeliveryTime
FROM orders o
JOIN inventory i ON o.OrderID = i.InventoryID
WHERE OrderStatus = 'Shipped'
GROUP BY ShippingAddress
ORDER BY AvgDeliveryTime;
```

### 12. Profitability Assessment
Find the most profitable products after discounts:
```sql
SELECT od.ProductID, p.ProductName, SUM(od.Quantity * (od.Price * (1 - od.Discount))) AS NetRevenue
FROM order_details od
JOIN products p ON od.ProductID = p.ProductID
GROUP BY od.ProductID, p.ProductName
ORDER BY NetRevenue DESC
LIMIT 5;
```

### 13. Abandoned Purchases
Count the number of canceled orders:
```sql
SELECT COUNT(OrderID) AS CanceledOrders
FROM orders
WHERE OrderStatus = 'Cancelled';
```

### 14. Order Fulfillment Efficiency
Find the average time between order placement and shipment:
```sql
SELECT AVG(OrderDate - LastRestockDate) AS AvgProcessingTime
FROM orders o
JOIN inventory i ON o.OrderID = i.InventoryID
WHERE OrderStatus = 'Shipped';
```

### 15. Customer Growth
Analyze the monthly growth of new customers:
```sql
SELECT TO_CHAR(RegistrationDate, 'YYYY-MM') AS Month, COUNT(CustomerID) AS NewCustomers
FROM customers_info
GROUP BY Month
ORDER BY Month;
```


## 📌 Conclusion
This analysis helps businesses optimize inventory, enhance customer retention, and boost revenue. If you find this useful, feel free to contribute or raise issues!




