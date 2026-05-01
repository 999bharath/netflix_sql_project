# Netflix SQL Data Analysis Project:-

## Project Overview:-

This project demonstrates my ability to analyze real-world data using SQL. I worked on a Netflix dataset and solved multiple business-related questions to extract meaningful insights. As a fresher, this project highlights my understanding of data analysis, data cleaning, and SQL problem-solving.

1)Dataset Description:-
The dataset contains information about Netflix Movies and TV Shows, including:
* Content type (Movie / TV Show)
* Title, Director, Cast
* Country of production
* Date added to Netflix
* Release year
* Rating and duration
* Genre (listed_in)
* Description

2)Tools & Technologies:-
* SQL (PostgreSQL)
* pgAdmin
* CSV Dataset

3)Business Problems Solved:-

1.Content Analysis:-
* Counted number of Movies vs TV Shows.
* Identified the most common rating for each type.
  
2.Filtering & Conditions:-
* Retrieved movies released in a specific year (e.g., 2020).
* Found all content by a specific director.
* Listed TV shows with more than 5 seasons.
  
3.Data Transformation:-
* Split columns with multiple values (country, genres, cast).
* Used functions like `STRING_TO_ARRAY`, `UNNEST`, and `TRIM`.
  
4.Aggregation & Insights:-
* Top 5 countries with the most content.
* Genre-wise content distribution.
* Top 10 actors in Indian content.
  
5.Date-Based Analysis:-
* Content added in the last 5 years.
* Year-wise trend of content from India.
  
6.Data Cleaning:-
* Handled NULL and missing values (e.g., missing directors).
* Converted text data into usable formats (dates, numbers).
  
7.Categorized Contents into two categories:-
* Categorized content into Good_Content and Bad_Content.
* Used `CASE` statements with keyword-based filtering on descriptions.

4)Key SQL Concepts Used:-

* `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`
* `CASE WHEN`
* Window functions (`RANK()`)
* String functions (`ILIKE`, `SPLIT_PART`)
* Array functions (`STRING_TO_ARRAY`, `UNNEST`)
* Date functions (`TO_DATE`, `EXTRACT`, `CURRENT_DATE`)

5)Key Insights:-

* Movies dominate the dataset compared to TV Shows.
* A few countries contribute a large portion of content.
* Content addition has increased in recent years.
* Most content falls under “Good_Content” based on keyword classification.

6)Learning Outcomes:-

* Improved SQL querying and data analysis skills.
* Learned to handle real-world messy data.
* Gained experience in solving business problems using SQL.
* Built confidence in explaining data insights.


