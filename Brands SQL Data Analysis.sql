
--Number of total products
--((Total product is 3,120))
  SELECT  
      COUNT([id]) as [number of total products]
     ,[brand]
  FROM [Shoes].[dbo].[brands]


--Average ratings by each brand
--((Adidas is 3.37 and Niky is 2.78))
SELECT 
       b.[brand] 
      ,ROUND(AVG(r.[rating]),2) as [Avg Rating]
  FROM [Shoes].[dbo].[reviews] r
  JOIN [Shoes].[dbo].[brands] b
  ON r.[product_id] = b.[product_id]
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = r.[product_id]
  GROUP BY b.brand

--Average revenue by each brand
--((Adidas is 4476.36 and Niky is 1085.27))
SELECT 
       b.[brand] 
      ,ROUND(AVG(f.[revenue]),2) as [Avg Revenue]
  FROM [Shoes].[dbo].[reviews] r
  JOIN [Shoes].[dbo].[brands] b
  ON r.[product_id] = b.[product_id]
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = r.[product_id]
  JOIN [Shoes].[dbo].[finance] f
  ON f.[product_id] = r.[product_id]
  GROUP BY b.brand
