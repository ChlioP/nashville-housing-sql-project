-- 1. Remove Duplicate Records
DELETE FROM nashville_housing_data_2013_2016
WHERE `Unnamed: 0` NOT IN (
  SELECT * FROM (
    SELECT MIN(`Unnamed: 0`)
    FROM nashville_housing_data_2013_2016
    GROUP BY `Parcel ID`, `Sale Date`, `Sale Price`
  ) AS temp
);

-- 2. Add and Convert Sale_Date_Clean
ALTER TABLE nashville_housing_data_2013_2016
ADD COLUMN Sale_Date_Clean DATE;

SET SQL_SAFE_UPDATES = 0;
UPDATE nashville_housing_data_2013_2016
SET Sale_Date_Clean = STR_TO_DATE(`Sale Date`, '%Y-%m-%d')
WHERE `Sale Date` REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$';
SET SQL_SAFE_UPDATES = 1;

-- 3. Standardize Sold As Vacant
UPDATE nashville_housing_data_2013_2016
SET `Sold As Vacant` = 
  CASE 
    WHEN `Sold As Vacant` = 'Y' THEN 'Yes'
    WHEN `Sold As Vacant` = 'N' THEN 'No'
    ELSE `Sold As Vacant`
  END;

-- 4. Clean numeric columns
UPDATE nashville_housing_data_2013_2016
SET `Bedrooms` = NULL
WHERE `Bedrooms` NOT REGEXP '^[0-9]+$';

UPDATE nashville_housing_data_2013_2016
SET `Sale Price` = NULL
WHERE `Sale Price` IS NULL OR `Sale Price` = 0;

-- analysis_queries.sql

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
