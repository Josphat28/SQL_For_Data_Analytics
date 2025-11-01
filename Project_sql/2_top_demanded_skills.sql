/*
## Intended to Answer the Question:
1 What are the most 'In Demand Skills' for Data Analyst jobs?
- joined job_postings_fact, skills_dim and skills_job_dim using INNER JOIN.
- Focused on All job postings.
- Why? To Retrieve the top 5 skills with the highest demand in job market hence providing insights into the most valuable skills for job seekers.
- Went further ahead and applied the above specifications for All Data roles.
*/

-- Data Analysts

SELECT
    skills,
    count(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;

-- Data Analyst Remote Jobs

SELECT
    skills,
    count(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_work_from_home = TRUE
    AND job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;


/*
- Used the above specifications on All Data Roles.
*/

SELECT
    skills,
    count(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;

-- 'Remote Jobs'

SELECT
    skills,
    count(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_work_from_home = TRUE
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;