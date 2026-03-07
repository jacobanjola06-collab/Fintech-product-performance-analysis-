-- product adoption
--  Measure the percentage of customer who own each product to identify 
-- core and underpenetrated products.
create view adoption_percentage as 
with product_flags as (
select customer_id, "saving_account" as product, savings_account as owned
from customer_products
union all
select customer_id, "credit_card" as product, credit_card
from customer_products
union all
select customer_id, "personal_loan" as product, personal_loan
from customer_products
union all
select customer_id, "investment_account" as product, investment_account
from customer_products
union all
select customer_id, "insurance_product" as product, insurance_product
from customer_products)
select product, count(case when owned = "true" then 1 end) * 100 / count(*) as adoption_percentage
from product_flags
group by product 
order by adoption_percentage desc;

-- product level engagement
-- purpose
-- Evaluate how actively customers use each products 
-- by measuring average transaction per product use
create view product_engagement as 
with product_flags as (
select customer_id, "saving_account" as product, savings_account as owned
from customer_products
union all
select customer_id, "credit_card" as product, credit_card
from customer_products
union all
select customer_id, "personal_loan" as product, personal_loan
from customer_products
union all
select customer_id, "investment_account" as product, investment_account
from customer_products
union all
select customer_id, "insurance_product" as product, insurance_product
from customer_products)
select p.product,
      count(*) * 1.0
      /count(distinct p.customer_id)
      as avg_transactions_per_user
from product_flags p
left join transactions t
on p.customer_id = t.customer_id
where p.owned = "true" 
group by  p.product
order by avg_transactions_per_user desc;


-- product & churn 
-- purpose
-- determine which products are associated with 
-- lower churn  probability to identify retention and driving products 
with customer_risk as ( select customer_id , max(churn_probability) as churn_probability
from customer
group by customer_id),
product_flag as
(select customer_id, "saving_account" as product, savings_account as owned
from customer_products
union all
select customer_id, "credit_card" as product, credit_card
from customer_products
union all
select customer_id, "personal_loan" as product, personal_loan
from customer_products
union all
select customer_id, "investment_account" as product, investment_account
from customer_products
union all
select customer_id, "insurance_product" as product, insurance_product
from customer_products)
select 
p.product,
avg(c.churn_probability) as avg_churn_probability
from product_flag p
join customer_risk c 
on p.customer_id = c.customer_id
where p.owned = "true"
group by p.product
order by avg_churn_probability;

-- product depth
-- purpose 
-- assess whether customer with multiple products 
-- show higher engagements, validating cross_sell strategy. 
with product_count as( select customer_id,
case when  savings_account = "true"  then 1 else 0 end +
case when  credit_card = "true"  then 1 else 0 end+
case when  personal_loan = "true"  then 1 else 0 end+
case when  investment_account = "true"  then 1 else 0 end +
case when  insurance_product = "true"  then 1 else 0 end as total_products
from customer_products) 
select
  p.total_products,
  count(*) * 1.0
      /count(distinct t.customer_id) as avg_transactions
from product_count p
 join transactions t 
on p.customer_id = t.customer_id
group by p.total_products
order by p.total_products;
