# Ride-Hailing Analytics

## Project Overview

This project analyzes ride-hailing platform data using Python, Pandas, and SQL to understand operational performance, customer behavior, driver performance, revenue patterns, and ride demand.

The analysis works with three related datasets containing information about customers, drivers, and rides. The objective is to transform the raw data into meaningful business insights that can support decisions related to driver performance, customer retention, demand planning, and revenue generation.

## Business Objectives

The analysis focuses on answering key business questions such as:

- Who are the top-performing drivers by earnings and number of rides?
- Which drivers cover the longest distances per ride?
- Which customer age group uses the platform most frequently?
- Which frequent customers have relatively low ratings?
- Which ride types and vehicle categories generate the most revenue?
- Which pickup and drop-off routes are most popular?
- What time of day has the highest ride demand?
- How do ride types and fares change over time?
- Who are the highest-value customers?
- Which days of the week have the highest demand?

## Dataset

The project contains three datasets:

| Dataset | Records | Description |
|---|---:|---|
| Customers | 2,233 | Customer details, ratings, demographics and ride history |
| Drivers | 523 | Driver details, ratings, vehicle information and experience |
| Rides | 21,200 | Ride details, locations, fares, distances, ride types and timestamps |

### Customers

Important attributes include:

- Customer ID
- Customer Name
- Customer Rating
- Total Rides
- Customer Feedback
- Location
- Frequent Drop-off Location
- Age
- Gender

### Drivers

Important attributes include:

- Driver ID
- Driver Name
- Driver Rating
- Total Rides
- Vehicle Type
- Driver Experience

### Rides

Important attributes include:

- Ride ID
- Pickup Location
- Drop-off Location
- Distance
- Ride Type
- Fare
- Driver ID
- Customer ID
- Per-KM Rate
- Pickup Date & Time

## Data Relationships

The three tables are connected through common identifiers:

```text
Customers
    |
    | customerid
    |
    v
  Rides
    ^
    | driverid
    |
Drivers

customerid connects customers with rides.
driverid connects drivers with rides.

These relationships allow customer and driver information to be combined with individual ride-level data for analysis.

Data Cleaning & Preparation

The datasets were cleaned and prepared before analysis to improve data accuracy, consistency, and completeness.

The cleaned datasets are provided in the data/ directory.

Tools & Technologies
Python
Pandas
Jupyter Notebook
SQL
PostgreSQL
SQL Analysis

SQL was used to perform analytical queries across the three related tables.

The analysis includes:

Joins
Aggregations
GROUP BY
HAVING
ORDER BY
Date and time analysis
Conditional logic using CASE
Common Table Expressions (CTEs)
Ranking and analytical queries
Key Analysis Areas
Driver Performance
Top drivers by total earnings
Top drivers by number of rides
Average distance covered per ride
Driver ratings and experience
Customer Analysis
Customer ride frequency
Customer ratings
Usage by age group
High-frequency customers with lower ratings
Customer lifetime value
Revenue Analysis
Total revenue
Average fare
Revenue by ride type
Revenue across vehicle categories
Monthly revenue trends
Demand Analysis
Popular pickup and drop-off routes
Peak demand periods
Monthly ride trends
Day-of-week demand
Business Insights

The analysis provides insights into:

Top drivers based on earnings and ride volume
High-value customers based on lifetime spending
Customer groups with high ride frequency
Popular routes across the platform
Peak demand periods
Revenue contribution across ride and vehicle categories
Monthly ride and fare trends
Project Structure
ride-hailing-analytics/
│
├── data/
│   ├── cleaned_customers.csv
│   ├── cleaned_drivers.csv
│   └── cleaned_rides.csv
│
├── project_py.ipynb
├── Rides analysis.sql
└── README.md
Conclusion

This project demonstrates the use of Python and SQL to analyze a multi-table ride-hailing dataset and extract meaningful business insights.

The analysis covers driver performance, customer behavior, revenue generation, route popularity, and demand patterns, providing a structured view of ride-hailing operations.

