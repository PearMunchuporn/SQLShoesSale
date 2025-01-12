---find the first top 3 most expensive products price.
with Most_Expensive_Products_Price as (
SELECT TOP (1000)
       b.[product_id]
	  ,b.[brand]
	 , i.[product_name]

	  ,dense_rank() over(order by [listing_price] desc ) as rank_expensive
      ,f.[listing_price]
      
  FROM [Shoes].[dbo].[finance] f
  join [Shoes].[dbo].[brands] b
  on f.[product_id] = b.[product_id] 
  join [Shoes].[dbo].[info] i
  on i.product_id = b.product_id)

  select product_name, brand ,listing_price,  rank_expensive 
  from  Most_Expensive_Products_Price
  where rank_expensive <4 

---find the first top 3 cheapest products price.
with Cheapest_Products_Price as (
SELECT TOP (1000)
       b.[product_id]
	  ,b.[brand]
	  ,i.[product_name]
	  ,dense_rank() over(order by [listing_price] ) as rank_cheap_price
      ,[listing_price]
      
  FROM [Shoes].[dbo].[finance] f
  join [Shoes].[dbo].[brands] b
  on f.[product_id] = b.[product_id] 
  join [Shoes].[dbo].[info] i
  on i.product_id = b.product_id)
  select [product_name], [brand], [listing_price],rank_cheap_price
  from  Cheapest_Products_Price
  where rank_cheap_price <4

---find the first top 3 best sales.
with Best_Products_TOP3 as (
SELECT TOP (1000)
	   b.[brand]
	  ,i.[product_name]

	  ,dense_rank() over(order by [revenue] desc ) as rank_revenue
      ,[revenue]
      
  FROM [Shoes].[dbo].[finance] f
  join [Shoes].[dbo].[brands] b
  on f.[product_id] = b.[product_id] 
  join [Shoes].[dbo].[info] i
  on i.product_id = b.product_id)
  select product_name, [brand] , [revenue], rank_revenue 
  from  Best_Products_TOP3
  where rank_revenue <4 


---find the first 3 lowest sale products.
with Lowest_Sale as (
SELECT TOP (1000)
      b.[product_id]
	  ,b.[brand]
	 , i.[product_name]
	 ,f.[revenue]
	 ,r.[reviews]
,dense_rank() over(order by [revenue]  ) as rank_lowest_sale
  
  FROM [Shoes].[dbo].[finance] f
  join [Shoes].[dbo].[reviews] r
  on f.product_id = r.product_id
  join [Shoes].[dbo].[info] i
  on i.product_id = f.product_id
  join [Shoes].[dbo].[brands] b
  on b.product_id = f.product_id)
  select [product_id] ,[brand] ,[product_name],revenue  ,rank_lowest_sale
  from Lowest_Sale
  where rank_lowest_sale<4 

