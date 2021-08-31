create table athlete_events_t(SELECT 
    ID,
    Name AS Competitor_Name,
    CASE
        WHEN Sex = 'M' THEN 'Male'
        ELSE 'Female'
    END AS Sex,
    Age,
    CASE
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 25 AND 30 THEN '25-30'
        WHEN Age > 30 THEN 'Over 30'
    END AS Age_Grouping,
    Height,
    Weight,
    NOC AS Nation_Code,
    SUBSTR(Games, 1, 4) AS Year,
   -- SUBSTR(Games, 6) AS Season,
   -- Games,
   -- City,
    Sport,
    Event,
    CASE
        WHEN Medal IS NULL THEN 'Not Registered'
        ELSE Medal
    END AS Medal
FROM
    athlete_events
WHERE
    SUBSTR(Games, 6) = 'Summer');