---What are products ranked top 3 highest ratings?

WITH Highest_Rating as (
SELECT TOP (1000)
     b.[product_id]
    ,b.[brand]
    ,i.[product_name]
    ,r.[rating]
    ,DENSE_RANK() OVER (ORDER BY [rating] DESC ) as rank_rating   
  FROM [Shoes].[dbo].[finance] f
  JOIN [Shoes].[dbo].[reviews] r
  ON f.[product_id] = r.[product_id]
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = f.[product_id]
  JOIN [Shoes].[dbo].[brands] b
  ON b.[product_id] = f.[product_id]
)
  SELECT [product_id], [brand], [product_name], [rating], rank_rating
  FROM Highest_Rating
  WHERE rank_rating < 4

	
---What are products ranked top 3 lowest ratings?
	
WITH Lowest_Rating as (
SELECT TOP (1000)
      b.[product_id]
     ,b.[brand]
     ,i.[product_name]
     ,r.[rating]
     ,f.[revenue]
     ,r.[reviews]
     ,DENSE_RANK() OVER (ORDER BY [rating]) as rank_rating

  FROM [Shoes].[dbo].[finance] f
  JOIN [Shoes].[dbo].[reviews] r
  ON f.[product_id] = r.[product_id]
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = f.[product_id]
  JOIN [Shoes].[dbo].[brands] b
  ON b.[product_id] = f.[product_id]
)
  SELECT [product_id], [brand], [product_name], [rating], rank_rating, [reviews]
  FROM Lowest_Rating
  WHERE rank_rating < 4 and revenue <> 0
	
	
--Find products have sold but got 0 rating.
--How many products got 0 rating.
-- ((70 Adidas shoes got a 0 rating))
	
SELECT 
      b.[brand]
      ,COUNT(r.[product_id]) as [number of rated products]
      ,r.[rating]

  FROM [Shoes].[dbo].[reviews] r
  JOIN [Shoes].[dbo].[brands] b
  ON r.[product_id] = b.[product_id]
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = r.[product_id]
  JOIN [Shoes].[dbo].finance f
  ON f.[product_id] = r.[product_id]
  WHERE rating = 0 and revenue != 0  GROUP BY rating, brand 
	
	
--Find products have sold but got 0 rating.
--Categorize ratings of the products by criteria 5 is Excellent, less than 5 but more than or equal 4 is Good,  less than 4 but more than or equal 3 is Fair, less than 3 but more than or equal 2 is Poor,  less than 2 but more than or equal 1 is Bad, 0 rating is Worst.

SELECT 
      b.[brand] 
     ,i.[product_name]
     ,r.[rating]
	 ,CASE
	 WHEN rating = 5  then 'Excellent'
	 WHEN rating >= 4 then 'Good'
	 WHEN rating >= 3 then 'Fair'
	 WHEN rating >= 2 then 'Poor'
	 WHEN rating >= 1 then 'Bad'
	 ELSE  'Worse'
	 END rating_result

  FROM [Shoes].[dbo].[reviews] r
  JOIN [Shoes].[dbo].[brands] b
  ON r.[product_id] = b.[product_id]
  JOIN [Shoes].[dbo].[info] i
  ON i.[product_id] = r.[product_id]
  JOIN [Shoes].[dbo].[finance] f
  ON f.[product_id] = r.[product_id]
  WHERE revenue != 0


---Number of rated products by critiria
--- Excellent is 116
--- Good is 903
--- Fair is 802
--- Poor is 163
--- Worst is 70

 SELECT sub.rating_result ,COUNT(ID) as [number of rated products] ,sub.rating_ranked 
 FROM(
SELECT 
      r.[ID]
     ,r.[rating]
  ,CASE
	 WHEN rating = 5  THEN 'Excellent'
	 WHEN rating >= 4 THEN 'Good'
	 WHEN rating >= 3 THEN 'Fair'
         WHEN rating >= 2 THEN 'Poor'
	 WHEN rating >= 1 THEN 'Bad'
	 ELSE 'Worst'
	 END rating_result

  ,CASE
	 WHEN rating = 5  THEN 1
	 WHEN rating >= 4 THEN 2
	 WHEN rating >= 3 THEN 3
	 WHEN rating >= 2 THEN 4
	 WHEN rating >= 1 THEN 5
	 ELSE  6
	 END as rating_ranked
        ,COUNT(r.[id]) as [number_of_rated_products]

  FROM [Shoes].[dbo].[reviews] r
  JOIN [Shoes].[dbo].[brands] b
  ON r.product_id = b.product_id
  JOIN [Shoes].[dbo].[info] i
  ON i.product_id = r.product_id
  JOIN [Shoes].[dbo].[finance] f
  ON f.product_id = r.product_id

  WHERE revenue != 0
 
  GROUP BY [rating], r.[ID]

  )as sub
GROUP BY rating_result  ,rating_ranked
ORDER BY sub.rating_ranked

