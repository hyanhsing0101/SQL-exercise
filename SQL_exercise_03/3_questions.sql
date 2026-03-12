-- LINK : https://en.wikibooks.org/wiki/SQL_Exercises/Employee_management
-- 3.1 Select all warehouses.
select * from Warehouses;

-- 3.2 Select all boxes with a value larger than $150.
select * from Boxes where Value > 150;

-- 3.3 Select all distinct contents in all the boxes.
select distinct Contents from Boxes;

-- 3.4 Select the average value of all the boxes.
select avg(Value) from Boxes;

-- 3.5 Select the warehouse code and the average value of the boxes in each warehouse.
select Warehouse, avg(Value) from Boxes group by Warehouse;

-- 3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
select Warehouse, avg(Value) from Boxes group by Warehouse having avg(Value) >150;

-- 3.7 Select the code of each box, along with the name of the city the box is located in.
select b.Code, w.location from Boxes b join Warehouses w on b.Warehouse = w.Code;

-- 3.8 Select the warehouse codes, along with the number of boxes in each warehouse.
-- Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
select w.Code, count(b.Code) from Warehouses w left join Boxes b on w.Code = b.Warehouse group by w.Code;

-- 3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
select w.Code from Warehouses w join Boxes b on w.Code = b.Warehouse group by w.Code, w.Capacity
having count(b.Code) > w.Capacity;

-- 3.10 Select the codes of all the boxes located in Chicago.
select b.Code from Boxes b join Warehouses w on b.Warehouse = w.Code where w.Location = 'Chicago';

-- 3.11 Create a new warehouse in New York with a capacity for 3 boxes.
insert into Warehouses (Code, Location, Capacity) values (6, 'New York', 3);

-- 3.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
insert into Boxes (Code, Contents, Value, Warehouse) VALUES ('H5RT', 'Papers', 200, 2);

-- 3.13 Reduce the value of all boxes by 15%.
update Boxes set Value = 0.85 * Value;

-- 3.14 Remove all boxes with a value lower than $100.
delete from Boxes where Value < 100;

-- 3.15 Remove all boxes from saturated warehouses.
delete from Boxes where (select Capacity from Warehouses where Code = Boxes.Warehouse) <
                        (select count(*) from Boxes b2 where Boxes.Warehouse = b2.Warehouse);

delete from Boxes where Warehouse in (select w.Code from Warehouses w join Boxes b
    on w.Code = b.Warehouse group by w.Code, w.Capacity having count(b.Code) > w.Capacity);
-- 3.16 Add Index for column "Warehouse" in table "boxes"
-- !!!NOTE!!!: index should NOT be used on small tables in practice
create index idx_location on Warehouses(Location);

-- 3.17 Print all the existing indexes
-- !!!NOTE!!!: index should NOT be used on small tables in practice
show index from Warehouses;

-- 3.18 Remove (drop) the index you added just
-- !!!NOTE!!!: index should NOT be used on small tables in practice
drop index idx_location on Warehouses;