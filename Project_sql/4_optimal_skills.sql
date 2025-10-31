/*
Target Question:
1 What are the most optimal skills to learn (i.e High in Demand and High Paying)?
- Identified Skills with High Demand and associated with High Average Salaries for 'Data Analyst' Role.
- Concentrated on 'Remote' jobs with Specified Salaries.
- Why? To Target Skills that offer Job Security (High in Demand) and financial Benefits (High Salaries) offering strategic insights for career developmment in Data Analytics.
*/

WITH top_paying_skills AS (
SELECT
    job_title_short,
    skills_job_dim.skill_id,
    skills,
    round(avg(salary_year_avg),0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Analyst'
    AND job_work_from_home = 'true'
GROUP BY skills, job_title_short,skills_job_dim.skill_id
), 

top_demanded_skills AS ( SELECT
    skills,
    skills_job_dim.skill_id,
    count(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = 'true'
GROUP BY skills,skills_job_dim.skill_id
HAVING (count(skills_job_dim.job_id) > 10)
)

SELECT
    top_paying_skills.skills,
    avg_salary,
    demand_count
FROM top_paying_skills
INNER JOIN top_demanded_skills on top_paying_skills.skill_id = top_demanded_skills.skill_id
order BY demand_count DESC;

-- Wrote the Query above in Concise

SELECT
    skills,
    count(skills_job_dim.job_id) as demand_count,
    round(avg(salary_year_avg),0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = 'true'
GROUP BY skills  
having 
    (count(skills_job_dim.job_id) > 10)
order BY demand_count DESC;   

