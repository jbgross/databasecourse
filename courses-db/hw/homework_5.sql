--    The following questions use the tables from product database:
--    tables product, pc, laptop and printer.
--    Use the file productDB.sql to create these tables 
--    with data.
--
-- 1.	What PC models have a speed of at least 3.00?  
--      List the results in order by model.
--      Answer:  3 rows
select 1;

-- 2.	List all manufacturers that makes laptops with a hard disk 
--       of at least 100GB?  List in order by maker.
--       Answer:  5 rows
select 2;

-- 3.	Find the model number and price of all products (of any 
--      type) made by manufacturer B?  
--      The result should be in order by model number and then by
--      price (low to high)  [hint:  use a union]
--      Answer:  4 rows
select 3;

-- 4.	Find the model numbers for all color laser printers.  
--      Order by model.
--      Answer:  2 rows
select 4;

-- 5.	Find those manufacturers that sell laptops but not pc’s. 
--      Sort result by maker.
--      Answer:  F and G
select 5;

-- 6.	Find those hard-drive sizes that occur in two or more PC’s.   
--      Sort the list low to high. [hint: use group and having]
--      Answer:  80, 160, 250
select 6;

-- 7.	Find those pairs of PC models that have both the same speed 
--      and RAM.  The output should have 2 columns,  "model1" and
--      "model2".  A pair should be listed only once:  e.g. if 
--      (model1, model2) is in the result then (model2, model1) 
--      should not appear.   Sort the output by the first column.
--      Answer:  1 rows (1004, 1012)
select 7;

-- 8.	Find the maker(s) of the color printer with the lowest 
--      price. Order by maker.
--      Answer:  E
select 8;

-- 9.	Find the manufacturer of PC’s with at least three different 
--      speeds.  Order by maker.
--      Answer:  A, D and E
select 9;

-- 10.	Find those manufacturers of at least two different computers 
--     (PC’s or laptops)  with speeds of at least 2.80.  
--      Order the result by maker. 
--      Answer:  B, E
select 10;

-- 11.  Find the manufacturer(s) of the computer (PC or laptop) with
--      the highest speed.  
--      If there are multiple makers, order by maker.
--      Answer: B 
select 11;