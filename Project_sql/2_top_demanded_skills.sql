/*
Target Question:
1 What are the most 'In Demand Skills' for Data science jobs?
- joined job_postings_fact, skills_dim and skills_job_dim using inner join.
- Focused on All job postings.
- Why? To Retrieve the top 5 skills with the highest demand in job market hence providing insights into the most valuable skills for job seekers.
*/

/*
- used the above specifications on 'Data Analyst' Role and Job postings 'Remotely'
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

-- specifically on 'Remote Jobs'

SELECT
    skills,
    count(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_location = 'Anywhere'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;

-- specifically for 'Data Analyst' Role

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
WHERE job_location = 'Anywhere'
    AND job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;

