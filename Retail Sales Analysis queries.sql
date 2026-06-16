Select TOP 10* from [Sales-data]

--Total Sales profit and orders
select ROUND(sum(Sales),2) as Total_Sales,ROUND(sum(Profit),2) as Total_Profit,
COUNT(distinct[order_ID]) as Total_Orders,COUNT(distinct[Customer_ID]) as Total_Customers
from [Sales-data]

--Sales by Category
select Category,ROUND(sum(Sales), 2) as total_sales, ROUND(sum(Profit), 2) as total_profit
from [Sales-data]
group by Category
order by total_sales DESC

--Top 10 products
select top 10 [Product_Name],ROUND(sum(Sales), 2) as total_sales,ROUND(sum(Profit), 2) as total_profit,
sum(Quantity) as total_quantity
from [Sales-data]
group by [Product_Name]
order by total_sales DESC

--Monthly sales trend
select year([Order_Date]) as order_year,MONTH([Order_Date]) as order_month,ROUND(sum(Sales), 2) as monthly_sales,
ROUND(sum(Profit), 2) as monthly_profit
from [Sales-data]
group by year([Order_Date]), month([Order_Date])
order by order_year, order_month

--Customer Segmented performance
select Segment,ROUND(sum(Sales), 2) as total_sales,ROUND(sum(Profit), 2) as total_profit,
COUNT(distinct [Customer_ID]) as customers
from [Sales-data]
group by Segment
order by total_sales DESC

--Loss making products
select top 10 [Product_Name],ROUND(sum(Sales), 2) as total_sales,ROUND(sum(Profit), 2) as total_profit
from [Sales-data]
group by [Product_Name]
having sum(Profit) < 0
order by total_profit ASC



