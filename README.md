## Project Overview
This project focuses on cleaning and analyzing a real-world housing dataset from Nashville, TN using SQL. The dataset includes sales records of properties from 2013 to 2016. The goal was to transform raw, messy data into a clean, analysis-ready format and generate useful business insights.

---

## Tools & Technologies Used
- **MySQL 8.0** – for SQL queries and data transformation
- **MySQL Workbench** – for database connection and query execution
- **CSV (Kaggle Dataset)** – raw dataset used

---

## Data Cleaning Tasks
1. **Removed Duplicate Records**
2. **Converted `Sale Date` from text to proper `DATE` format**
3. **Standardized values in `Sold As Vacant` column (e.g., 'Y' to 'Yes')**
4. **Renamed `Property Address` to `Street Address`**
5. **Verified and used existing `Property City` column**
6. **Handled nulls and fixed potential formatting issues in numeric fields**

---

## Data Analysis Performed
- Average Sale Price by Year
- Total Sales Count by Year
- Total Properties Sold by City
- Maximum Sale Price by Neighborhood
- Average Sale Price by Number of Bedrooms

---

## Key Takeways
- Developed proficiency in SQL data cleaning techniques
- Gained hands-on experience with real-world datasets
- Practiced analytical thinking to extract insights
- Learned how to handle and debig real SQL errors such as:
    - Error 1093: You can;t specify target table for update
    - Error 1175: Safe update mode restructions
    - Error 1411: Incorrect datetime value
    - Error 1305: Function not recorginzed

---

## Tableau Dashboard
https://public.tableau.com/app/profile/chliona.pham/viz/Nashville_Housing_Data/Dashboard1?publish=yes
<img width="652" alt="Nashville_housing_dashboard" src="https://github.com/user-attachments/assets/4c67f975-2f2d-4ac1-b0a1-845f4ed8ad57" />

---

## Dataset Source 
https://www.kaggle.com/datasets/tmthyjames/nashville-housing-data


