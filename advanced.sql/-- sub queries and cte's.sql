-- sub queries and cte's
-- sub_query
SELECT name AS company_name
FROM company_dim
WHERE company_id in (SELECT
company_id
FROM job_postings_fact 
WHERE job_health_insurance = 'true'
);

-- CTE'S

WITH january_jobs_postings as (
    SELECT job_title_short,
           job_location 
    FROM job_postings_fact
    WHERE (job_health_insurance = 'true') AND (EXTRACT(MONTH FROM job_posted_date) = 1)
)
SELECT*
from january_jobs_postings

-- practice problem 1

WITH count_of_job_skills as (
    SELECT
        count(skill_id) as skill_total,
        skill_id
    FROM 
        skills_job_dim
    GROUP BY 
        skill_id)

SELECT 
    skills,
    skills_dim.skill_id,
    skill_total
FROM skills_dim
left join count_of_job_skills on count_of_job_skills.skill_id = skills_dim.skill_id
order BY skill_total desc
limit 10;

-- practice problem 2

SELECT
    company_dim.name,
    job_postings_fact.company_id,
    count(job_id) as count_of_jobs,
    case 
        WHEN count(job_id) BETWEEN 0 and 1500 then 'small'
        WHEN count(job_id) BETWEEN 1501 and 2500 then 'medium'
        WHEN count(job_id) > 2500 then 'large'
        ELSE 'NULL'
    END as company_category    
FROM job_postings_fact
left join company_dim on job_postings_fact.company_id=company_dim.company_id
GROUP BY job_postings_fact.company_id, company_dim.name
order BY count_of_jobs DESC;

-- practice problem 3 from kelly handled together with luke

with remote_jobs as (
    SELECT 
        skill_id,
        count(skill_id) as skill_count
    from skills_job_dim
    inner join job_postings_fact on job_postings_fact.job_id=skills_job_dim.job_id
    WHERE (job_work_from_home = 'true') AND (job_postings_fact.job_title_short = 'Data Analyst')
    GROUP BY skill_id)

SELECT 
    skills,
    skill_count
FROM skills_dim
inner join remote_jobs on remote_jobs.skill_id = skills_dim.skill_id
ORDER BY skill_count desc
limit 5;



