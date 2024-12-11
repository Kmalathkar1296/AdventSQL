SELECT 
    top 1
    ROUND(AVG(trees_harvested) OVER (
        PARTITION BY field_name, harvest_year 
        ORDER BY 
            CASE season 
                WHEN 'Spring' THEN 1 
                WHEN 'Summer' THEN 2 
                WHEN 'Fall' THEN 3 
                WHEN 'Winter' THEN 4 
            END 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2) AS three_season_moving_avg
FROM TreeHarvests
ORDER BY three_season_moving_avg DESC;