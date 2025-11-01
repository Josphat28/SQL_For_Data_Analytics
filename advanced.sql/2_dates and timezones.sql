-- practice problem 1

SELECT
    EXTRACT(MONTH from job_posted_date at TIME ZONE 'UTC' at TIME ZONE 'America/New_York') AS Posted_month,
    COUNT(job_id) AS count_of_jobs_postings,
    round(avg(salary_year_avg),0) AS salary_yearly_avg,
    round(avg(salary_hour_avg),0) AS salary_hourly_avg
FROM job_postings_fact
GROUP BY Posted_month
HAVING EXTRACT(MONTH from job_posted_date at TIME ZONE 'UTC' at TIME ZONE 'America/New_York') >= 6
Order BY Posted_month;


-- pratice problem 2
/* 
- write a query to find out the no. of job postings per month.
*/

SELECT 
   EXTRACT(MONTH from job_posted_date at TIME ZONE 'UTC' at TIME ZONE 'America/New_York') AS posted_month,
   count(job_id) AS count_of_jobs_postings
from job_postings_fact
GROUP BY posted_month
ORDER BY count_of_jobs_postings DESC;

-- practice problem 3

SELECT
    EXTRACT(MONTH from job_posted_date at TIME ZONE 'UTC' at TIME ZONE 'America/New_York') AS posted_month,
    company_dim.name AS company,
    job_postings_fact.company_id
from job_postings_fact
left join company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE job_health_insurance = True
GROUP BY company, posted_month, job_postings_fact.company_id
HAVING (EXTRACT(MONTH from job_posted_date at TIME ZONE 'UTC' at TIME ZONE 'America/New_York') between 4 and 6)
ORDER BY posted_month;

    