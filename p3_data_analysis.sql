SELECT 
    entity_id,
    AVG(number_rabies) AS avg_rabies,
    MIN(number_rabies) AS min_rabies,
    MAX(number_rabies) AS max_rabies,
    SUM(number_rabies) AS sum_rabies
FROM cases
WHERE number_rabies != '' AND number_rabies IS NOT NULL
GROUP BY entity_id
ORDER BY avg_rabies DESC
LIMIT 10;