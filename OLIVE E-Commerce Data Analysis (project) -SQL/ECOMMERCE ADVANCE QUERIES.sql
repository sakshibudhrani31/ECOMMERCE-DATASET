--month over month revenue growth
select * ,
case when mom_rev >0 then 'increasing' else 'decreasing' end as revenue_segmentation,
concat(round((mom_rev/nullif(previous_month_revenue,0))*100,2),'%') as percent_change 
from(

select 
format([order_purchase_timestamp],'yyyy-MM')  as months,
round(sum(price+freight_value),2) as present_revenue,
round(lag(sum(price+freight_value)) over( order by format([order_purchase_timestamp],'yyyy-MM') ),2) as previous_month_revenue,
round(sum(price+freight_value)-lag(sum(price+freight_value)) over( order by format([order_purchase_timestamp],'yyyy-MM') ),2) as mom_rev
from [dbo].[olist_orders_dataset] 
join [dbo].[olist_order_items_dataset] 
on [dbo].[olist_order_items_dataset].order_id=[dbo].[olist_orders_dataset].order_id
group by format([order_purchase_timestamp],'yyyy-MM')) as t




--top sellers by total revenue and number of orders
with cte as (
select seller_id,
sum(price+freight_value) as total_revenue ,
count(distinct oi.order_id) as total_orders
from [dbo].[olist_order_items_dataset] as oi
join [dbo].[olist_orders_dataset] as o
on oi.order_id=o.order_id
where o.order_status='delivered'
group by seller_id 
)

select top 10 seller_id
 from cte 
 order by total_revenue desc,total_orders desc


 --average review score by region and product category 
 select 
 t.column2  as product_category,
 avg(r.[review_score]) as avg_review_score,
 s.seller_state
 from [dbo].[olist_products_dataset] as p 
 join [dbo].[olist_order_items_dataset] as oi 
 on oi.product_id=p.product_id
 join [dbo].[olist_orders_dataset] as o
 on o.order_id=oi.order_id
 join [dbo].[olist_order_reviews_dataset] as r
 on r.order_id=o.order_id
 join [dbo].[olist_sellers_dataset] as s
 on s.seller_id=oi.seller_id
 join [dbo].[product_category_name_translation] as t
 on t.column1=p.product_category_name
 group by  t.column2 ,s.seller_state
 order by avg_review_score desc;

 --deleyed deliveries by state
 select 
 [customer_state] ,count(*),
 avg(datediff(day,[order_estimated_delivery_date],[order_delivered_customer_date]))  as avg_days_late 
 from [dbo].[olist_customers_dataset] as c
 join [dbo].[olist_orders_dataset] as o
 on o.customer_id=c.customer_id
 group by customer_state 
 order by avg_days_late ;

 --top 5 subcategories which shows highest average revenue per order and avg review received 
 with cte_Rev as (select 
 t.column2 as product_category,
 sum(price+freight_value) as revenue ,
 oi.order_id 
 from [dbo].[olist_products_dataset] as p
 join [dbo].[olist_order_items_dataset] as oi 
 on oi.product_id=p.product_id
 join [dbo].[product_category_name_translation] as t
 on t.column1=p.product_category_name
 join [dbo].[olist_orders_dataset] as o
 on o.order_id=oi.order_id
 where o.order_status='delivered'
 group by t.column2, oi.order_id ) ,
 
 cte_review as (
 select 
 t.column2 as category_name ,
 avg([review_score]  ) as avg_review
 from [dbo].[olist_order_reviews_dataset] as r 
 join [dbo].[olist_orders_dataset] as o
 on o.order_id=r.order_id
 join [dbo].[olist_order_items_dataset] as oi
 on oi.order_id=o.order_id
 join [dbo].[olist_products_dataset] as p
on p.product_id=oi.product_id
join [dbo].[product_category_name_translation] as t
on t.column1=p.product_category_name
where o.order_status='delivered'
group by t.column2)


 select top 5 
 cte_Rev.product_category,
 avg(cte_Rev.revenue) as avg_revenue ,
 cte_review.avg_review 
 from cte_Rev 
 join cte_review 
 on cte_review.category_name=cte_Rev.product_category
 group by product_category,cte_review.avg_review
 order by avg_revenue desc;
 




 






