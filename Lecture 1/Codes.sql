/* Pre-requisites: Install and download 
 * https://dbeaver.io/download/
 * SQLite
 * Course repo
 * References (for more practice): http://www.sqlitetutorial.net/
 *  
 * VERIFY INSTALLATION: http://www.sqlitetutorial.net/download-install-sqlite/
 * */


/***********/
/* LECTURE */
/***********/


/* SELECT allows us to choose data from one or many tables */

SELECT * FROM Artist limit 10;

SELECT * FROM Track LIMIT 5; 

SELECT Name, Milliseconds, Bytes from Track; /* Avoid using the asterisk whenever possible in real life! */


SELECT City, Country FROM Customer; /* Where are our customers from? */

/* DISTINCT */
SELECT DISTINCT Country FROM Customer; /* How many different countries?*/

SELECT DISTINCT City, Country FROM Customer;


SELECT DISTINCT City, Country 
FROM Customer ORDER BY Country;

SELECT DISTINCT City, Country 
FROM Customer ORDER BY Country ASC; /* Alphabetically */

/* QUESTION: What song has the longest duration? */
SELECT Name, Milliseconds, Bytes 
FROM Track 
ORDER BY Milliseconds DESC; 

SELECT DISTINCT City, Country 
FROM Customer 
ORDER BY Country, City ASC; /* Alphabetically */


/* All the tracks from a given album? */
SELECT Name, Milliseconds, Bytes, AlbumId 
FROM Track 
WHERE AlbumId = 1;

SELECT Name, Milliseconds, Bytes, AlbumId 
FROM Track 
WHERE AlbumId IN (1,2,3);

SELECT Name, Milliseconds, Bytes, AlbumId 
FROM Track 
WHERE AlbumId = 1 AND Milliseconds > 250000;


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





/* COMBINING DATA FROM DIFFERENT SOURCES */


SELECT Track.Name, Genre.Name 
FROM Track 
LEFT JOIN Genre
ON Track.GenreId = Genre.GenreId


/* Same query, using aliases*/

SELECT x.Name, y.Name 
FROM Track x
LEFT JOIN Genre y
ON x.GenreId = y.GenreId


SELECT x.Name as TrackName, y.Title, y.AlbumId   
FROM Track x
INNER JOIN 
(
	SELECT Title, AlbumId 
	FROM Album
	WHERE AlbumId IN (1,2,3)
) y
ON x.AlbumId = y.AlbumId



SELECT m.FirstName || ' ' || m.LastName as 'Manager',
		e.FirstName || ' ' || e.LastName as 'Direct employee'
FROM Employee3 e
INNER JOIN Employee3 m 
ON m.EmployeeId = e.ReportsTo;


SELECT * FROM Employee3 LIMIT 10


/* GROUP BY */
SELECT AlbumId, count(TrackId) as TracksPerAlbum
FROM Track
GROUP BY AlbumId


SELECT Track.AlbumId, Album.Title, count(TrackId) as TracksPerAlbum
FROM Track
INNER JOIN Album on Album.AlbumId = Track.AlbumId
GROUP BY Track.AlbumId;

/*Choose only albums with more than a certain number of tracks*/
SELECT Track.AlbumId, Album.Title, count(TrackId) as TracksPerAlbum
FROM Track
INNER JOIN Album on Album.AlbumId = Track.AlbumId
GROUP BY Track.AlbumId
HAVING count(TrackId)>10;


/*CASE*/

SELECT CustomerId, FirstName, LastName, Country,
		CASE
			WHEN Country = 'Czech Republic' THEN 'Domestic'
			WHEN Country = 'Austria' THEN 'Neighbor'
			ELSE 'Other'
		END CustomerSegment
FROM Customer
ORDER BY CustomerSegment	


