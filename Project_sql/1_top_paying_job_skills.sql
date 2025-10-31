/*
Target Question: 
1 What skills are required for the top paying Data science jobs?
- Used the previous query top ten highest paying Data science jobs.
- Added specific skills required for those roles.
- Why? To provide a detailed look at which skills are demanded for which top paying job thus helping job seekers understand which skills to develop that align with top salaries.
*/

/*
Used the above specifications on 'Data Analyst' role.
*/

WITH top_paying_jobs AS(
    SELECT
        job_id,
        job_title_short,
        salary_year_avg,
        name as company_name
    FROM job_postings_fact
    LEFT JOIN company_dim
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY salary_year_avg DESC;

-- spefically for 'Data Analyst' Role.

WITH top_paying_jobs AS(
    SELECT
        job_id,
        job_title_short,
        salary_year_avg,
        name as company_name
    FROM job_postings_fact
    LEFT JOIN company_dim
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
        AND job_title_short = 'Data Analyst'
    ORDER BY salary_year_avg DESC
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY salary_year_avg DESC;