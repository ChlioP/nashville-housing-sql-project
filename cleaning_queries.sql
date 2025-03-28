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
