create database AdventureWorks;

-- 1. Total sales per year

SELECT 
    d.CalendarYear AS Year,
    ROUND(SUM((f.UnitPrice * f.OrderQuantity) - f.DiscountAmount), 2) AS TotalSales
FROM Fact_Internet_Sales_New f
JOIN DimDate d 
    ON f.OrderDateKey = d.DateKey
GROUP BY d.CalendarYear
ORDER BY d.CalendarYear;

-- 2. Total sales and profit per product category

SELECT 
    pc.EnglishProductCategoryName AS ProductCategory,
    ROUND(SUM((f.UnitPrice * f.OrderQuantity) - f.DiscountAmount), 2) AS TotalSales,
    ROUND(SUM(((f.UnitPrice * f.OrderQuantity) - f.DiscountAmount) - 
              (f.ProductStandardCost * f.OrderQuantity)), 2) AS Profit
FROM Fact_Internet_Sales_New f
JOIN DimProduct p 
    ON f.ProductKey = p.ProductKey
JOIN DimProductSubCategory ps
    ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN DimProductCategory pc
    ON ps.ProductCategoryKey = pc.ProductCategoryKey
GROUP BY pc.EnglishProductCategoryName
ORDER BY TotalSales DESC;

-- 3. Total sales and profit per product subcategory
SELECT 
    ps.EnglishProductSubcategoryName AS ProductSubcategory,
    ROUND(SUM((f.UnitPrice * f.OrderQuantity) - f.DiscountAmount), 2) AS TotalSales,
    ROUND(SUM(((f.UnitPrice * f.OrderQuantity) - f.DiscountAmount) - 
              (f.ProductStandardCost * f.OrderQuantity)), 2) AS Profit
FROM Fact_Internet_Sales_New f
JOIN DimProduct p 
    ON f.ProductKey = p.ProductKey
JOIN DimProductSubCategory ps
    ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
GROUP BY ps.EnglishProductSubcategoryName
ORDER BY TotalSales DESC;

-- 4. Top 10 customers by total sales

SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    ROUND(SUM((f.UnitPrice * f.OrderQuantity) - f.DiscountAmount), 2) AS TotalSales
FROM Fact_Internet_Sales_New f
JOIN DimCustomer c 
    ON f.CustomerKey = c.CustomerKey
GROUP BY c.FirstName, c.LastName
ORDER BY TotalSales DESC
LIMIT 10;

-- 5. Total sales and profit per sales territory

SELECT 
    t.SalesTerritoryRegion AS Region,
    ROUND(SUM((f.UnitPrice * f.OrderQuantity) - f.DiscountAmount), 2) AS TotalSales,
    ROUND(SUM(((f.UnitPrice * f.OrderQuantity) - f.DiscountAmount) - 
              (f.ProductStandardCost * f.OrderQuantity)), 2) AS Profit
FROM Fact_Internet_Sales_New f
JOIN DimSalesTerritory t 
    ON f.SalesTerritoryKey = t.SalesTerritoryKey
GROUP BY t.SalesTerritoryRegion
ORDER BY TotalSales DESC;

-- 6. Monthly sales trend across years

SELECT 
    d.CalendarYear AS Year,
    d.MonthNumberOfYear AS MonthNo,
    d.EnglishMonthName AS MonthName,
    ROUND(SUM((f.UnitPrice * f.OrderQuantity) - f.DiscountAmount), 2) AS TotalSales
FROM Fact_Internet_Sales_New f
JOIN DimDate d 
    ON f.OrderDateKey = d.DateKey
GROUP BY d.CalendarYear, d.MonthNumberOfYear, d.EnglishMonthName
ORDER BY d.CalendarYear, d.MonthNumberOfYear;

-- 7. Quarterly sales and profit trend

SELECT 
    d.CalendarYear AS Year,
    d.CalendarQuarter AS Quarter,
    ROUND(SUM((f.UnitPrice * f.OrderQuantity) - f.DiscountAmount), 2) AS TotalSales,
    ROUND(SUM(((f.UnitPrice * f.OrderQuantity) - f.DiscountAmount) - 
              (f.ProductStandardCost * f.OrderQuantity)), 2) AS Profit
FROM Fact_Internet_Sales_New f
JOIN DimDate d 
    ON f.OrderDateKey = d.DateKey
GROUP BY d.CalendarYear, d.CalendarQuarter
ORDER BY d.CalendarYear, d.CalendarQuarter;

-- 8. Top 10 Most Profitable Products

SELECT 
    p.EnglishProductName AS ProductName,
    ROUND(SUM(f.SalesAmount - f.TotalProductCost), 2) AS Profit
FROM 
    Fact_Internet_Sales_New f
JOIN 
    DimProduct p
ON 
    f.ProductKey = p.ProductKey
GROUP BY 
    p.EnglishProductName
ORDER BY 
    Profit DESC
LIMIT 10;

-- 9. Profit Margin Percentage per Product Category

SELECT 
    pc.EnglishProductCategoryName AS Category,
    ROUND(
        (SUM(f.SalesAmount - f.TotalProductCost) / SUM(f.SalesAmount)) * 100,
        2
    ) AS ProfitMarginPercentage
FROM 
    Fact_Internet_Sales_New f
JOIN 
    DimProduct p
ON 
    f.ProductKey = p.ProductKey
JOIN 
    DimProductSubCategory sc
ON 
    p.ProductSubcategoryKey = sc.ProductSubcategoryKey
JOIN 
    DimProductCategory pc
ON 
    sc.ProductCategoryKey = pc.ProductCategoryKey
GROUP BY 
    pc.EnglishProductCategoryName
ORDER BY 
    ProfitMarginPercentage DESC;
    
    
-- 10. Top 5 Products by Sales per Territory

WITH RegionalProductSales AS (
    SELECT
        st.SalesTerritoryRegion AS Territory,
        p.EnglishProductName AS ProductName,
        ROUND(SUM(f.SalesAmount), 2) AS TotalSales
    FROM
        Fact_Internet_Sales_New f
    JOIN DimProduct p
        ON f.ProductKey = p.ProductKey
    JOIN DimSalesterritory st
        ON f.SalesTerritoryKey = st.SalesTerritoryKey
    GROUP BY
        st.SalesTerritoryRegion,
        p.EnglishProductName
)

SELECT
    Territory,
    ProductName,
    TotalSales
FROM (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY Territory ORDER BY TotalSales DESC) AS rn
    FROM RegionalProductSales
) AS ranked
WHERE rn <= 5
ORDER BY Territory ASC, TotalSales DESC;

    













