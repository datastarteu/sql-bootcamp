# Basic SQL commands


### SELECT
 `SELECT` allows us to choose data from one or many tables:

 ```sql
SELECT * FROM Artist LIMIT 10;
```

For large production tables, it is good idea to use `LIMIT` to restrict the number of rows, specially if we only want to quickly look at the data.

You can select specific columns of a table:

```sql
SELECT Name, Milliseconds, Bytes from Track;  
```
**Tip:** Avoid using the asterisk whenever possible in real life!

You can comment your queries with `/* comment */`:

```sql
SELECT City, Country FROM Customer; /* Where are our customers from? */
```


###  DISTINCT 

This simply chooses distinct values.

```sql
SELECT DISTINCT Country FROM Customer; /* How many different countries?*/
```


### ORDER BY

Ranks in ascending order (or alphabetically):

```sql
SELECT DISTINCT City, Country 
FROM Customer ORDER BY Country;
```

You can override this with `DESC` 

```sql
SELECT Name, Milliseconds, Bytes 
FROM Track 
ORDER BY Milliseconds DESC; 
```

### WHERE

`WHERE` filters by rows, if they fulfill a condition.

```sql
/* All the tracks from a given album? */
SELECT Name, Milliseconds, Bytes, AlbumId 
FROM Track 
WHERE AlbumId = 1;
```

It can do more complicated things, for instance:

- Filter from a list of values:

```sql
SELECT Name, Milliseconds, Bytes, AlbumId 
FROM Track 
WHERE AlbumId IN (1,2,3);
```

- Filter via several criteria:
```sql
SELECT Name, Milliseconds, Bytes, AlbumId 
FROM Track 
WHERE AlbumId = 1 AND Milliseconds > 250000;
```

- Filter with some basic pattern matching. Run and compare each of the statements below separately!

```sql

SELECT Name FROM Track WHERE Name LIKE 'Samba%';
SELECT Name FROM Track WHERE Name LIKE 'Samba';
SELECT Name FROM Track WHERE Name LIKE '%Samba';

SELECT Name FROM Track WHERE Name LIKE '%B_ck%';
SELECT Name FROM Track WHERE Name LIKE '%B__ck%';


SELECT Name 
FROM Track 
WHERE Name GLOB '*[0-9]*';

SELECT Name 
FROM Track 
WHERE Name GLOB '*[^0-9]*';
```
- We can also filter by range, for instance, in time:


```sql
/* How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years? */
select COUNT(invoiceid), SUM(total)
from invoice
where invoicedate between datetime('2011-01-01 00:00:00') and datetime('2011-12-31 00:00:00');
```

### GROUP BY

This command allows us to do basic calculations on groups. 

```sql
/* How many tracks per album? */
SELECT AlbumId, COUNT(TrackId) as TracksPerAlbum
FROM Track
GROUP BY AlbumId
```

The query above tells SQLite to separate by groups per `AlbumId`. Since we will display only one value for each group, we need to specify what to do with the other column which is not part of the group, in this case, `TrackId`. We used the `COUNT` function. Other possibilities are:

- `AVG`
- `MAX`
- `MIN`
- `SUM`


You can combine all the statements above together, for instance:

```sql
/* How many tracks per album? In descending order */
SELECT AlbumId, COUNT(TrackId) as TracksPerAlbum
FROM Track
GROUP BY AlbumId
ORDER BY TracksPerAlbum DESC
```

### HAVING
This command acts as a `WHERE` but for grouped tables, that are made on the fly. For example, let's choose only albums with more than a certain number of tracks:

```sql
SELECT AlbumId, count(TrackId) as TracksPerAlbum
FROM Track
GROUP BY AlbumId
HAVING count(TrackId)>10;
```

### CASE

Sometimes it is useful to modify a bit the data to present the results in a different way to, say, a business user. We use `CASE` to edit the data on the query. This does not modify the data stored in the database.

```sql
SELECT CustomerId,
     FirstName, 
     LastName, 
     Country,
	CASE
		WHEN Country = 'Czech Republic' THEN 'Domestic'
		WHEN Country = 'Austria' THEN 'Neighbor'
		ELSE 'Other'
	END CustomerSegment
FROM Customer
ORDER BY CustomerSegment	
```


