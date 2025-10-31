-- practice problem 1

SELECT
    EXTRACT(MONTH from job_posted_date at TIME ZONE 'UTC' at TIME ZONE 'America/New_York') AS Posted_month,
    avg(salary_year_avg) AS salary_yearly_avg,
    avg(salary_hour_avg) AS salary_hourly_avg,
    COUNT(job_id) AS count_of_jobs_postings
FROM job_postings_fact
WHERE EXTRACT(MONTH from job_posted_date at TIME ZONE 'UTC' at TIME ZONE 'America/New_York') >=6
GROUP BY Posted_month
Order BY count_of_jobs_postings DESC;

-- pratice problem 2
SELECT 
   EXTRACT(MONTH from job_posted_date at TIME ZONE 'UTC' at TIME ZONE 'America/New_York') AS posted_month,
   count(job_id) AS count_of_jobs_postings
from job_postings_fact
GROUP BY posted_month
ORDER BY count_of_jobs_postings;

-- practice problem 3

SELECT
    EXTRACT(MONTH from job_posted_date at TIME ZONE 'UTC' at TIME ZONE 'America/New_York') AS posted_month,
    company_dim.name AS company,
    job_postings_fact.company_id
from job_postings_fact
left join company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE (job_health_insurance ='True') and
(EXTRACT(MONTH from job_posted_date at TIME ZONE 'UTC' at TIME ZONE 'America/New_York') between 4 and 6)
GROUP BY company, EXTRACT(MONTH from job_posted_date at TIME ZONE 'UTC' at TIME ZONE 'America/New_York'), job_postings_fact.company_id
ORDER BY posted_month;

    