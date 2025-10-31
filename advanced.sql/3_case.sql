-- case
SELECT 
    job_title_short,
    job_location,
    CASE
        WHEN job_location ='Nairobi, Kenya' then 'LOCAl'
        WHEN job_location ='Anywhere' THEN 'remote'
        ELSE 'On-site'
    END AS job_location_category,
    count(job_id) AS count_of_jobs
FROM job_postings_fact 
WHERE job_title_short='Data Analyst'
GROUP BY job_title_short, job_location, job_location_category;

SELECT 
    job_title_short,
    job_location,
    CASE
        WHEN salary_year_avg BETWEEN 0 AND 40000 THEN 'Low'
        WHEN salary_year_avg BETWEEN 50000 AND 100000 THEN 'Standard'
        WHEN salary_year_avg >= 100000 THEN 'High'
        WHEN  salary_year_avg = '0' THEN 'NULL'
        ELSE 'N/A'
    END AS salary_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC;       