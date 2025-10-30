-- january
CREATE TABLE january_jobs as 
    SELECT* 
    from job_postings_fact 
    WHERE EXTRACT(MONTH from job_posted_date)=1;

-- february
CREATE TABLE february_jobs as 
    SELECT* 
    from job_postings_fact 
    WHERE EXTRACT(MONTH from job_posted_date)=2;

-- march
CREATE TABLE march_jobs as 
    SELECT* 
    from job_postings_fact 
    WHERE EXTRACT(MONTH from job_posted_date)=3;
SELECT*
from january_jobs
LIMIT 10;   