-- 1. How can you retrieve all the information from the cd.facilities table?
SELECT * FROM cd.facilities;

-- Returns a total of 6 columns having 9 rows.

-- 2. You want to print out a list of all of the facilities and their cost to members. 
-- How would you retrieve a list of only facility names and costs?

SELECT name, membercost FROM cd.facilities;

-- Returns 2 columns having 9 rows.

-- 3. How can you produce a list of facilities that charge a fee to members?

SELECT * FROM cd.facilities
WHERE membercost > 0;

-- Returns 5 rows where the MemberCost is greater than 0.

-- 4. How can you produce a list of facilities that charge a fee to members, 
-- and that fee is less than 1/50th of the monthly maintenance cost? Return the 
-- facid, facility name, member cost, and monthly maintenance of the facilities 
-- in question.

SELECT facid, name AS facility_name, membercost, monthlymaintenance  
FROM cd.facilities
WHERE membercost < (monthlymaintenance/50) 
AND membercost > 0;

-- Returns 4 columns having 2 rows.

-- 5. How can you produce a list of all facilities with the word 'Tennis' 
-- in their name?

SELECT * FROM cd.facilities
WHERE name ILIKE '%tennis%';

-- Returns 3 rows where the name has the word "Tennis" in it.

-- 6. How can you retrieve the details of facilities with ID 1 and 5? 
-- Try to do it without using the OR operator.

SELECT * FROM cd.facilities
WHERE facid IN (1,5);

-- Returns details of facilities with ID 1 and 5

-- 7. How can you produce a list of members who joined after the start of 
-- September 2012? Return the memid, surname, firstname, and joindate of the 
-- members in question.

SELECT memid, surname, firstname, joindate FROM cd.members
WHERE joindate > '2012-09-01';

-- Returns 4 columns having 10 rows

-- 8. How can you produce an ordered list of the first 10 surnames in the members 
-- table? The list must not contain duplicates.

SELECT DISTINCT surname FROM cd.members
ORDER BY surname
LIMIT 10;

-- Returns ordered list of first 10 distinct surnames.

-- 9. You'd like to get the signup date of your last member. How can you 
-- retrieve this information?

SELECT joindate FROM cd.members
ORDER BY joindate DESC
LIMIT 1;

-- Returns: 2012-09-26 18:08:45

-- 10. Produce a count of the number of facilities that have a cost to guests of 
-- 10 or more.

SELECT COUNT (*) AS No_Of_Facilities FROM cd.facilities
WHERE guestcost >= 10;

-- Returns: 6

-- 11. Produce a list of the total number of slots booked per facility in the month 
-- of September 2012. Produce an output table consisting of facility id and slots, 
-- sorted by the number of slots.

SELECT facid, SUM (slots) AS total_slots FROM cd.bookings
WHERE starttime > '2012-09-01'
GROUP BY facid
ORDER BY total_slots;

-- Returns 9 rows.

-- 12. Produce a list of facilities with more than 1000 slots booked. Produce an 
-- output table consisting of facility id and total slots, sorted by facility id.

SELECT facid, SUM (slots) AS total_slots FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid;

-- Returns 5 rows

-- 13. How can you produce a list of the start times for bookings for tennis courts,
-- for the date '2012-09-21'? Return a list of start time and facility name pairings,
-- ordered by the time.

SELECT starttime, name FROM cd.facilities
INNER JOIN cd.bookings
ON bookings.facid= facilities.facid
WHERE starttime > '2012-09-21' AND starttime < '2012-09-22'
AND name ILIKE 'tennis%'
ORDER BY starttime;

-- Returns 12 rows

-- 14. How can you produce a list of the start times for bookings by members named 
-- 'David Farrell'?

SELECT starttime FROM cd.bookings
INNER JOIN cd.members
ON bookings.memid= members.memid
WHERE surname ILIKE 'farrell'
AND firstname ILIKE 'david'
ORDER BY starttime;

-- Returns 34 rows




