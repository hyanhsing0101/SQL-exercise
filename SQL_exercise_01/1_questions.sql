-- LINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store
-- 1.1 Select the names of all the products in the store.
    select Name from Products;

-- 1.2 Select the names and the prices of all the products in the store.
    select Name, Price from Products;

-- 1.3 Select the name of the products with a price less than or equal to $200.
    select Name from Products where Price <= 200;

-- 1.4 Select all the products with a price between $60 and $120.
    select * from Products where Price >= 60 and Price <= 120;

-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
    select Name, Price*100 as PriceInCents from Products;

-- 1.6 Compute the average price of all the products.
    select avg(Price) from Products;

-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
    select avg(Price) from Products where Manufacturer = 2;

-- 1.8 Compute the number of products with a price larger than or equal to $180.
    select count(*) from Products where Price >= 180;

-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
    select name, price from Products where Price >= 180 order by Price desc, Name;

-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
    select * from Products join Manufacturers on Products.Manufacturer = Manufacturers.Code;

-- 1.11 Select the product name, price, and manufacturer name of all the products.
    select p.Name, p.Price, m.Name from Products as p join Manufacturers as m on p.Manufacturer = m.Code;

-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
    select Manufacturer, avg(Price) from Products group by Manufacturer;

-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
    select m.Name, avg(p.Price) from Products as p join Manufacturers as m
        on p.Manufacturer = m.Code group by p.Manufacturer;

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
    select m.Name from Manufacturers as m join Products as p
        on p.Manufacturer = m.Code group by m.Name having avg(p.Price) >= 150;

-- 1.15 Select the name and price of the cheapest product.
    select name, price from Products where Price = (select min(Price) from Products);

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
    select m.Name from Manufacturers m join Products p on m.Code = p.Manufacturer
    join (select p.Manufacturer, max(p.price) as MaxPrice from Products p group by p.Manufacturer) as MaxPrices
        on p.Manufacturer = MaxPrices.Manufacturer and p.Price = MaxPrices.MaxPrice;

-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
    insert into Products (Code, Name, Price, Manufacturer) values (21, 'Loudspeakers', 70, 2);

-- 1.18 Update the name of product 8 to "Laser Printer".
    update Products set Name = 'Laser Printer' where Code = 8;

-- 1.19 Apply a 10% discount to all products.
    update Products set Price = 0.9*Price;

-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
    update Products set Price = 0.9*Price where Price >= 120
