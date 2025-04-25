---What are products ranked top 3 highest ratings?

with Highest_Rating as (
SELECT TOP (1000)
      b.[product_id]
	  ,b.[brand]
	 , i.[product_name]
	 ,r.[rating]
     ,dense_rank() over(order by [rating] desc ) as rank_rating   
  FROM [Shoes].[dbo].[finance] f
  join [Shoes].[dbo].[reviews] r
  on f.product_id = r.product_id
  join [Shoes].[dbo].[info] i
  on i.product_id = f.product_id
  join [Shoes].[dbo].[brands] b
  on b.product_id = f.product_id)
  select [product_id] ,[brand] ,[product_name],[rating],rank_rating
  from Highest_Rating
  where rank_rating<4


---What are products ranked top 3 lowest ratings?
with Lowest_Rating as (
SELECT TOP (1000)
      b.[product_id]
	  ,b.[brand]
	 , i.[product_name]
	 ,r.[rating]
	 ,f.[revenue]
	, r.[reviews]
	,dense_rank() over(order by [rating]  ) as rank_rating

  FROM [Shoes].[dbo].[finance] f
  join [Shoes].[dbo].[reviews] r
  on f.product_id = r.product_id
  join [Shoes].[dbo].[info] i
  on i.product_id = f.product_id
  join [Shoes].[dbo].[brands] b
  on b.product_id = f.product_id)

  select [product_id] ,[brand] ,[product_name],[rating],rank_rating  ,reviews
  from Lowest_Rating
  where rank_rating<4 and revenue <> 0 
	
--Find products have sold but got 0 rating.
--How many products got 0 rating.
-- ((70 Adidas shoes got a 0 rating))
SELECT 
      b.[brand]
      ,count(r.[product_id]) as [number of rated products]
      ,r.[rating]

  FROM [Shoes].[dbo].[reviews] r
  join [Shoes].[dbo].[brands] b
  on r.product_id = b.product_id
  join [Shoes].[dbo].[info] i
  on i.product_id = r.product_id
  join [Shoes].[dbo].finance f
  on f.product_id = r.product_id
  where rating =0 and revenue!=0  group by rating,brand 
	
--Find products have sold but got 0 rating.
--Categorize ratings of the products by criteria 5 is Excellent, less than 5 but more than or equal 4 is Good,  less than 4 but more than or equal 3 is Fair, less than 3 but more than or equal 2 is Poor,  less than 2 but more than or equal 1 is Bad, 0 rating is Worst.
SELECT 
     
      b.[brand] 
	 ,i.[product_name]
     ,r.[rating]
	 ,case
	 when rating = 5  then 'Excellent'
	 when rating >=4 then 'Good'
	 when rating >= 3 then 'Fair'
	 when rating >= 2 then 'Poor'
	 when  rating >= 1 then 'Bad'
	 else  'Worse'
	 end rating_result

  FROM [Shoes].[dbo].[reviews] r
  join [Shoes].[dbo].[brands] b
  on r.product_id = b.product_id
  join [Shoes].[dbo].[info] i
  on i.product_id = r.product_id
  join [Shoes].[dbo].[finance] f
  on f.product_id = r.product_id
  where revenue !=0


---Number of rated products by critiria
--- Excellent is 116
--- Good is 903
--- Fair is 802
--- Poor is 163
--- Worst is 70

SELECT sub.rating_result ,count(ID) as [number of rated products] ,sub.rating_ranked 
 FROM(
SELECT 
      r.[ID]
     ,r.[rating]
	 ,case
	 when rating = 5  then 'Excellent'
	 when rating >=4 then 'Good'
	 when rating >= 3 then 'Fair'
	 when rating >= 2 then 'Poor'
	 when  rating >= 1 then 'Bad'
	 else  'Worst'
	 end rating_result
	 ,case
	 when rating = 5  then 1
	 when rating >=4 then 2
	 when rating >= 3 then 3
	 when rating >= 2 then 4
	 when  rating >= 1 then 5
	 else  6
	 end as rating_ranked
	 ,count(r.[id]) as [number_of_rated_products]

  FROM [Shoes].[dbo].[reviews] r
  join [Shoes].[dbo].[brands] b
  on r.product_id = b.product_id
  join [Shoes].[dbo].[info] i
  on i.product_id = r.product_id
  join [Shoes].[dbo].[finance] f
  on f.product_id = r.product_id

  where revenue !=0
 
  group by [rating], r.[ID]

  )as sub
group by rating_result  ,rating_ranked
order by sub.rating_ranked

