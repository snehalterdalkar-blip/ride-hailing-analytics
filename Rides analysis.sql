DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
customerid VARCHAR PRIMARY KEY,
customername VARCHAR(100),
customerrating NUMERIC(2,1),
totalrides INT,
customerfeedback TEXT,
location VARCHAR(100),
frequentdropofflocation VARCHAR(100),
age INT,
gender VARCHAR(10)
);
DROP TABLE IF EXISTS drivers;
CREATE TABLE drivers (
driverid VARCHAR PRIMARY KEY,
drivername VARCHAR(100),
driverrating NUMERIC(2,1),
totalrides INT,
vehicletype VARCHAR(50),
driverexperienceyears INT
);
DROP TABLE IF EXISTS rides;
CREATE TABLE rides (
rideid VARCHAR PRIMARY KEY,
pickuplocation VARCHAR(100),
dropofflocation VARCHAR(100),
distance NUMERIC(6,2),
ridetype VARCHAR(50),
fare NUMERIC(10,2),
driverid VARCHAR,
customerid VARCHAR,
perkmrate NUMERIC(6,2),
pickupdatetime TIMESTAMP,
FOREIGN KEY (driverid) REFERENCES drivers(driverid),
FOREIGN KEY (customerid) REFERENCES customers(customerid)
);
SELECT * FROM customers;
SELECT * FROM drivers;
SELECT * FROM rides;

SELECT distinct COUNT(*) AS total_customers FROM customers;
SELECT distinct COUNT(*) AS total_drivers FROM drivers;
SELECT COUNT(*) AS total_rides FROM rides;

--rides
SELECT MIN(distance) AS min_distance, MAX(distance) AS max_distance, ROUND(AVG(distance),2) AS avg_distance,
MIN(fare) AS min_fare, MAX(fare) AS max_fare, ROUND(AVG(fare),2) AS avg_fare,
MIN(perkmrate) AS min_rate, MAX(perkmrate) AS max_rate, ROUND(AVG(perkmrate),2) AS avg_rate
FROM rides;

--drivers
SELECT MIN(driverexperienceyears) AS min_exp, MAX(driverexperienceyears) AS max_exp, ROUND(AVG(driverexperienceyears),1) AS avg_exp,
MIN(driverrating) AS min_rating, MAX(driverrating) AS max_rating, ROUND(AVG(driverrating),1) AS avg_driver_rating,
AVG(totalrides) AS avg_driver_rides
FROM drivers;

--Q1): Who are the top 10 drivers by total earnings and number of rides?
SELECT 
d.driverid,
d.drivername,
d.driverrating,
SUM(r.fare) AS total_earnings,
COUNT(r.rideid) AS total_rides
FROM drivers d
JOIN rides r ON d.driverid = r.driverid
GROUP BY d.driverid, d.drivername, d.driverrating
ORDER BY total_earnings DESC, d.driverrating DESC
LIMIT 10;

--Q2)Driver efficiency: Who drives the longest distances per ride on average?
SELECT d.driverid, d.drivername, ROUND(AVG(r.distance),2) AS avg_distance
FROM rides r
JOIN drivers d ON r.driverid = d.driverid
GROUP BY d.driverid, d.drivername
ORDER BY avg_distance DESC
LIMIT 10;


--Q3)Which age group uses rides most frequently?
SELECT 
CASE WHEN age < 25 THEN 'Under 25'
WHEN age BETWEEN 25 AND 40 THEN '25-40'
WHEN age BETWEEN 41 AND 60 THEN '41-60'
ELSE '60+' END AS age_group,
COUNT(r.rideid) AS total_rides,
SUM(r.fare) AS total_spent
FROM customers c
JOIN rides r ON c.customerid = r.customerid
GROUP BY age_group
ORDER BY total_rides DESC;


--Q4)Who are the top 10 customers with the highest ride frequency but lowest average rating?
SELECT c.customerid, c.customername, COUNT(r.rideid) AS ride_count,
ROUND(AVG(c.customerrating),2) AS avg_rating
FROM customers c
JOIN rides r ON c.customerid = r.customerid
GROUP BY c.customerid, c.customername
HAVING COUNT(r.rideid) > 5
ORDER BY avg_rating ASC, ride_count DESC
LIMIT 10;

--Q5)Across all vehicle types, which ride type generates the most revenue, and how does this differ across vehicle categories?
SELECT 
r.ridetype,
d.vehicletype,
COUNT(r.rideid) AS total_rides,
SUM(r.fare) AS total_revenue,
AVG(r.fare) AS avg_fare_per_ride
FROM rides r
JOIN drivers d 
ON r.driverid = d.driverid
GROUP BY r.ridetype, d.vehicletype
ORDER BY total_revenue DESC;

--Q6)Which pickup-dropoff routes are the most popular?
SELECT pickuplocation, dropofflocation, COUNT(*) AS ride_count
FROM rides
GROUP BY pickuplocation, dropofflocation
ORDER BY ride_count DESC
LIMIT 10;


--Q7)Peak demand time – At what time of the day do most rides occur?
SELECT CASE 
WHEN EXTRACT(HOUR FROM r.pickupdatetime) BETWEEN 6 AND 11 THEN 'Morning'
WHEN EXTRACT(HOUR FROM r.pickupdatetime) BETWEEN 12 AND 17 THEN 'Afternoon'
WHEN EXTRACT(HOUR FROM r.pickupdatetime) BETWEEN 18 AND 22 THEN 'Evening'
ELSE 'Night'
END AS timeslot,
COUNT(*) AS total_rides,
SUM(r.fare) AS total_revenue
FROM rides r
GROUP BY timeslot
ORDER BY total_revenue DESC;


--Q8)Ride type trends over months.
SELECT 
ridetype, 
EXTRACT(YEAR FROM pickupdatetime) AS year,
EXTRACT(MONTH FROM pickupdatetime) AS month,
COUNT(rideid) AS total_rides,
AVG(fare) AS avg_fare
FROM rides
GROUP BY ridetype, EXTRACT(YEAR FROM pickupdatetime), EXTRACT(MONTH FROM pickupdatetime)
ORDER BY year, month;

--Q9)Total monthly rides,their revenue and avg fare. 
SELECT 
EXTRACT(YEAR FROM pickupdatetime) AS ride_year,
EXTRACT(MONTH FROM pickupdatetime) AS ride_month,
COUNT(*) AS total_rides,
ROUND(SUM(fare), 2) AS total_revenue,
ROUND(AVG(fare), 2) AS avg_fare
FROM rides
GROUP BY ride_year, ride_month
ORDER BY total_rides desc;

--Q10)Top 10 customers by lifetime value
SELECT 
c.customerid,
c.customername,
COUNT(r.rideid) AS total_rides,
ROUND(AVG(r.fare),2) AS avg_fare,
ROUND(SUM(r.fare),2) AS lifetime_value
FROM customers c
JOIN rides r ON c.customerid = r.customerid
GROUP BY c.customerid, c.customername
ORDER BY lifetime_value DESC
LIMIT 10;


--Q11)Which day of the week has maximum demand?
SELECT TO_CHAR(pickupdatetime, 'Day') AS day_of_week,
 COUNT(*) AS total_rides,
ROUND(AVG(fare),2) AS avg_fare,
SUM(fare) AS total_revenue
FROM rides
GROUP BY day_of_week
ORDER BY total_revenue DESC;



