# Joining tables

### LEFT JOIN

```sql
SELECT Track.Name, Genre.Name 
FROM Track 
LEFT JOIN Genre
ON Track.GenreId = Genre.GenreId
```


```sql
/* Same query, using aliases*/
SELECT x.Name, y.Name 
FROM Track x
LEFT JOIN Genre y
ON x.GenreId = y.GenreId
```

### INNER JOIN

This is the deffault `JOIN` (so you do not need to explicitly type `INNER`).

This gives the intersection of both tables on the joining column (after `ON`). Example:

```sql
SELECT x.Name as TrackName, y.Title, y.AlbumId   
FROM Track x
INNER JOIN 
(
	SELECT Title, AlbumId 
	FROM Album
	WHERE AlbumId IN (1,2,3)
) y
ON x.AlbumId = y.AlbumId
```

A somewhat convoluted example: For every employee, find the name of its manager.

```sql
SELECT m.FirstName || ' ' || m.LastName as 'Manager',
		e.FirstName || ' ' || e.LastName as 'Direct employee'
FROM Employee3 e
INNER JOIN Employee3 m 
ON m.EmployeeId = e.ReportsTo;
```
Here we need to join the `Employee3` table with itself! (Do you see why?)

### An equivalent syntax
If you find the previous syntax, you can write the queries in a slightly different way (for inner joins):

```sql
SELECT Track.Name, Album.Title 
FROM Track, Album 
WHERE Album.AlbumId = Track.AlbumId
ORDER BY Album.Title
```

This is equivalent to:

```sql
SELECT Track.Name, Album.Title 
FROM Track
JOIN Album on Album.AlbumId = Track.AlbumId
ORDER BY Album.Title
```

