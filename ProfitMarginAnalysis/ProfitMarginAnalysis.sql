SELECT
	_Product_,
    SUM(__Sales_) AS Total_Sales,
    SUM(_Profit_) AS Total_Profit,
    (SUM(_Profit_)/SUM(__Sales_)) AS Profit_Margin
FROM Financials
Group BY _product_
ORDER BY Profit_Margin DESC

"_Product_","Total_Sales","Total_Profit","Profit_Margin"
" Amarilla ","17747116.07","2936044.07","0.16543781301814633"
" VTT ","20511921.02","3156348.02","0.15387871359890795"
" Paseo ","33011143.96","4917986.71","0.14897959052734383"
" Carretera ","13815307.89","2057914.89","0.1489590319944726"
" Montana ","15390801.88","2171281.13","0.1410765434399835"
" Velo ","18250059.47","2431448.72","0.13322963270321883"