---find  the product got min revenue with a discount.
---((Men's adidas Swim Eezay Maxout II Slippers got 8.98 sales with 50% discount ))

SELECT TOP (1000)
      b.[product_id]
	  ,b.[brand]
	 , i.[product_name]
	  ,([revenue])
	  ,([discount]) 
    
  FROM [Shoes].[dbo].[finance] f
  join [Shoes].[dbo].[reviews] r
  on f.product_id = r.product_id
  join [Shoes].[dbo].[info] i
  on i.product_id = f.product_id
  join [Shoes].[dbo].[brands] b
  on b.product_id = f.product_id
  where revenue  = (select min(revenue) from [Shoes].[dbo].[finance] where revenue!=0 and discount!=0 )


---find the product got minimum revenue without discount. 
---((Nike Tiempo Legend 8 Club IC got 56.65 sales without any discount ))
---((NikeCourt Royale AC got 56.65 sales without any discount ))
SELECT TOP (1000)
      b.[product_id]
	  ,b.[brand]
	 , i.[product_name]
	  ,([revenue])
	  ,([discount]) 
  
  FROM [Shoes].[dbo].[finance] f
  join [Shoes].[dbo].[reviews] r
  on f.product_id = r.product_id
  join [Shoes].[dbo].[info] i
  on i.product_id = f.product_id
  join [Shoes].[dbo].[brands] b
  on b.product_id = f.product_id
where revenue  = (select min(revenue) from [Shoes].[dbo].[finance] where revenue!=0 and discount=0 )


---find the product got max revenue without discount.
---((Men's adidas Running Ultraboost 19 Shoes got 22451.42 sales with 30% off!))

SELECT TOP (1000)
      b.[product_id]
	  ,b.[brand]
	 , i.[product_name]
	  ,([revenue])
	  ,([discount]) 
    
  FROM [Shoes].[dbo].[finance] f
  join [Shoes].[dbo].[reviews] r
  on f.product_id = r.product_id
  join [Shoes].[dbo].[info] i
  on i.product_id = f.product_id
  join [Shoes].[dbo].[brands] b
  on b.product_id = f.product_id
  where revenue  = (select max(revenue) from [Shoes].[dbo].[finance] where  discount!=0 )



---find the product got max revenue without discount.
---((Adidas Unisex Originals CRAIG GREEN KONTUUR II SHOES got 37150.45 sales with any discount!))
SELECT TOP (1000)
      b.[product_id]
	  ,b.[brand]
	 , i.[product_name]
	  ,([revenue])
	  ,([discount]) 
    
  FROM [Shoes].[dbo].[finance] f
  join [Shoes].[dbo].[reviews] r
  on f.product_id = r.product_id
  join [Shoes].[dbo].[info] i
  on i.product_id = f.product_id
  join [Shoes].[dbo].[brands] b
  on b.product_id = f.product_id
  where revenue  = (select max(revenue) from [Shoes].[dbo].[finance] where  discount=0 )

---find the product most expensive but got max revenue with discount.
---((Men's adidas Football Copa 19+ Firm Ground Cleats has an original price is 229.99 but got 19622.18 sales with 40% off!))
SELECT TOP (1)
      b.[product_id]
	  ,b.[brand]
	 , i.[product_name]
	  ,([revenue])
	  ,([discount]) 
	  ,f.sale_price
	  ,f.listing_price
	  ,dense_rank() over(order by [revenue] desc) as rank_sale
    
  FROM [Shoes].[dbo].[finance] f
  join [Shoes].[dbo].[reviews] r
  on f.product_id = r.product_id
  join [Shoes].[dbo].[info] i
  on i.product_id = f.product_id
  join [Shoes].[dbo].[brands] b
  on b.product_id = f.product_id
  where listing_price  = (select max(listing_price) from [Shoes].[dbo].[finance] where discount !=0 )


---find the product most expensive but got max revenue without discount.
---((Men's adidas Originals ZX 4000 4D Shoes has an original price is 299.99 and got 28619.05 sales. This is the best saller without discount.))
SELECT TOP (1)
      b.[product_id]
	  ,b.[brand]
	 , i.[product_name]
	  ,([revenue])
	  ,([discount]) 
	  ,f.sale_price
	  ,f.listing_price
	  ,dense_rank() over(order by [revenue] desc ) as rank_sale
    
  FROM [Shoes].[dbo].[finance] f
  join [Shoes].[dbo].[reviews] r
  on f.product_id = r.product_id
  join [Shoes].[dbo].[info] i
  on i.product_id = f.product_id
  join [Shoes].[dbo].[brands] b
  on b.product_id = f.product_id
  where listing_price  = (select max(listing_price) from [Shoes].[dbo].[finance] where discount =0 )


---What product is the most expensive but has minimum revenue with a discount?
---((Men's s adidas Football Nemeziz 18+ Firm Ground Boots has an orginal price is 299.99 and got 1448.87 sales with 50% off!))
SELECT TOP (1)
      b.[product_id]
	  ,b.[brand]
	 , i.[product_name]
	  ,([revenue])
	  ,([discount]) 
	  ,f.sale_price
	  ,f.listing_price
	  ,dense_rank() over(order by [revenue]) as rank_price
    
  FROM [Shoes].[dbo].[finance] f
  join [Shoes].[dbo].[reviews] r
  on f.product_id = r.product_id
  join [Shoes].[dbo].[info] i
  on i.product_id = f.product_id
  join [Shoes].[dbo].[brands] b
  on b.product_id = f.product_id
where listing_price  = (select max(listing_price) from [Shoes].[dbo].[finance] where  discount!=0 )


---What product is the most expensive but has minimum revenue without a discount?
---((Men's adidas Originals ZX 4000 4D Shoes ))
SELECT TOP (1)
      b.[product_id]
	  ,b.[brand]
	 , i.[product_name]
	  ,([revenue])
	  ,([discount]) 
	  ,f.sale_price
	  ,f.listing_price
	  ,dense_rank() over(order by [revenue]) as rank_price
    
  FROM [Shoes].[dbo].[finance] f
  join [Shoes].[dbo].[reviews] r
  on f.product_id = r.product_id
  join [Shoes].[dbo].[info] i
  on i.product_id = f.product_id
  join [Shoes].[dbo].[brands] b
  on b.product_id = f.product_id
where listing_price  = (select max(listing_price) from [Shoes].[dbo].[finance] where  discount!=0 )


---How many products got 0 revenue?

SELECT TOP (2000)
      count(f.[revenue]) as [number of product got 0 revenue]
 
  FROM [Shoes].[dbo].[finance] f
  join [Shoes].[dbo].[reviews] r
  on f.product_id = r.product_id
  join [Shoes].[dbo].[info] i
  on i.product_id = f.product_id
  join [Shoes].[dbo].[brands] b
  on b.product_id = f.product_id
  where revenue =0
  group by revenue
