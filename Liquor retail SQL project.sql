-- SALES OVERVIEW

Use   [Liquor_retail];

Select * From [dbo].[liquor];

-- Total sales

Select 
	Sum(Sales) As Total_Sales 
From 
	liquor;

-- Total sales last year

Select    
    Sum(Sales) As Sales_LY
From 
    liquor
Where 
    Year(Date) Between 2012 And 2014;

-- Growth rate over the years

Select
   (Sum(Sales) - 
   Sum(Case When Year(Date) Between 2012 And 2014 Then Sales Else 0 End))/ 
   Abs(Sum(Case When Year(Date) Between 2012 And 2014 Then Sales Else 0 End)) * 100 As growth_rate
From liquor;


-- Total profit

Select 
	Sum(State_Profit_Total_Bottle) As Total_Profit 
From 
	liquor;

-- Total quantity

Select 
	Sum([Bottles_Sold] ) As Total_quantity 
From 
	liquor;

-- Total product

Select 
	Count(distinct([Category_Name])) As Total_product 
From 
	liquor;

-- Monthly sales trend

Select
	Datename(Month,[Date]) as Month_name, 
	Sum([Sales]) as Total_sales
FroM 
	liquor
Group By 
	datename(Month,[Date])
Order by 
	Total_sales;

-- Weekly by sales

Select
    Datepart(Week, Date) As WeekNumber,
    Sum(Sales) As WeeklySales
From
    liquor
Where 
    Year(Date) BETWEEN 2012 AND 2015
Group By 
    Datepart(Week, Date)
Order By 
    WeekNumber;

-- Top 10 product

Select
	Top(10)Category_Name,
	Sum(Bottles_Sold) As Total_BottleSold,
	Sum(Sales) As Total_Sales
From
	liquor
Group By
	Category_Name
Order By 
	Total_Sales Desc;

-- Top 10 Store Name

Select
	Top(10)Store_Name,
	Sum(Sales) As Total_Sales
From
	liquor
Group By
	Store_Name
Order By 
	Total_Sales Desc;

-- Top 10 Vendor Name

Select
	Top(10)Vendor_Name,
	Sum(Sales) As Total_Sales
From
	liquor
Group By
	Vendor_Name
Order By 
	Total_Sales Desc;








