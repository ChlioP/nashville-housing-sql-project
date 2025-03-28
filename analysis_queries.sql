-- 1. Average Sale Price by Year
SELECT 
  YEAR(Sale_Date_Clean) AS Year, 
  ROUND(AVG(`Sale Price`), 2) AS Average_Price
FROM nashville_housing_data_2013_2016
WHERE Sale_Date_Clean IS NOT NULL
  AND `Sale Price` > 0
GROUP BY Year
ORDER BY Year;

-- 2. Total Sales by Year
SELECT 
  YEAR(Sale_Date_Clean) AS Year, 
  COUNT(*) AS Total_Sales
FROM nashville_housing_data_2013_2016
WHERE Sale_Date_Clean IS NOT NULL
GROUP BY Year
ORDER BY Year;

-- 3. Total Properties Sold by City
SELECT 
  `Property City`, 
  COUNT(*) AS Properties_Sold
FROM nashville_housing_data_2013_2016
GROUP BY `Property City`
ORDER BY Properties_Sold DESC;

-- 4. Maximum Sale Price by Neighborhood
SELECT 
  Neighborhood, 
  MAX(`Sale Price`) AS Max_Sale_Price
FROM nashville_housing_data_2013_2016
GROUP BY Neighborhood
ORDER BY Max_Sale_Price DESC
LIMIT 10;

-- 5. Average Price by Bedroom Count
SELECT 
  `Bedrooms`, 
  ROUND(AVG(`Sale Price`), 2) AS Avg_Price
FROM nashville_housing_data_2013_2016
WHERE `Bedrooms` IS NOT NULL
GROUP BY `Bedrooms`
ORDER BY `Bedrooms`;
