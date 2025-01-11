# SQLShoesSale

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
To find the average rating scores of each brand by using aggregate function avg() and group by SQL to compare ratings between Niky and Adidas to inform brand producers should improve the quality of the product. 

<h3><b>reviews analysis</b></h3>
Analyzed what the product got the best or worst rating using window function rank() by top 3. That can help the production controller improve the quality of the product to meet clients' satisfication and get a better rating.

<h3><b>financial analysis</b></h3>
The financial analysis aims to analyze the revenue of the product to answer business questions what product has the best or worst revenue with a discount or without any discount. This analysis can help the marketing team decide on which product should go on sale.

