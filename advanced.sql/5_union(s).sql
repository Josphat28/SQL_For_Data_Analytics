-- union(s)
-- union all
select
    job_title_short,
    job_location,
    salary_year_avg
from january_jobs

UNION ALL

select
    job_title_short,
    job_location,
    salary_year_avg
from february_jobs

UNION ALL

select
    job_title_short,
    job_location,
    salary_year_avg
from march_jobs;


-- UNION

select
    job_title_short,
    job_location,
    salary_year_avg
from january_jobs

UNION 

select
    job_title_short,
    job_location,
    salary_year_avg
from february_jobs

UNION 

select
    job_title_short,
    job_location,
    salary_year_avg
from march_jobs;

-- practice problem 1

-- UNION types text and integer cannot be matched
/*
SELECT
    skills_dim.skills,
    skills_dim.type
FROM skills_dim
UNION all
SELECT 
    skills_job_dim.skill_id,
    salary_year_avg
FROM job_postings_fact
LEFT JOIN skills_job_dim on skills_job_dim.job_id = job_postings_fact.job_id
WHERE (EXTRACT(MONTH from job_posted_date) between 1 and 3) and (salary_year_avg > 70000) */

-- practice problem 8 

SELECT
    job_title_short,
    job_location,
    salary_year_avg,
    job_via
FROM(    
SELECT*
FROM january_jobs
UNION ALL
select*
FROM february_jobs
UNION ALL 
select*
FROM march_jobs) AS target1
WHERE (salary_year_avg > 70000) AND (job_title_short = 'Data Analyst')
ORDER BY salary_year_avg desc;