-- Write a query to list out all of the events from the tblEvent table in category number 11 (which corresponds to Love and Relationships, as it happens)
SELECT * 
FROM dbo.tblEvent
WHERE CategoryID = 11

-- Create a query which lists out all of the tblEvent events which include the words Teletubbies OR Pandy.
SELECT *
FROM dbo.tblEvent
WHERE EventName LIKE '%Teletubbies%' 
	OR EventName LIKE '%Pandy%'
	OR EventDetails LIKE '%Teletubbies%' 
	OR EventDetails LIKE '%Pandy%'

-- Create a query which lists out all of the events which took place in February 2005.
SELECT *
FROM dbo.tblEvent
WHERE EventDate >= '2005-02-01 00:00:00'
	AND EventDate <= '2005-03-01 00:00:00'
	-- Can be used between but i don't like it :)
	-- AND EventDate BETWEEN '2005-02-01 00:00:00' AND '2005-03-01 00:00:00'

-- Write a query with the following FOUR criteria: 
-- events that take place in one of the island countries (8, 22, 30 and 35, corresponding to Japan, the Marshall Islands, Cuba and Sri Lanka respectively); 
-- their EventDetails column contains the word Water (not the text Water, but the word); 
-- Their category is number 4 (Natural World). 
-- They happened in 1970 or after.
SELECT *
FROM dbo.tblEvent
WHERE CountryID IN (8, 22, 30, 35)
	AND EventDetails LIKE '% water %'
	AND CategoryID = 4
	AND EventDate >= '1970-01-01 00:00:00'

-- Create a query with events which aren't in the Transport category (number 14), but which nevertheless include the text Train in the EventDetails column.
SELECT *
FROM dbo.tblEvent
WHERE CategoryID != 14
	AND EventDetails NOT LIKE ('%Train%')
