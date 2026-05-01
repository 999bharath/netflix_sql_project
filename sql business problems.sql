-- NETFLIX PROJECT

CREATE TABLE netflix100(
show_id VARCHAR(6),
type VARCHAR(10),
title VARCHAR(150),
director VARCHAR(208),
casts VARCHAR(1000),
country VARCHAR(150),
date_added VARCHAR(50),
release_year INT,
rating VARCHAR(50),
duration VARCHAR(15),
listed_in VARCHAR(100),
description VARCHAR(250)
); 

SELECT * FROM netflix100;

SELECT COUNT(*) as total_content
FROM netflix100;

SELECT DISTINCT TYPE
FROM netflix100;


-- 15 Business Problems

-- 1)Count the number of Movies vs TV Shows?
SELECT TYPE, COUNT(*) as total_content
FROM netflix100
GROUP BY TYPE;

-- 2)Find the most common rating for Movies and TV shows?
SELECT TYPE,rating
FROM(
SELECT TYPE,rating,COUNT(*) A
RANK() OVER(PARTITION BY TYPE ORDER BY COUNT(*)DESC) as ranking
FROM netflix100
GROUP BY 1, 2
) as t1
WHERE ranking = 1

-- 3)List all movies released in a specific year(example:-2020)?
SELECT * FROM netflix100
WHERE TYPE = 'Movie'
AND
release_year = 2020

-- 4)Find the top 5 countries with the most content on Netflix?
SELECT UNNEST(STRING_TO_ARRAY(country, ',')) as new_country,
COUNT(show_id) as total_content
FROM netflix100
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

-- 5)Identify the longest movie?
SELECT * FROM netflix100
WHERE TYPE = 'Movie'
AND duration = (SELECT MAX(duration) FROM netflix100)

-- 6)Find content added in the last 5 years?
SELECT * FROM netflix100
WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'

-- 7)Find all the Movies/TV shows by director 'Rajiv Chilaka'?
SELECT * FROM netflix100
WHERE director ILIKE '%Rajiv Chilaka%'

-- 8)List all TV shows with more than 5 seasons?
SELECT * FROM netflix100
WHERE TYPE = 'TV Show'
AND SPLIT_PART(duration, ' ', 1)::numeric > 5

-- 9)Count the number of content items in each genre?
SELECT UNNEST(STRING_TO_ARRAY(listed_in, ',')) as genre,
COUNT(show_id) as total_content
FROM netflix100
GROUP BY 1

-- 10)Find each year and the average numbers of content release by India on netflix and return top 5 year with highest avg content release?
SELECT EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) as year,
COUNT(*) as yearly_content,
ROUND(
COUNT(*)::numeric/(SELECT COUNT(*) FROM netflix100 WHERE country = 'India')::numeric * 100
,2)as avg_content_per_year
FROM netflix100
WHERE country = 'India'
GROUP BY 1

-- 11)List all movies that are documentaries
SELECT * FROM netflix100
WHERE listed_in ILIKE '%documentaries%'

-- 12)Find all content without a director
SELECT * FROM netflix100
WHERE director IS NULL

-- 13)Find how many movies actor 'Salman Khan' appeared in last 10 years?
SELECT * FROM netflix100
WHERE casts ILIKE '%Salman Khan%'
AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10

-- 14)Find the top 10 actors who have appeared in the highest number of movies produced in India?
SELECT UNNEST(STRING_TO_ARRAY(casts, ',')) as actors,
COUNT(*) as total_content
FROM netflix100
WHERE country ILIKE '%india'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10

-- 15)Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field. Label content containing these keywords as 'Bad' and all other content as 'Good'. count how many items fall into each category?
SELECT 
    COUNT(CASE 
            WHEN description ILIKE '%kill%' 
              OR description ILIKE '%violence%' 
            THEN 1 
         END) AS Bad_Content,
         
    COUNT(CASE 
            WHEN description NOT ILIKE '%kill%' 
              AND description NOT ILIKE '%violence%' 
            THEN 1 
         END) AS Good_Content
FROM netflix100;