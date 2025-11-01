/* 
## Targeted to Answer the Question:
1. What are the top paying 'Remote' Data Analyst jobs?
- Identified the top 10 highest paying Data Analyst roles available remotely.
- Focused on job postings with specified salaries (not NULL).
- Why? To Highlight Top Paying Opportunities for Data analyst Positions, offering insights to employers and job seekers.
*/


/*  
## Query Goal:
To Find the top 10 highest-paying remote Data Analyst jobs with valid salary data.
Includes job title, schedule type, salary, and company info for context.
*/

SELECT
    job_title,
    job_location,
    job_schedule_type,
    round(salary_year_avg,0),
    name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_work_from_home = TRUE 
    AND salary_year_avg IS NOT NULL 
    AND job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC
LIMIT 10;


/*  
## Query Goal:
To Compare top 10 highest-paying remote roles across Data Analyst, Data Scientist, and Machine Learning Engineer.
*/

SELECT
    job_title,
    job_location,
    job_schedule_type,
    round(salary_year_avg,0),
    name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_work_from_home = TRUE
    AND salary_year_avg IS NOT NULL
    AND job_title_short IN ('Data Analyst', 'Data Scientist', 'Machine Learning Engineer')
ORDER BY salary_year_avg DESC
LIMIT 10;
