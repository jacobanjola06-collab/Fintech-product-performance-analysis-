-- customer segments
-- purpose 
-- To evaluate how customer are distributed across behaviour segments and understand 
-- which segements contribute most to engagement and long term value
select customer_segment, 
       count(c.customer_id) as total_customer, 
       round(avg(customer_lifetime_value)) as avg_clv, 
round(avg(churn_probability),2) as avg_churn_probability,
sum(total_tx_volume) as total_revenue 
from customer c
 join customer_metrics m
 on c.customer_id = m.customer_id
group by customer_segment
order by total_revenue desc;
 
 -- frequency group
 -- purpose
 -- To measure customer engagement levels by analysing 
 -- transaction frequency and idenifying high activity versus low activity users.
select case when transaction_frequency  <= 0.04 then  "low frequency"
            when transaction_frequency  <= 0.10 then  "medium frequency"
            else "high frequency"
end as frequency_group,
count(*) as total_customer, 
round(avg(customer_lifetime_value)) as avg_clv, 
round(avg(churn_probability)* 100, 1) as avg_churn_pct,
round(avg(customer_tenure),2) as avg_tenure
from customer_metrics m  
join customer c 
on m.customer_id = c.customer_id
group by frequency_group
order by avg_clv desc;

-- product depth 
-- purpose
-- To assess product adoption depth an determine whether multi product 
-- customers demonstrate stronger loyalty and higher value.
with product_count as( select customer_id,
case when  savings_account = 'true'  then 1 else 0 end +
case when  credit_card = 'true'  then 1 else 0 end+
case when  personal_loan = 'true'  then 1 else 0 end+
case when  investment_account = 'true'  then 1 else 0 end +
case when  insurance_product = 'true'  then 1 else 0 end as total_products
from customer_products) 
select
  p.total_products,
count(*) as total_customer,
round(avg(customer_lifetime_value)) as avg_clv, 
round(avg(churn_probability)* 100, 1) as avg_churn_pct,
round(avg(customer_tenure),2) as avg_tenure
from product_count p
left join customer c
on p.customer_id = c.customer_id
group by p.total_products
order by p.total_products;


-- customer tenure 
-- purpose
-- To evaluate customer retention stability by examining 
-- how long customers remain active and how tenure impacts loyalty and value generation.
select case when customer_tenure  < 3 then  "0-3 years"
            when customer_tenure  < 6 then  "3-6 years"
            when customer_tenure  < 9 then  "6-9 years"
            else "9+ years"
end as tenure_group,
count(c.customer_id) as total_customer, 
round(avg(customer_lifetime_value)) as avg_clv, 
round(avg(churn_probability)* 100, 1) as avg_churn_pct,
round(avg(transaction_frequency),2) as avg_frequency
from customer c
join customer_metrics m
on c.customer_id = m.customer_id
group by tenure_group
order by avg_clv desc;

-- At risk active customer 
-- purpose 
-- To identify customer who show high engagement 
-- but have high probability of churning
select 
       count(*) as total_customer, 
       round(avg(customer_lifetime_value)) as avg_clv, 
       round(avg(churn_probability)* 100, 1) as avg_churn_pct,
round(avg(transaction_frequency),2) as avg_frequency
from customer c 
left join customer_metrics m 
on c.customer_id = m.customer_id
where transaction_frequency > 0.05
and churn_probability  > 0.4;