
--Number of total products
--((Total product is 3,120))
SELECT  
      count([id]) as [number of total products]
    --  ,[brand]
  FROM [Shoes].[dbo].[brands]


--Average ratings by each brand
--((Adidas is 3.37 and Niky is 2.78))
SELECT 
 
       b.[brand] 
      ,round(avg(r.[rating]),2) as [Avg Rating]
  FROM [Shoes].[dbo].[reviews] r
  join [Shoes].[dbo].[brands] b
  on r.product_id = b.product_id
  join [Shoes].[dbo].[info] i
  on i.product_id = r.product_id
  group by b.brand

--Average revenue by each brand
--((Adidas is 4476.36 and Niky is 1085.27))
SELECT 
 
       b.[brand] 
      ,round(avg(f.[revenue]),2) as [Avg Revenue]
  FROM [Shoes].[dbo].[reviews] r
  join [Shoes].[dbo].[brands] b
  on r.product_id = b.product_id
  join [Shoes].[dbo].[info] i
  on i.product_id = r.product_id
  join [Shoes].[dbo].[finance] f
  on f.product_id = r.product_id
  group by b.brand