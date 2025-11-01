/*
## Intended to Answer the Question: 
1 What skills are required for the Top Paying Data Analyst Jobs?
- Used the previous query top ten highest paying Data Analyst Positions.
- Added specific skills required for those roles.
- Why? To provide a detailed look at which skills are demanded for Each Top Job Positions thus helping job seekers understand which skills to develop that align with top salaries.
- Went further ahead to provide insights about the trend of Skills these Top Job Positions asked for.
*/



WITH top_paying_jobs AS(
    SELECT
        job_id,
        job_title_short,
        round(salary_year_avg,0) AS salary_year_avg,
        name as company_name
    FROM job_postings_fact
    LEFT JOIN company_dim
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_work_from_home = TRUE
        AND salary_year_avg IS NOT NULL
        AND job_title_short = 'Data Analyst'
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.job_id,
    job_title_short,
    salary_year_avg,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY salary_year_avg DESC;