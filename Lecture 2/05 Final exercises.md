# Chinook

- Provide a query that shows the # of customers assigned to each sales agent.
    <details>

    <summary>Solution</summary>
    <p>

    ```sql
    select e.*, count(c.customerid) as 'TotalCustomers'
    from employee as e
	join customer as c on e.employeeid = c.supportrepid
    group by e.employeeid
    ```
    </p>
    </details>

- Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include the Album name, Media type and Genre.
    <details>

    <summary>Solution</summary>
    <p>

    ```sql
    select t.name as 'track', a.title as 'album', g.name as 'genre', m.name as 'media type'
    from track as t
        join album as a on a.albumid = t.albumid
        join genre as g on g.genreid = t.genreid
        join mediatype as m on m.mediatypeid = t.mediatypeid
    ```
    </p>
    </details>


- Which sales agent made the most in sales in 2010?
    <details>

    <summary>Solution</summary>
    <p>

    ```sql
    select *, max(total) from
    (select e.*, sum(total) as 'Total'
    from employee as e
        join customer as c on e.employeeid = c.supportrepid
        join invoice as i on i.customerid = c.customerid
    where i.invoicedate between '2010-01-00' and '2010-12-31'
    group by e.employeeid)
    ```
    </p>
    </details>

# Computer Store

- Apply a 10% discount to all products.
    <details>

    <summary>Solution</summary>
    <p>

    ```sql
    UPDATE Products
    SET Price = Price - (Price * 0.1);
    ```
    </p>
    </details>

- Add a new product: Loudspeakers, $70, manufacturer 2.
    <details>

    <summary>Solution</summary>
    <p>

    ```sql
    INSERT INTO Products( Code, Name , Price , Manufacturer)
    VALUES ( 11, 'Loudspeakers' , 70 , 2 );
    ```
    </p>
    </details>

- Select the names of manufacturer whose products have an average price larger than or equal to $150.
    <details>

    <summary>Solution</summary>
    <p>

    ```sql
     /* Without INNER JOIN */
    SELECT AVG(Price), Manufacturers.Name
    FROM Products, Manufacturers
    WHERE Products.Manufacturer = Manufacturers.Code
    GROUP BY Manufacturers.Name
    HAVING AVG(Price) >= 150;
    
    /* With INNER JOIN */
    SELECT AVG(Price), Manufacturers.Name
    FROM Products INNER JOIN Manufacturers
    ON Products.Manufacturer = Manufacturers.Code
    GROUP BY Manufacturers.Name
    HAVING AVG(Price) >= 150;
    ```
    </p>
    </details>



- Select the name of each manufacturer along with the name and price of its most expensive product.
    <details>

    <summary>Solution</summary>
    <p>

    ```sql
     /* With a nested SELECT and without INNER JOIN */
    SELECT A.Name, A.Price, F.Name
    FROM Products A, Manufacturers F
    WHERE A.Manufacturer = F.Code
        AND A.Price =
        (
        SELECT MAX(A.Price)
            FROM Products A
            WHERE A.Manufacturer = F.Code
        );
    
    /* With a nested SELECT and an INNER JOIN */
    SELECT A.Name, A.Price, F.Name
    FROM Products A INNER JOIN Manufacturers F
    ON A.Manufacturer = F.Code
        AND A.Price =
        (
        SELECT MAX(A.Price)
            FROM Products A
            WHERE A.Manufacturer = F.Code
        );
    ```
    </p>
    </details>    


    Yet more practice? Look at the excellent [SQL Exercises wikibook](https://en.wikibooks.org/wiki/SQL_Exercises). We recommend `The Hospital` for a serious challenge!