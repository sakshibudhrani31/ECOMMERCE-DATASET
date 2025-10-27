--total revenue by month
select
FORMAT(o.order_purchase_timestamp,'MMMM') as month,
round(sum(oi.price+oi.freight_value),2)  as revenue
from [dbo].[olist_order_items_dataset] as oi
join [dbo].[olist_orders_dataset] as o
on  oi.order_id=o.order_id
where [order_status]='delivered'
group by FORMAT(o.order_purchase_timestamp,'MMMM') 
order by revenue desc;

--order delivery time by state 
select 
c.customer_state,
avg(datediff(day,o.order_purchase_timestamp,o.order_delivered_customer_date)) as days 
from [dbo].[olist_customers_dataset] as c 
join [dbo].[olist_orders_dataset] as o
on o.customer_id=c.customer_id
where [order_delivered_customer_date] is not null 
group by c.customer_state
order by days;

select  top 10
p.product_category_name,
sum(oi.price+oi.freight_value) as total_revenue,
english_name.column2 as translated_name 
from [dbo].[olist_products_dataset] as p
join [dbo].[olist_order_items_dataset] as oi
on p.product_id=oi.product_id
join [dbo].[product_category_name_translation] as english_name
on english_name.column1=p.product_category_name
group by product_category_name, english_name.column2
order by total_revenue desc

--avg order value per customer 
select cust_id,avg(average_spending) 
from(
select distinct
oi.order_id,
c.customer_id as cust_id ,
sum(oi.price+oi.freight_value) as average_spending 
from [dbo].[olist_orders_dataset] as o
join [dbo].[olist_customers_dataset] as c 
on c.customer_id=o.customer_id
join [dbo].[olist_order_items_dataset] as oi
on oi.order_id=o.order_id
group by c.customer_id,oi.order_id)
  as t 
  group by cust_id

--number of repeat customers
select count([customer_unique_id]) from (
select 
[customer_unique_id] ,
row_number()over(partition by customer_unique_id order by order_id) as rn 
from [dbo].[olist_customers_dataset]
join [dbo].[olist_orders_dataset] 
on [dbo].[olist_orders_dataset].customer_id=[dbo].[olist_customers_dataset].customer_id) t 
where rn >1



