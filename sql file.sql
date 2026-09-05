1) SELECT Country, 
sum(RevenueEUR) As Total_revenue,
sum(MarginEUR) As Total_margin,
round((sum(MarginEUR)/sum(RevenueEUR) )* 100, 3) as margin_percent
FROM FactSales
JOIN DimPharmacy ON FactSales.PharmacyID = DimPharmacy.PharmacyID
GROUP BY Country
ORDER BY margin_percent DESC;

2) SELECT avg(UnitsSold) as Avg_units_sold,
round (avg(MarginEUR), 3) as avg_margin,
PromoFlag
FROM FactSales
group by PromoFlag;

3) SELECT 
sum(RevenueEUR) as Total_revenue,
round( (sum(MarginEUR)/ sum(RevenueEUR) )* 100, 3) As margin_percent,
IsGeneric 
FROM FactSales
JOIN DimProduct ON FactSales.ProductID = DimProduct.ProductID
GROUP by IsGeneric;

4) SELECT 
CASE 
WHEN MarginEUR >= 50 THEN 'High Margin'
WHEN MarginEUR >= 25 THEN 'Medium Margin'
ELSE 'Low Margin'
END AS Margin_Band,
count(*) AS Transaction_Count,
sum(RevenueEUR) AS Total_revenue
FROM FactSales
GROUP BY  Margin_Band
ORDER BY Total_revenue DESC

5) SELECT Year, sum(RevenueEUR) as Total_Revenue
FROM FactSales
JOIN DimDate
ON FactSales.DateKey = DimDate.DateKey
GROUP BY Year
