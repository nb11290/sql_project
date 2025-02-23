/*
What are the topskills based on salary?
    - look at average salary associated with each skills for Data Analyst
    - focus on roles with sepcified salaries, regardless of location
    - Why? Reveals how different skills impact salary levels and 
    helps to identify most financially rewarding skills to acquire
*/

SELECT 
    skills,
    ROUND(avg(salary_year_avg),2) AS avg_salary
FROM job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25