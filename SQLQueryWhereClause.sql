-- List out all of the events from the tblEvent table in category number 11 
--(which corresponds to Love and Relationships, as it happens)

select * 
from dbo.tblEvent 
where CategoryID = 11

--List out all of the tblEvent events which include the words Teletubbies OR Pandy.

select * 
from dbo.tblEvent 
where EventName LIKE '%Teletubbies%' OR EventName LIKE '%Pandy%'

-- List out all of the events which took place in February 2005.

SELECT *
FROM dbo.tblEvent
WHERE MONTH(EventDate) = 2 AND YEAR(EventDate) = 2005;

-- Show a list of all events which might have something to do with water. ONE OR MORE of the following is true:
-- events that take place in one of the island countries (8, 22, 30 and 35, corresponding to Japan, the Marshall Islands, Cuba and Sri Lanka respectively);
-- their EventDetails column contains the word Water (not the text Water, but the word);
-- Their category is number 4 (Natural World). This list should return 11 rows. 
-- Then add a criterion to show only those events which happened since 1970 (5 rows).

select  *
from dbo.tblEvent 
where    (CountryID in (8,22,30,35) or EventDetails like '%Water %' or CategoryID =4) and EventDate >= Convert(datetime, '1970-01-01' )


--Create a query with events which aren't in the Transport category (number 14), but which nevertheless include the text Train in the EventDetails column.
select * 
from dbo.tblEvent
where CategoryID != 14 and EventDetails LIKE '%train%'
--List events which are in the Space country (number 13), but which don't mention Space in either the event name or the event details columns.
select *
from dbo.tblEvent 
where CountryID = 13 AND EventName NOT LIKE '%space%' AND EventDetails NOT LIKE '%space%'
--Events which are in categories 5 or 6 (War/conflict and Death/disaster), but which don't mention either War or Death in the EventDetails column.
select *
from dbo.tblEvent
where (CategoryID in(5,6) AND EventDetails NOT LIKE '%war%' AND EventDetails not like '%death%')