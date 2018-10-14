# Exercises

Let's get a bit of practice!

1. Provide a query showing the Invoices of customers who are from Czech Republic. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
    <details>

    <summary>Solution</summary>
    <p>

    ```sql
    select c.firstname, c.lastname, i.invoiceid, i.invoicedate, i.billingcountry
    from customer as c, invoice as i
    where c.country = 'Czech Republic' and
    c.customerid = i.customerid;
    ```
    </p>
    </details>

2. Provide a query showing the invoices of customers who are from Czech Republic.
    <details>

    <summary>Solution</summary>
    <p>

    ```sql
    select * from customer as c, invoice as i
    where c.country = 'Czech Republic' and
    c.customerid = i.customerid;
    ```
    </p>
    </details>

3. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
    <details>

    <summary>Solution</summary>
    <p>

    ```sql
    select e.firstname, e.lastname, i.invoiceid, i.customerid, i.invoicedate, i.billingaddress, i.billingcountry, i.billingpostalcode, i.total
    from customer as c, invoice as i
    on c.customerid = i.customerid
    join employee as e
    on e.employeeid = c.supportrepid
    order by e.employeeid;
    ```
    </p>
    </details>


4. Provide a query that shows total sales made by each sales agent.
    <details>

    <summary>Solution</summary>
    <p>

    ```sql
    select e.*, count(i.invoiceid) as 'Total Number of Sales'
    from employee as e
	join customer as c on e.employeeid = c.supportrepid
	join invoice as i on i.customerid = c.customerid
    group by e.employeeid
    ```
    </p>
    </details>

5. Provide a query that shows the most purchased track of 2013.
    <details>

    <summary>Solution</summary>
    <p>

    ```sql
    select *, count(t.trackid) as count
    from invoiceline as il
	join invoice as i on i.invoiceid = il.invoiceid
	join track as t on t.trackid = il.trackid
    where i.invoicedate between '2013-01-01' and '2013-12-31'
    group by t.trackid
    order by count desc
    ```
    </p>
    </details>    