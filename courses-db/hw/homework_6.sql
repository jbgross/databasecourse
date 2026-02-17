-- use the view vcampaign created in Lab 13.

-- 1. For the 3 occupations 'STUDENT', 'TEACHER', and 'LAWYER',
-- show the occupation, and average dollar contribution rounded to an whole number 
-- use the view "vcampaign" and order by occupation 
-- Answer: The average contribution by STUDENT should be 538.
select 1;

-- 2. How many occupations have an occupation that contains the string 'lawyer'  
-- Answer: 28
select 2;

-- 3. List all the ways that lawyers list their occupation.
select 3; 

-- 4. how many contributors have the occupation listed as 'LAWYER' exactly.
-- Answer: 553
select 4;

-- 5. what is the average number (not amount) of contributions per zip code.
-- Answer:  95.5416
select 5;

-- 6. list the top 20 zip codes by number of contributors in the zip code
-- use only the first 5 digits of the zip code. Order by count.
select 6;

-- 7. list the top 20 zip codes by total amount of contributions in the zip code
-- use only the first 5 digits of the zip code. Order by total.
select 7;

-- 8. show the date and amount of contribution made by 'BATTS, ERIC'.  Order by amount (largest to smallest)
select 8;

-- 9. list the top 20 contributors from the city of SALINAS and the total amount contributed by each contributor.
-- order by total
select 9;

-- 10. for each candidate, list the percentage of total contribution amount made up by positive contributions under $1,000
--     Result should have columns cand_name, percentage and be ordered by candidate name.
--     Ignore a contribution if amount is negative.
--     Answer includes : Bernard Sanders has percentage 0.776584
select 10;

-- 11. for each candidate, which zip code(s) contributed the highest amount to the candidate
--     Result should have candidate name, 5 digit zip code and total amount contributed as "total"
--     Order the result by candiate name.
--     Ignore a contribution if amount is negative.
--     Answer includes:  Hilary Clinton, zip 90049  
--                       George Pataki, zip 94549 and 95608 are tied with $5400.00 each.
select 11;