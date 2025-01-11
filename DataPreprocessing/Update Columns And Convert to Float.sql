--Table Information
PRAGMA table_info(Financials)

--Preprocessing Numerical Columns
UPDATE Financials
SET
    _units_sold_ = CAST(REPLACE(REPLACE(_Units_Sold_, '$', ''), ',', '') AS FLOAT),
    _manufacturing_price_ = CAST(REPLACE(REPLACE(_manufacturing_price_, '$', ''), ',', '') AS FLOAT),
    _sale_price_ = CAST(REPLACE(REPLACE(_sale_price_, '$', ''), ',', '') AS FLOAT),
    _Gross_Sales_ = CAST(REPLACE(REPLACE(_gross_sales_, '$', ''), ',', '') AS FLOAT),
    _Discounts_ = CAST(REPLACE(REPLACE(REPLACE(_discounts_, '$-', '-'), '$', ''), ',', '') AS FLOAT),
    __sales_ = CAST(REPLACE(REPLACE(__sales_, '$', ''), ',', '') AS FLOAT),
    _cogs_ = CAST(REPLACE(REPLACE(_cogs_, '$', ''), ',', '') AS FLOAT),
    _profit_ = CAST(REPLACE(REPLACE(_profit_, '$', ''), ',', '') AS FLOAT);

--Grouping
SELECT *
FROM Financials
GROUP BY 
    segment, 
    country, 
    _product_, 
    _discount_band_, 
    _units_sold_, 
    _manufacturing_price_, 
    _sale_price_, 
    _gross_sales_, 
    _discounts_, 
    __sales_, 
    _cogs_, 
    _profit_, 
    month_number, 
    _month_name_
HAVING COUNT(*) > 1;


SELECT
    SUM(CASE WHEN Segment IS NULL THEN 1 ELSE 0 END) AS Missing_Segment,
    SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS Missing_Country,
    SUM(CASE WHEN _Product_ IS NULL THEN 1 ELSE 0 END) AS Missing_Product,
    SUM(CASE WHEN _Discount_Band_ IS NULL THEN 1 ELSE 0 END) AS Missing_Discount_Band,
    SUM(CASE WHEN _Units_Sold_ IS NULL THEN 1 ELSE 0 END) AS Missing_Units_Sold,
    SUM(CASE WHEN _Manufacturing_Price_ IS NULL THEN 1 ELSE 0 END) AS Missing_Manufacturing_Price,
    SUM(CASE WHEN _Sale_Price_ IS NULL THEN 1 ELSE 0 END) AS Missing_Sale_Price,
    SUM(CASE WHEN _Gross_Sales_ IS NULL THEN 1 ELSE 0 END) AS Missing_Gross_Sales,
    SUM(CASE WHEN _Discounts_ IS NULL THEN 1 ELSE 0 END) AS Missing_Discounts,
    SUM(CASE WHEN __Sales_ IS NULL THEN 1 ELSE 0 END) AS Missing_Sales,
    SUM(CASE WHEN _COGS_ IS NULL THEN 1 ELSE 0 END) AS Missing_COGS,
    SUM(CASE WHEN _Profit_ IS NULL THEN 1 ELSE 0 END) AS Missing_Profit,
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS Missing_Date,
    SUM(CASE WHEN Month_Number IS NULL THEN 1 ELSE 0 END) AS Missing_Month_Number,
    SUM(CASE WHEN _Month_Name_ IS NULL THEN 1 ELSE 0 END) AS Missing_Month_Name,
    SUM(CASE WHEN Year IS NULL THEN 1 ELSE 0 END) AS Missing_Year
 FROM Financials
