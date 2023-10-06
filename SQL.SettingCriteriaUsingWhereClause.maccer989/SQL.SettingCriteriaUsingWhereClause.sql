--SQL Setting Criteria Using Where Clause

-- Create a query to list out all of the events from the tblEvent table in category number 11
select  *
from dbo.tblEvent 
where CategoryID=11

-- Create a query to list out all of the tblEvent events which include the words Teletubbies OR Pandy.
select  *
from dbo.tblEvent
where EventName like '%Teletubbies%' or EventName  like '%Pandy%'


-- Create a query to list out all of the events which took place in February 2005.
select  *
from dbo.tblEvent 
where EventDate like '%2005-02-%'

-- Create a query to show a list of all events which might have something to do with water. ONE OR MORE of the following is true: 
-- events that take place in one of the island countries (8, 22, 30 and 35, corresponding to Japan, the Marshall Islands, Cuba and Sri Lanka respectively); 
-- their EventDetails column contains the word Water (not the text Water, but the word); 
-- Their category is number 4 (Natural World). This list should return 11 rows. Then add a criterion to show only those events which happened since 1970 (5 rows).
select  *
from dbo.tblEvent 
where    (CountryID in (8,22,30,35) or EventDetails like '%Water %' or CategoryID =4) and EventDate >= Convert(datetime, '1970-01-01' )

-- Create a query with events which aren't in the Transport category (number 14), but which nevertheless include the text Train in the EventDetails column.
select  *
from dbo.tblEvent 
where CategoryID !=14 and (EventDetails like '%train' or EventDetails like '%trains%')

-- Create a query to list events which are in the Space country (number 13), but which don't mention Space in either the event name or the event details columns.
select  *
from dbo.tblEvent 
where EventName  not like  '%space%' and EventDetails not like '%space%' and CountryID =13 

-- Create a query with events which are in categories 5 or 6 (War/conflict and Death/disaster), but which don't mention either War or Death in the EventDetails column.
select  *
from dbo.tblEvent 
where EventDetails  not like  '%war%' and EventDetails not like '%death%' and (CategoryID = 5 or CategoryID = 6) 