---Find the first top 3 most expensive products price.

WITH Most_Expensive_Products_Price as (
SELECT TOP (1000)
       b.[product_id]
      ,b.[brand]
      ,i.[product_name]
      ,DENSE_RANK() OVER(ORDER BY [listing_price] DESC ) as rank_expensive
      ,f.[listing_price]
      
  FROM [Shoes].[dbo].[finance] f
  JOIN [Shoes].[dbo].[brands] b
  ON f.[product_id] = b.[product_id] 
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = b.[product_id]
)

  SELECT product_name, brand, listing_price, rank_expensive 
  FROM  Most_Expensive_Products_Price
  WHERE rank_expensive < 4 


---Find the first top 3 cheapest products price.
	
WITH Cheapest_Products_Price as (
SELECT TOP (1000)
           b.[product_id]
	  ,b.[brand]
	  ,i.[product_name]
	  ,DENSE_RANK() OVER(ORDER BY [listing_price] ) as rank_cheap_price
          ,[listing_price]
      
  FROM [Shoes].[dbo].[finance] f
  JOIN [Shoes].[dbo].[brands] b
  ON f.[product_id] = b.[product_id] 
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = b.[product_id]
)
  SELECT [product_name], [brand], [listing_price], rank_cheap_price
  FROM  Cheapest_Products_Price
  WHERE rank_cheap_price < 4
	

---Find the first top 3 best sales.
	
WITH Best_Products_TOP3 as (
SELECT TOP (1000)
	   b.[brand]
	  ,i.[product_name]
	  ,DENSE_RANK() OVER(ORDER BY [revenue] DESC ) as rank_revenue
          ,[revenue]
      
  FROM [Shoes].[dbo].[finance] f
  JOIN [Shoes].[dbo].[brands] b
  ON f.[product_id] = b.[product_id] 
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = b.[product_id]
)
  SELECT product_name, [brand], [revenue], rank_revenue 
  FROM  Best_Products_TOP3
  WHERE rank_revenue < 4 

	
---Find the first 3 lowest sale products.
	
WITH Lowest_Sale as (
SELECT TOP (1000)
          b.[product_id]
         ,b.[brand]
	 ,i.[product_name]
	 ,f.[revenue]
	 ,r.[reviews]
         ,DENSE_RANK() OVER(ORDER BY [revenue]  ) as rank_lowest_sale
  
  FROM [Shoes].[dbo].[finance] f
  JOIN [Shoes].[dbo].[reviews] r
  ON f.[product_id] = r.[product_id]
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = f.[product_id]
  JOIN [Shoes].[dbo].[brands] b
  ON b.[product_id] = f.[product_id]
)
  SELECT [product_id], [brand], [product_name], [revenue], rank_lowest_sale
  FROM Lowest_Sale
  WHERE rank_lowest_sale < 4 

	
