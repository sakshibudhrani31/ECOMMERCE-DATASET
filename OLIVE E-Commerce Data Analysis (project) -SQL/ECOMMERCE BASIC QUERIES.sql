 --total customer count 
 select count(distinct customer_id) as [Total Customer Count]
 from [dbo].[olist_customers_dataset] ;

 --count of orders every month
 select 
 count(order_id) as total_orders,
 format(order_purchase_timestamp,'MMMM') as months
 from [dbo].[olist_orders_dataset]
 group by format(order_purchase_timestamp,'MMMM')
 order by total_orders desc;

 --unique product categories
 select 
distinct product_category_name 
from [dbo].[olist_products_dataset];

--Making data consistent by fixing empty columns 
update [dbo].[olist_products_dataset]
set product_category_name='NULL'
where ltrim(rtrim(product_category_name))=''

update [dbo].[olist_products_dataset]
set product_category_name='Unknown'
where product_category_name ='NULL'


--count of delivered vs cancelled orders 
select 
sum(case when [order_status]='delivered' then 1 else 0 end ) as delivered,
sum(case when [order_status]='canceled' then 1 else 0 end ) as cancelled
from [dbo].[olist_orders_dataset]

--top 5 states by customer counts
select top 5
count([customer_id]) customer_counts ,
[customer_state]
from [dbo].[olist_customers_dataset] 
group by [customer_state]
order by count([customer_id]) desc;









