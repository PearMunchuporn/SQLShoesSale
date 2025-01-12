# SQL Shoes Sale

<h2><b> About Data </h2><b/>
SQL Project Analyzing Online Sports Revenue of popular brands Adidas and Niky 3,120 products by using dataset of https://app.datacamp.com/ <br>
The tables consist of info, brands, finance, and reviews.

<h3><b> info table </h3><b/>
Table info consists of id, product_id, product_name, and description. <br><br>



| column | description | data type |
|----------|----------|----------|
| id | Index number of each product | INT |
| product_name  | Name of product  | VARCHAR(MAX) |
| product_id | Unique identifier of each product | VARCHAR(50) |
| description | Description of product | VARCHAR(MAX) | <br>

<h3><b> brands table </h3><b/>
Table brands consist of id, product_id, and brand.<br><br>


| column | description | data type |
|----------|----------|----------|
| id | Index number of each product | INT |
| product_id  | Unique identifier of each product  | VARCHAR(50) |
| brand | Brand of product  | VARCHAR(50) | <br>


<h3><b> finance table </h3><b/>
Table finance consist of id, listing_price, sale_price, discount, and revenue.<br><br>


| column | description | data type |
|----------|----------|----------|
| id | Index number of each product | INT |
| listing_price  | Original price of the product  | DECIMAL(10,2) |
| sale_price | Discounted price of the product  | DECIMAL(10,2) | 
| discount  | Discount off the listing price, as a decimal  | DECIMAL(10,2) |
| revenue  | 	Revenue generated by each of product  | DECIMAL(10,2) |<br>

<h3><b> reviews table </h3><b/>
Table reviews consist of id, product_id, rating, and reviews.<br><br>

| column | description | data type |
|----------|----------|----------|
| id | Index number of each product | INT |
| product_id  | Unique identifier of each product  | VARCHAR(50) |
| rating  | Average product rating  | DECIMAL(10,2) |
| reviews | Number of reviews for the product  | INT | <br>


<h2><b> Analysis the Data </h2><b/>
  
<h3><b>brands analysis</b></h3>
To find the average rating scores and average revenue of each brand by using aggregate function avg() and group by SQL to compare ratings between Niky and Adidas to inform brand producers should improve the quality of the product. 

<h3><b>reviews analysis</b></h3>
Analyzed what the product got the best or worst rating using window function rank() by top 3. That can help the production controller improve the quality of the product to meet clients' satisfication and get a better rating.

<h3><b>financial analysis</b></h3>
The financial analysis aims to analyze the revenue of the product to answer business questions what product has the best or worst revenue with a discount or without any discount. This analysis can help the marketing team decide on which product should go on sale and find strategies for the enhancement of sales.


<h2><b> Business Question or Isssues for analytical data </h2><b/>

<h3><b>Brands analytical</b></h3>
• Number of total product <br>

<i>Total product is 3,120 </i><br>

• Average ratings by each brand <br>

<i>Adidas is 3.37 and Niky is 2.78 </i> <br>

• Average revenue by each brand <br>

<i>Adidas is 4476.36 and Niky is 1085.27 </i>

<hr>

<h3><b>Reviews analytical</b></h3>

• What are products ranked top 3 highest ratings? <br>

• What are products ranked top 3 lowest ratings? <br>

• How many products got a 0 rating? <br>
 <i>70 products of Adidas</i>

• Categorize ratings of the products by criteria 5 is Excellent, less than 5 but more than or equal 4 is Good,  <br>
less than 4 but more than or equal 3 is Fair, less than 3 but more than or equal 2 is Poor,  <br>
less than 2 but more than or equal 1 is Bad, 0 rating is Worst. <br>

• Total number of rated products by criteria? 

 <i> Excellent is 116 </i> <br>
 <i> Good is 903 </i> <br>
 <i> Fair is 802 </i> <br>
 <i> Poor is 163 </i> <br>
 <i>  Worst is 70 </i> <br>

<hr>
<h3><b>Finance analytical</b></h3>

• What are products ranked top 3 most expensive? <br>

• What are products ranked top 3 cheapest? <br>

• What are products ranked top 3 best sellers? <br>

• What are the products' lowest sales? <br>

• What product got minimum revenue with a discount? <br>

<i>Men's adidas Swim Eezay Maxout II Slippers got 8.98 sales with 50% discount.</i><br><br>

• What product got minimum revenue without a discount? <br>

<i>Nike Tiempo Legend 8 Club IC got 56.65 sales.</i><br>
<i>Nike Court Royale AC got 56.65 sales</i><br><br>

• What product got the best sales with a discount? <br>

<i>Men's adidas Running Ultraboost 19 Shoes got 22451.42 sales with 30% off!</i><br><br>

• What product got the best sales without a discount?<br>

<i>Adidas Unisex Originals CRAIG GREEN KONTUUR II SHOES got 37150.45 sales.</i><br><br>

• What product is the most expensive but best seller with a discount? <br>

<i>Men's adidas Football Copa 19+ Firm Ground Cleats has an original price 229.99 but got 19622.18 sales with 40% off!<br></i><br>

• What product is the most expensive but best seller without a discount? <br>

<i>Men's adidas Originals ZX 4000 4D Shoes has an original price is 299.99 and got 28619.05 sales. This is the best saller without discount!</i><br><br>

What product is the most expensive but has minimum revenue with a discount? <br>

<i>Men's s adidas Football Nemeziz 18+ Firm Ground Boots has an orginal price is 299.99 and got 1448.87 sales with 50% off!</i><br><br>

• What product is the cheapest but has minimum revenue with a discount? <br>

<i>Men's adidas Swimming Beach Print Maxout Slippers has original price is 8.99 with discount 50% and got 290.95 sales.</i><br><br>

• How many products got 0 revenue? <br>

<i>There are 76 products have not sold yet.</i><br>