---Find  the product got min revenue with a discount.
---((Men's adidas Swim Eezay Maxout II Slippers got 8.98 sales with 50% discount ))

SELECT TOP (1000)
           b.[product_id]
	  ,b.[brand]
	  ,i.[product_name]
	  ,([revenue])
	  ,([discount]) 
    
  FROM [Shoes].[dbo].[finance] f
  JOIN [Shoes].[dbo].[reviews] r
  ON f.[product_id] = r.[product_id]
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = f.[product_id]
  JOIN [Shoes].[dbo].[brands] b
  ON b.[product_id] = f.[product_id]
  WHERE revenue  = (SELECT MIN(revenue) FROM [Shoes].[dbo].[finance] WHERE revenue != 0 and discount != 0 )


---Find the product got minimum revenue without discount. 
---((Nike Tiempo Legend 8 Club IC got 56.65 sales without any discount ))
---((NikeCourt Royale AC got 56.65 sales without any discount ))
	
SELECT TOP (1000)
      b.[product_id]
     ,b.[brand]
     ,i.[product_name]
     ,([revenue])
     ,([discount]) 
  
  FROM [Shoes].[dbo].[finance] f
  JOIN [Shoes].[dbo].[reviews] r
  ON f.[product_id] = r.[product_id]
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = f.[product_id]
  JOIN [Shoes].[dbo].[brands] b
  ON b.[product_id] = f.[product_id]
WHERE revenue  = (SELECT MIN(revenue) FROM [Shoes].[dbo].[finance] WHERE revenue != 0 and discount = 0 )


---Find the product got max revenue without discount.
---((Men's adidas Running Ultraboost 19 Shoes got 22451.42 sales with 30% off!))

SELECT TOP (1000)
           b.[product_id]
	  ,b.[brand]
	  ,i.[product_name]
	  ,([revenue])
	  ,([discount]) 
    
  FROM [Shoes].[dbo].[finance] f
  JOIN [Shoes].[dbo].[reviews] r
  ON f.[product_id] = r.[product_id]
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = f.[product_id]
  JOIN [Shoes].[dbo].[brands] b
  ON b.[product_id] = f.[product_id]
  WHERE revenue  = (SELECT MAX(revenue) FROM [Shoes].[dbo].[finance] WHERE discount != 0 )


---Find the product got max revenue without discount.
---((Adidas Unisex Originals CRAIG GREEN KONTUUR II SHOES got 37150.45 sales with any discount!))
	
SELECT TOP (1000)
           b.[product_id]
	  ,b.[brand]
	  ,i.[product_name]
	  ,([revenue])
	  ,([discount]) 
    
  FROM [Shoes].[dbo].[finance] f
  JOIN [Shoes].[dbo].[reviews] r
  ON f.[product_id] = r.[product_id]
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = f.[product_id]
  JOIN [Shoes].[dbo].[brands] b
  ON b.[product_id] = f.[product_id]
  WHERE revenue  = (SELECT MAX(revenue) FROM [Shoes].[dbo].[finance] WHERE discount = 0 )

	
---Find the product most expensive but got max revenue with discount.
---((Men's adidas Football Copa 19+ Firm Ground Cleats has an original price is 229.99 but got 19622.18 sales with 40% off!))
	
SELECT TOP (1)
           b.[product_id]
	  ,b.[brand]
	  ,i.[product_name]
	  ,([revenue])
	  ,([discount]) 
	  ,f.[sale_price]
	  ,f.[listing_price]
	  ,DENSE_RANK() OVER(ORDER BY [revenue] DESC) as rank_sale
    
  FROM [Shoes].[dbo].[finance] f
  JOIN [Shoes].[dbo].[reviews] r
  ON f.[product_id] = r.[product_id]
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = f.[product_id]
  JOIN [Shoes].[dbo].[brands] b
  ON b.[product_id] = f.[product_id]
  WHERE listing_price  = (SELECT MAX(listing_price) FROM [Shoes].[dbo].[finance] WHERE discount != 0 )


---Find the product most expensive but got max revenue without discount.
---((Men's adidas Originals ZX 4000 4D Shoes has an original price is 299.99 and got 28619.05 sales. This is the best saller without discount.))

SELECT TOP (1)
           b.[product_id]
	  ,b.[brand]
	  ,i.[product_name]
	  ,([revenue])
	  ,([discount]) 
	  ,f.sale_price
	  ,f.listing_price
	  ,DENSE_RANK() OVER(ORDER BY [revenue] DESC ) as rank_sale
    
  FROM [Shoes].[dbo].[finance] f
  JOIN [Shoes].[dbo].[reviews] r
  ON f.[product_id] = r.[product_id]
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = f.[product_id]
  JOIN [Shoes].[dbo].[brands] b
  ON b.[product_id] = f.[product_id]
  WHERE listing_price  = (SELECT MAX(listing_price) FROM [Shoes].[dbo].[finance] WHERE discount = 0 )



---What product is the most expensive but has minimum revenue with a discount?
---((Men's s adidas Football Nemeziz 18+ Firm Ground Boots has an orginal price is 299.99 and got 1448.87 sales with 50% off!))
	
SELECT TOP (1)
           b.[product_id]
	  ,b.[brand]
	  ,i.[product_name]
	  ,([revenue])
	  ,([discount]) 
	  ,f.[sale_price]
	  ,f.[listing_price]
	  ,DENSE_RANK() OVER(ORDER BY [revenue]) as rank_price
    
  FROM [Shoes].[dbo].[finance] f
  JOIN [Shoes].[dbo].[reviews] r
  ON f.[product_id] = r.[product_id]
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = f.[product_id]
  JOIN [Shoes].[dbo].[brands] b
  ON b.[product_id] = f.[product_id]
WHERE listing_price  = (SELECT MAX(listing_price) FROM [Shoes].[dbo].[finance] WHERE discount != 0 )

	
---What product is the cheapest but has minimum revenue with a discount?
---((Men's adidas Swimming Beach Print Maxout Slippers has original price is 8.99 with discount 50% and got 290.95 sales. ))

SELECT TOP (1)
           b.[product_id]
	  ,b.[brand]
	  ,i.[product_name]
	  ,([revenue])
	  ,([discount]) 
	  ,f.[sale_price]
	  ,f.[listing_price]
	  ,DENSE_RANK() OVER(ORDER BY [revenue]) as rank_price
    
  FROM [Shoes].[dbo].[finance] f
  JOIN [Shoes].[dbo].[reviews] r
  ON f.[product_id] = r.[product_id]
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = f.[product_id]
  JOIN [Shoes].[dbo].[brands] b
  ON b.[product_id] = f.[product_id]
WHERE listing_price  = (SELECT MIN(listing_price) FROM [Shoes].[dbo].[finance] WHERE discount != 0 )


	
---How many products got 0 revenue?
---((There are 76 products have not sold yet. ))
SELECT TOP (2000)
      COUNT(f.[revenue]) as [number of product got 0 revenue]
 
  FROM [Shoes].[dbo].[finance] f
  JOIN [Shoes].[dbo].[reviews] r
  ON f.[product_id] = r.[product_id]
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = f.[product_id]
  JOIN [Shoes].[dbo].[brands] b
  ON b.[product_id] = f.[product_id]
  WHERE revenue = 0
  GROUP BY revenue

