# Exercises

Let's get a bit of practice!

- Show only the Customers from Czech Republic.
    <details>

    <summary>Solution</summary>
    <p>

    ```sql
    select * from customer
    where country = 'Czech Republic';
    ```
    </p>
    </details>

- Show only the Employees who are Sales Agents.
    <details>

    <summary>Solution</summary>
    <p>

    ```sql
    select * from employee
    where employee.title = 'Sales Support Agent';
    ```
    </p>
    </details>


- Provide a query that shows the # of invoices per country.
    <details>

    <summary>Solution</summary>
    <p>

    ```sql
    select billingcountry, count(billingcountry) as '# of invoices'
    from invoice
    group by billingcountry

    ```
    </p>
    </details>

- Show the total sales per country. Which country's customers spent the most?
    <details>

    <summary>Solution</summary>
    <p>

    ```sql
    select i.billingcountry, sum(total) as 'TotalSales'
    from invoice as i
    group by billingcountry
    order by totalsales desc
    ```
    </p>
    </details>

- How many line items does Invoice ID 37 have?.
    <details>

    <summary>Solution</summary>
    <p>

    ```sql
    select count(i.invoicelineid)
    from invoiceline as i
    where i.invoiceid = 37
    ```
    </p>
    </details>