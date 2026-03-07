-- Revenue growth analysis 
-- purpose
-- Identify the key drivers of revenue and longterm profitabilty 

-- calculate total revenue and avg customer lifetime value
select count(distinct c.customer_id) total_customer, 
	   round(avg(customer_lifetime_value),2) as avg_CLV,
       sum(amount) as total_revenue
from customer c 
join transactions t
on c.customer_id = t.customer_id; 

-- Monthly revenue trend
-- purpose
-- To evaluate whether revenue is consistently growing or volatile overtime. 
select month(date) as months,
       sum(amount) as total_revenue
from transactions
group by month(date)
order by total_revenue desc ;

-- month over month percentage revenue growth 
-- purpose
-- to measure revenue mometum and detect  acceleration or slowdown
with monthly_revenue as
(select  month(date) months, 
		 sum(amount) as  monthly_revenue 
from transactions
group by month(date))
 select months,
        monthly_revenue,
        lag(monthly_revenue) over(order by months) as previous_month_revenue,
       round((( monthly_revenue - lag(monthly_revenue) over(order by months)) /
		nullif(lag(monthly_revenue) over(order by months), 0))* 100) as mom_growth_percentage 
from monthly_revenue
group by months
;

-- revenue concentration
-- purpose
-- To assess dependency on high value customers

-- top 10% revenue contribution 
with customer_revenue as (
select
     customer_id,
     sum(amount) as revenue
from transactions
group by customer_id),
ranked as ( select*,
          ntile(10) over (order by revenue desc) as decile
from customer_revenue)
select
    sum(case when  decile = 1 then revenue end)/  sum(revenue) * 100
as top_10_percent_revenue_share
from ranked;


-- which customer segments drives the most revenue 
-- Revenue and clv by customer segments 
select customer_segment, 
       count(distinct c.customer_id) as total_customer,
       sum(amount) as total_revenue, 
       round(avg(customer_lifetime_value),2) as avg_clv
from customer c 
join transactions t 
on  c.customer_id = m.customer_id
group by customer_segment
order by  total_revenue desc;

-- Which  acquisition channel bring high value customer
select acquisition_channel, 
       count(distinct c.customer_id) as total_customer,
       sum(amount) as total_revenue, 
       round(avg(customer_lifetime_value),2) as clv
from customer c 
join transactions t  
on  c.customer_id = t.customer_id
group by acquisition_channel
order by  total_revenue desc;

-- Revenue and clv by customer location 
select location, 
       sum(amount) as total_revenue, 
       round(avg(customer_lifetime_value),2) as clv
from customer c 
join transactions t
on  c.customer_id = t.customer_id
group by location
order by  total_revenue desc;

-- does product diversification increase revenue
select active_products, 
       count(distinct p.customer_id) total_customer,
       round(avg(customer_lifetime_value)) as avg_clv,
       sum(amount) total_revenue
from customer_products p 
join customer c
on p.customer_id = c.customer_id
join transactions t
on p.customer_id = t.customer_id
group by active_products
order by total_revenue desc;


