/*
## Intended to Answer the Question:
1 What are the top skills based on Salary?
- Looked at the Average Salary for each Skill associated with 'Data Analyst' positions.
- Focused on Roles with specified salaries regardless of location.
- Why? To reveal how diffrent Skills impact Salary levels for 'Data Analysts' and to help identify the most Financially Rewarding Skills to acquire or improve.
*/

SELECT
    job_title_short,
    skills,
    round(avg(salary_year_avg),0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Analyst' 
GROUP BY skills, job_title_short
ORDER BY avg_salary DESC
LIMIT 25;

-- Top Skills for Data Analysts who work remotey based on their Salary.

SELECT
    job_title_short,
    skills,
    round(avg(salary_year_avg),0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE salary_year_avg IS NOT NULL
    AND job_title_short =  'Data Analyst' 
    AND job_work_from_home = TRUE
GROUP BY skills, job_title_short
ORDER BY avg_salary DESC
LIMIT 25;