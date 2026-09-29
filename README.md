# Ride-Hailing Analytics

## Project Overview

This project analyzes ride-hailing platform data using Python, Pandas, and SQL to understand operational performance, customer behavior, driver performance, revenue patterns, and ride demand.

The analysis works with three related datasets containing information about customers, drivers, and rides. The objective is to transform the data into meaningful business insights that can support decisions related to driver performance, customer retention, demand planning, and revenue generation.

## Business Objectives

The analysis focuses on answering key business questions such as:

- Who are the top-performing drivers by earnings and number of rides?
- Which drivers cover the longest distances per ride?
- Which customer age group uses rides most frequently?
- Which frequent customers have the lowest average rating?
- Which ride type generates the most revenue across vehicle categories?
- Which pickup and drop-off routes are the most popular?
- What time of day has the highest ride demand?
- How do ride types and fares change over time?
- Who are the top customers by lifetime value?
- Which day of the week has the highest demand?

## Dataset

The project contains three related datasets:

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
```

- `customerid` connects the Customers table with the Rides table.
- `driverid` connects the Drivers table with the Rides table.

These relationships allow customer and driver information to be combined with ride-level data for analysis.

## Data Cleaning & Preparation

The datasets were cleaned and prepared before analysis to improve data accuracy, consistency, and completeness.

The cleaned datasets are included in the `data/` directory.

## Tools & Technologies

- Python
- Pandas
- Jupyter Notebook
- SQL
- PostgreSQL

## SQL Analysis

SQL was used to perform analytical queries across the three related tables.

The analysis includes:

- Joins
- Aggregations
- GROUP BY
- HAVING
- ORDER BY
- CASE statements
- Date and time functions
- Common Table Expressions (CTEs)
- Ranking and analytical queries

## Key Analysis Areas

### Driver Performance

- Identified top drivers based on total earnings and number of rides.
- Analyzed average distance covered per ride.
- Examined driver ratings and experience.

### Customer Analysis

- Analyzed customer ride frequency.
- Examined customer ratings.
- Compared usage across different age groups.
- Identified frequent customers with lower average ratings.
- Calculated customer lifetime value.

### Revenue Analysis

- Analyzed total revenue and average fare.
- Compared revenue across ride types.
- Compared revenue across vehicle categories.
- Analyzed monthly revenue trends.

### Demand Analysis

- Identified popular pickup and drop-off routes.
- Analyzed peak demand periods.
- Examined monthly ride trends.
- Compared demand across days of the week.

## Business Insights

The analysis provides insights into:

- Driver earnings and ride performance
- High-value customers based on lifetime spending
- Customer usage patterns across age groups
- Popular pickup and drop-off routes
- Peak demand periods
- Revenue contribution across ride and vehicle categories
- Monthly ride and fare trends

## Project Structure

```text
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
```

## Conclusion

This project demonstrates the use of Python and SQL to analyze a multi-table ride-hailing dataset and extract meaningful business insights.

The analysis covers driver performance, customer behavior, revenue generation, route popularity, and demand patterns, providing a structured view of ride-hailing platform operations.
