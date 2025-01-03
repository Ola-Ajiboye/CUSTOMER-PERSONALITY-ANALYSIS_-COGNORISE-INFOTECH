select * from marketing

--KPI's
--Total Income
Select
	round(sum(income)/100,2) as Total_income
From 
	marketing

--No. Customers
Select
	count(id) as No_customer
From 
	marketing

--Products Total
Select
	sum(mntwines) as Total_Wine_income,
	sum(mntfruits) as Total_fruits_income,
	sum(mntmeatproducts) as Total_meat_income,
	sum(mntfishproducts) as Total_fish_income,
	sum(mntsweetproducts) as Total_sweet_income,
	sum(mntgoldprods) as Total_gold_income
From
	marketing

---EDA ANALYSIS

--INCOME BY MARITAL STATUS
Select
	Marital_status as Marital_status,
	sum(income) as Income
From
	marketing
Group by
	Marital_status
Order by 
	income desc

-- NO CUSTOMERS BY EDUCATION
Select
	Education as Education,
	count(id) as customers_number
From
	marketing
Group by
	Education
Order by
	customers_number desc

-- MATRIAL STATUS BY PRODUCTS PERCENTAGE
Select
	marital_status as Marital_Status,
	(concat(sum(mntwines)*100/
	(select sum(mntwines) from marketing), '%')) as wines_percentageh,
	(concat(sum(mntfruits)*100/
	(select sum(mntfruits) from marketing), '%')) as fruits_parcentage,
	(concat(sum(mntmeatproducts)*100/
	(select sum(mntmeatproducts) from marketing),'%')) as Meat_percentage,
	(concat(sum(mntfishproducts)*100/
	(select sum(mntfishproducts) from marketing), '%')) as Fish_percentage,
	(concat(sum(mntsweetproducts)*100/
	(select sum(mntsweetproducts) from marketing), '%')) as Sweet_percentage,
	(concat(sum(mntgoldprods)*100/
	(select sum(mntgoldprods) from marketing), '%')) as Gold_percentage
From
	marketing
Group by
	Marital_status

--EDUCATION BY PRODUCT PERCENTAGE
Select
	Education as Education_Level,
	(concat(sum(mntwines)*100/
	(select sum(mntwines) from marketing), '%')) as wines_percentageh,
	(concat(sum(mntfruits)*100/
	(select sum(mntfruits) from marketing), '%')) as fruits_parcentage,
	(concat(sum(mntmeatproducts)*100/
	(select sum(mntmeatproducts) from marketing),'%')) as Meat_percentage,
	(concat(sum(mntfishproducts)*100/
	(select sum(mntfishproducts) from marketing), '%')) as Fish_percentage,
	(concat(sum(mntsweetproducts)*100/
	(select sum(mntsweetproducts) from marketing), '%')) as Sweet_percentage,
	(concat(sum(mntgoldprods)*100/
	(select sum(mntgoldprods) from marketing), '%')) as Gold_percentage
From
	marketing
Group by
	Education

--PRODUCTS YEARLY
Select
	 dt_customer as Year,
	sum(mntwines) as Wine,
	sum(mntfruits) as Fruit,
	sum(mntmeatproducts) as Meat,
	sum(mntfishproducts) as Fish,
	sum(mntsweetproducts) as Sweet,
	sum(mntgoldprods) as Gold
From
	marketing
Group by
	dt_customer

--CUSTOMERS BY MARITAL STATUS
Select
	marital_status as marital_status,
	count(id) as No_Customers
From
	marketing
Group by
	Marital_Status

	--PRODUCTS
select
	sum(mntwines) as Wine,
	sum(mntfruits) as Fruit,
	sum(mntmeatproducts) as Meat,
	sum(mntfishproducts) as Fish,
	sum(mntsweetproducts) as Sweet,
	sum(mntgoldprods) as Gold
From
	marketing

-- PLACE OF PURCHASE
Select
	sum(numwebpurchases) as Web_Purchase,
	sum(numcatalogpurchases) as Catalog_Purchase,
	sum(numstorepurchases) as Store_Purchases
From
	marketing