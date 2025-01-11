SELECT
	Segment,
    Country,
    _Product_,
    SUM(__Sales_) As Total_Sales,
    SUM(_Profit_) AS Total_Profit,
    SUM(_Units_Sold_) AS Total_Units_Sold,
    AVG(_Discounts_) AS Average_Discouunt
FROM Financials
GROUP BY Segment, Country, _product_
ORDER BY Total_Sales DESC
LIMIT 5;

"Segment"|"Country"|"_Product_"|"Total_Sales"|"Total_Profit"|"Total_Units_Sold"|"Average_Discouunt"
"Government"|"Canada"|" Paseo "|"3956873.45"|"861733.45"|"32266.5"|"16645.08611111111"
"Government"|"Mexico"|" Paseo "|"3567885.44"|"601520.44"|"29943"|"27140.30888888889"
"Small Business"|"United States of America"|" VTT "|"3095841"|"254841"|"11364"|"52226.5"
"Small Business"|"United States of America"|" Paseo "|"2908284"|"331034"|"10309"|"46104"
"Small Business"|"Canada"|" VTT "|"2876940"|"324440"|"10210"|"31010"