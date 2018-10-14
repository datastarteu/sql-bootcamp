# WITH 

We can use the `WITH` statement to create some "virtual table" that can help us make our queries more readable.

```sql
WITH Segments as (
	SELECT CustomerId, FirstName, LastName, Country,
		CASE
			WHEN Country = 'Czech Republic' THEN 'Domestic'
			WHEN Country = 'Austria' THEN 'Neighbor'
			ELSE 'Other'
		END CustomerSegment
FROM Customer
ORDER BY CustomerSegment	
)
SELECT CustomerSegment, count(*)
FROM Segments
GROUP BY CustomerSegment
```
This particular example could be solved much easier (can you see how?), the point here is just to illustrate the syntax.

Your queries should be as readable as possible. Keeping a clear syntax helps, but also comments!

# Nested queries

In the `Computer Store` database, select the name and price of the cheapest product.

```sql
 SELECT name,price
  FROM Products
  ORDER BY price ASC
  LIMIT 1
```

We can also use a **nested query** for that:

```sql 
/* With a nested SELECT */
 SELECT Name, Price
   FROM Products
   WHERE Price = (SELECT MIN(Price) FROM Products);
```