--open table
select * from sale
 -------------------------------------------------------------
  ---number of branches 
  select distinct branch
  from sale
   --- type of customers
   select distinct customer_type
   from sale
   ---type of product_line
   select distinct product_line
   from sale
   ----number of branches
   select distinct branch
   from sale
   -- product_line sold of maximum cost
   select product_line,sum(total)
   from sale
   group by product_line
   order by sum(total) desc
   --maximum sale made by branch 
   select branch, sum(total)
   from sale 
   group by branch 
   order by sum(total)
   limit 3
   ---branch made maximum sale in ___ month
   select branch, sum(total),month
   from sale
   group by branch, month
   order by sum(total) desc
  
  
  --which. product_line is demanded more in which branch
   --which  branch  sold how much amount of product_line 
   select branch, product_line,count(product_line)
   from sale 
   group by branch, product_line
   order by product_line desc
   
   
   --which customer_type purchased most
   
  select  customer_type,count(*)
  from sale
  group by customer_type
  order by count(*) desc
  
  ---which product_line has maximum tax?
  select product_line, avg(tax)
  from sale
  group by product_line
  
 -- mode of payment used maximum?
select payment ,count(*)
from sale
group by payment
order by count(*) desc

-- total gross income by each store
select branch, sum(gross_income)
from sale
group by branch
order by branch desc


---avg quantity sold of each product_line
select avg(quality)
from sale

--- adding remark for product_line on basis of quantity

select product_line,
case when avg(quality) > 5 then 'good' else 'bad'
end as remark
from sale
group by product_line

-- branch whose total quantity is greater than average quantity

select branch
from sale
group by branch
having sum(quality) > (select avg(quality) from sale)

--- product line with maximum rating in which branch
select product_line,rating,branch
from sale 
group by product_line , rating,branch
order by rating desc


---which month sale is maximum
select month , sum(total),branch
from sale
group by month, branch
order by sum(total) desc

--which gender buys more

select gender, count(*)
from sale
group by gender
 
--number of female and male customer who are member and normal customer

select gender ,count(gender), customer_type
from sale
group by customer_type,gender


---payment mode based on gender

select gender, count(gender)as number_of_payment_made,payment
from sale
group by gender,payment
order by count(gender) desc

--- amount sold to customer_type
select customer_type,sum(total)
from sale
group by customer_type
--- highest avgerage rating of branch
select ROUND(avg(rating),2),branch
from sale 
group by branch
order by round(avg(rating),2) desc

--for overall review about sales data
SELECT branch,city,customer_type,gender,product_line,sum(total) as total_sale,sum(quality) as total_quantity_sold,round(avg(rating),2) as avg_rating,
sum(gross_income) as total_gross_income
from sale
group by branch,city,customer_type,gender,product_line
order by branch,city,customer_type,gender,product_line desc;


