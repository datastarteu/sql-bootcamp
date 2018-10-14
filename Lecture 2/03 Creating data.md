# Adding data to the database

Let's create our own database. Suppose we want a small database with two tables:

![](Computer-store-db.png)

These tables will be related to each other by the manufacturer of each product. 

In the `Manufacturers` table, this id should be a **primary key**: this is really just that, a unique identifier. 

In the table `Products`, we create a column called `Manufacturer` that should keep that same id. To prevent adding manufacturers in the `Products` table that are not registered, we need to specify **constraints**.

Run the code below: what do we get?

```sql

CREATE TABLE Manufacturers (
	Code INTEGER PRIMARY KEY NOT NULL,
	Name TEXT NOT NULL 
);

CREATE TABLE Products (
	Code INTEGER PRIMARY KEY NOT NULL,
	Name TEXT NOT NULL ,
	Price REAL NOT NULL ,
	Manufacturer INTEGER NOT NULL 
		CONSTRAINT fk_Manufacturers_Code REFERENCES MANUFACTURERS(Code)
);
```

### INSERT INTO

Let's insert some data in our tables:

```sql
INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);

```

### UPDATE 

We can use this command to modify our data. For instance, if we want to change the name of product 8 to "Laser Printer".

```sql
 UPDATE Products
   SET Name = 'Laser Printer'
   WHERE Code = 8;
```

or apply a discount:

```sql
UPDATE Products
   SET Price = Price - (Price * 0.1)
   WHERE Price >= 120;
```


### DELETE 

We can also delete some data rows:

```sql
DELETE FROM Products WHERE Code=8;
```