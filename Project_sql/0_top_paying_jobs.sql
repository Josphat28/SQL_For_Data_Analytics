/* 
## Target Question:
1. What are the top paying 'Remote' Data science jobs?
- Identified the top 10 highest paying Data science roles available remotely.
- Focused on job postings with specified salaries (not NULL).
- Why? To Highlight Top Paying Opportunities for Data Science Roles, offering insights to employers and job seekers.
*/

/*
Used the above specifications on for 'Data Analyst'Role.
*/

SELECT
    job_title,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    name as company_name
FROM job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC;

-- specifically for Data Analyst Role.

SELECT
    job_title,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    name as company_name
FROM job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC;