--SQL Advance Case Study
use db_SQLCaseStudies

select top 1 * from DIM_CUSTOMER
select top 1 * from DIM_DATE
select top 1 * from DIM_LOCATION
select top 1 * from DIM_MANUFACTURER
select top 1 * from DIM_MODEL
select top 1 * from FACT_TRANSACTIONS

/* ============================================================
   QUESTION 1
   List all the states in which we have customers who have
   bought cellphones from 2005 till today.
   ============================================================ */

--BEGIN 
select distinct state from(
select t1.state, sum(quantity) as cnt, Year(t2.Date) as Year from DIM_LOCATION as t1
join FACT_TRANSACTIONS as t2
on t1.IDLocation = t2.IDLocation
where YEAR(t2.date) >=2005
group by t1.state , YEAR(t2.date)
) as A

--Q1--END

/* ============================================================
   QUESTION 2
   What state in the US is buying the most 'Samsung'
   cell phones?
   ============================================================ */

--BEGIN
	
	select top 1 state, count(*) as cnt from DIM_LOCATION as t1
	join FACT_TRANSACTIONS as t2
	on t1.IDLocation = t2.IDLocation
	join DIM_MODEL as t3
	on t2.IDModel = t3.IDModel
	join DIM_MANUFACTURER as t4
	on t3.IDManufacturer = t4.IDManufacturer
	where Country = 'US' and Manufacturer_Name = 'Samsung'
	group by state
	order by cnt desc

--Q2--END

/* ============================================================
   QUESTION 3
   Show the number of transactions for each model per
   zip code per state.
   ============================================================ */

--BEGIN      
	
	select idmodel,state,zipcode,count(*) as tot_trans
	from FACT_TRANSACTIONS as t1
	join DIM_LOCATION as t2
	on t1.IDLocation = t2.IDLocation
	group by IDModel, state,zipcode

--Q3--END

/* ============================================================
   QUESTION 4
   Show the cheapest cellphone.
   Output should contain the price also.
   ============================================================ */

--BEGIN

select top 1 model_name , min(unit_price) as min_price from DIM_MODEL
group by Model_Name
order by min_price asc

--Q4--END

/* ============================================================
   QUESTION 5
   Find the average price for each model in the top 5
   manufacturers in terms of sales quantity and order
   by average price.
   ============================================================ */

--BEGIN
--avg price for each model--
select t1.IDModel,AVG(totalprice) as avg_price,sum(quantity) as tot_qty from FACT_TRANSACTIONS as t1
join DIM_MODEL as t2
on t1.IDModel = t2.IDModel
join DIM_MANUFACTURER as t3
on t2.IDManufacturer = t3.IDManufacturer
where Manufacturer_Name in (select top 5 Manufacturer_Name from FACT_TRANSACTIONS as t1
                            join DIM_MODEL as t2
							on t1.IDModel = t2.IDModel
							join DIM_MANUFACTURER as t3
							on t2.IDManufacturer = t3.IDManufacturer
							group by Manufacturer_Name
							order by sum( totalprice) desc )
group by t1.IDModel
order by avg_price desc


--Q5--END

/* ============================================================
   QUESTION 6
   List the names of the customers and the average amount
   spent in 2009, where the average is higher than 500.
   ============================================================ */

--BEGIN

select top 6 customer_name,AVG(totalprice) as avg_price from DIM_CUSTOMER as t1
join FACT_TRANSACTIONS as t2
on t1.IDCustomer = t2.IDCustomer
where YEAR(date) = 2009
group by Customer_Name
having avg(totalprice) > 500

--Q6--END
	
/* ============================================================
   QUESTION 7
   Find out if there is any model that was in the top 5
   in terms of quantity simultaneously in 2008, 2009 and 2010.
   ============================================================ */


--BEGIN  
select * from (
select top 5 idmodel from FACT_TRANSACTIONS
where year(date) = 2008
group by IDModel, year(date)
order by sum(quantity) desc
) as A
INTERSECT
select * from (
select top 5 idmodel from FACT_TRANSACTIONS
where year(date) = 2009
group by IDModel, year(date)
order by sum(quantity) desc
) as C

--Q7--END	


/* ============================================================
   QUESTION 8
   Show the manufacturer with the 2nd top sales in 2009
   and the manufacturer with the 2nd top sales in 2010.
   ============================================================ */


--BEGIN

select * from (
select top 1 * from (
select top 2 Manufacturer_Name,year(date) as year , sum(totalprice) as sales from FACT_TRANSACTIONS as t1
join DIM_MODEL as t2
on t1.IDModel = t2.IDModel
join DIM_MANUFACTURER as t3
on t2.IDManufacturer = t3.IDManufacturer
where year(date) = 2009
group by Manufacturer_Name, year(date)
order by sales desc
) as A
order by sales asc
) as C
union
select * from (
select top 1 * from (
select top 2 Manufacturer_Name,year(date) as year , sum(totalprice) as sales from FACT_TRANSACTIONS as t1
join DIM_MODEL as t2
on t1.IDModel = t2.IDModel
join DIM_MANUFACTURER as t3
on t2.IDManufacturer = t3.IDManufacturer
where year(date) = 2010
group by Manufacturer_Name, year(date)
order by sales desc
) as A
order by sales asc
) as D

--Q8--END


/* ============================================================
   QUESTION 9
   Show the manufacturers that sold cellphones in 2010
   but did not in 2009.
   ============================================================ */

--BEGIN
	

select  Manufacturer_Name from FACT_TRANSACTIONS as t1
join DIM_MODEL as t2
on t1.IDModel = t2.IDModel
join DIM_MANUFACTURER as t3
on t2.IDManufacturer = t3.IDManufacturer
where year(date) = 2010
group by Manufacturer_Name
EXCEPT
select  Manufacturer_Name from FACT_TRANSACTIONS as t1
join DIM_MODEL as t2
on t1.IDModel = t2.IDModel
join DIM_MANUFACTURER as t3
on t2.IDManufacturer = t3.IDManufacturer
where year(date) = 2009
group by Manufacturer_Name

--Q9--END


/* ============================================================
   QUESTION 10
   Find top 100 customers and their average spend,
   average quantity by each year. Also find the percentage
   of change in their spend.
   ============================================================ */

--BEGIN
-- top 10 customers--

select * , ((avg_price - lag_price)/lag_price) as percentage_change from (
select * , lag(avg_price,1) over(partition by idcustomer order by year) as lag_price from (

select idcustomer, year(date) as year, avg(totalprice) as avg_price, sum(quantity) as qty from FACT_TRANSACTIONS
where IDCustomer in ( select top 10 idcustomer from FACT_TRANSACTIONS
                      group by IDCustomer
					  order by sum(totalprice) desc)
group by IDCustomer, year(date)
) as A
) as B

--Q10--END
	