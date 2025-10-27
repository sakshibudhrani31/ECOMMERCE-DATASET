# OLIST E-Commerce Data Analysis-SQL

##👗Dress Attributes: This project provides a comprehensive SQL-based analysis of the Olist E-commerce dataset to uncover key insights about - customer behavior, order trends, revenue growth, and product performance and many more.  
This project explores and analyzes the Olist E-commerce dataset, a comprehensive dataset from a Brazilian marketplace that connects small businesses with customers nationwide.
Using SQL Server, I performed data cleaning, transformation, and business analysis to uncover trends related to sales performance, customer behavior, product categories, delivery efficiency, and customer satisfaction.

##Tools and Technologies used:
MICROSOFT SQL SERVER

##📂Description 
This is a Brazilian ecommerce public dataset of orders made at Olist Store. The dataset has information of 100k orders from 2016 to 2018 made at multiple marketplaces in Brazil.
there are multiple files in this dataset which includes:
-olist_customers_dataset
-olist_orders_dataset
-olist_order_items_dataset
-olist_products_dataset
-olist_order_reviews_dataset
-olist_sellers_dataset
-product_category_name_translation

##🧮 Key SQL Techniques Used
-Aggregate Functions: SUM(), AVG(), COUNT(), ROUND()
-Window Functions: LAG(), ROW_NUMBER() for trend and repeat customer analysis
-CTEs (Common Table Expressions): Used for intermediate aggregations and comparisons
-CASE WHEN Logic: For conditional segmentation (e.g., increasing/decreasing revenue)
-JOINS: Combined multiple tables to get unified business insights
-Date Functions: FORMAT(), DATEDIFF() for time and performance analysis

##📊 Analytical Queries 
   1.Total Customer Count
     -Calculated total number of unique customers to measure market reach.
   2.Monthly Order Trends
     -Analyzed monthly order counts to understand seasonal shopping behavior.
     -Identified peak months with high order volume, useful for planning marketing campaigns and stock management.
   3.Unique Product Categories
     -Extracted all distinct product categories to understand catalog diversity.
     -Provided an overview of product variety and category range.
   4.Order Status Distribution
     -Compared delivered vs canceled orders to evaluate service reliability.
     -High cancellation rates may signal fulfillment or logistics challenges.
   5.Top 5 Customer States
     -Found states with the highest number of customers.
     -These states can be prioritized for regional promotions.
    6.Month-over-Month Revenue Growth
     -Tracked revenue growth by month using LAG() for previous month comparison.
     -Identified increasing and decreasing revenue months and calculated percentage change for growth trend monitoring.
     7.Top Sellers by Revenue & Orders
      -Ranked sellers by total revenue and order volume.
      -Highlighted top-performing sellers who contribute the most to overall sales.
     8.Average Review Score by Region and Product Category
      -Measured customer satisfaction across states and product categories.
      -Helped pinpoint regions and categories with high or low review ratings for quality improvement focus.
     9.Delayed Deliveries by State
      -Calculated average delivery delays using DATEDIFF().
      -Revealed states with higher average delays, suggesting logistical inefficiencies.
     10.Top 5 Categories by Avg Revenue & Review
      -Combined revenue and review analysis using CTEs to identify categories that perform well financially and in customer satisfaction.
      -Supported product management in focusing on high-margin and high-rated categories.

##Observations:
-The highest order volumes occurred in August, May, and July, indicating these months as sales peak periods while September and October recorded the lowest order    counts, suggesting a seasonal slowdown.
-Out of all transactions, over 99% of orders were successfully delivered, and only about 0.6% were cancelled. This indicates a high operational efficiency and      reliable fulfillment process.
-São Paulo (SP) has the largest customer base, showing it as the main market hub for the business while Rio de Janeiro (RJ) and Minas Gerais (MG) follow as strong secondary markets.
-The highest revenues were observed in May, August, and July, showing strong mid-year performance while September and October had the lowest revenues, indicating slower months for sales.
-Health & Beauty leads as the top-performing category, indicating strong consumer interest in personal care and wellness products.
 Watches & Gifts ranks second, suggesting a consistent demand for fashion and gifting items, possibly influenced by seasonal or special occasions.
-There were total 3345 repeated customers which shows the loyalty of customers and reflects their satisfaction.
-From 2016 to 2018, the company’s sales grew well, especially in 2017, with steady increases from May to November. The biggest growth was in November 2017, likely because of festive or seasonal offers.After December, sales went down, showing a slow period after the holidays. In 2018, sales started strong but became unstable later, with the largest drop in September.Overall, sales usually rise in the middle of the year, drop at the end, and recover early next year. This pattern can help the company plan its stock and promotions better.
-Top 5 best products by revenue are computers,small_appliances_home_oven_and_coffee,home_appliances_2,agro_industry_and_commerce,musical_instruments with an average review of 4.
-The average delivery delay ranges from 8 to 20 days across states. Acre (AC) and Rondônia (RO) show the highest delays (around 20 days) — likely due to longer shipping distances or limited logistics infrastructure.

##🏁Conclusion
This SQL project provided valuable insights into customer behavior, sales performance, and operational efficiency using the Olist e-commerce dataset.  
By analyzing key metrics such as revenue trends, customer distribution, delivery delays, and product performance, we can make data-driven recommendations to improve logistics, marketing, and customer experience.

##About Me:
👤 Sakshi Budharani 
📧 sakshibudhrani31@gmail.com 
🔗 https://www.linkedin.com/in/sakshi-budhrani-015010359/  


