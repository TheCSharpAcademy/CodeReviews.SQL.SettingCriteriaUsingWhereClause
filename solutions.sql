--List out all of the events from the tblEvent table in category number 11 (which corresponds to Love and Relationships, as it happens)

SELECT *
  FROM tblEvent
  Where CategoryID = '11';

--List out all of the tblEvent events which include the words Teletubbies OR Pandy.

SELECT *
  FROM tblEvent
  Where LOWER(EventDetails) like '%pandy%' 
  or LOWER(EventDetails) like '%teletubbies%' 
  or LOWER(EventName) like '%pandy%' 
  or LOWER(EventName) like '%teletubbies%'

--List out all of the events which took place in February 2005.

SELECT *
  FROM tblEvent
  Where YEAR(EventDate) = '2005' and Month(EventDate) = '02'

--Show a list of all events which might have something to do with water. ONE OR MORE of the following is true: 
--events that take place in one of the island countries (8, 22, 30 and 35, corresponding to Japan, the Marshall Islands, Cuba and Sri Lanka respectively); 
--their EventDetails column contains the word Water (not the text Water, but the word); 
--Their category is number 4 (Natural World). This list should return 11 rows. 

SELECT *
  FROM tblEvent
  Where CountryID in ('8','22','30','35')
  or LOWER(EventDetails) like '% water %'
  or CategoryID = '4'

  --Then add a criterion to show only those events which happened since 1970 (5 rows).

SELECT *
FROM tblEvent
WHERE 
    (CountryID IN ('8','22','30','35')
    OR LOWER(EventDetails) LIKE '% water %'
    OR CategoryID = '4')
    AND 
    YEAR(EventDate) > 1970;

--Create a query with events which aren't in the Transport category (number 14), but which nevertheless include the text Train in the EventDetails column.

 SELECT *
FROM tblEvent
WHERE 
    LOWER(EventDetails) Like '%train%'
	AND
	CategoryID <> 14

--List events which are in the Space country (number 13), but which don't mention Space in either the event name or the event details columns.

SELECT *
FROM tblEvent
WHERE 
	CountryID = 13
	AND 
	(Lower(EventName) NOT LIKE '%space%' AND Lower(EventDetails) NOT LIKE '%space%')

--Events which are in categories 5 or 6 (War/conflict and Death/disaster), but which don't mention either War or Death in the EventDetails column.

SELECT *
FROM tblEvent
WHERE 
    CategoryID IN (5, 6)
    AND 
    (LOWER(EventDetails) NOT LIKE '%war%' AND LOWER(EventDetails) NOT LIKE '%death%');
