
    SELECT 
    AVG(salary_year_avg) AS avg_salary,
    Count(job_postings_fact.job_id)AS total_job_postings,
    skill_id
    FROM job_postings_fact  
    LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE 
       job_title_short = 'Data Analyst' AND
       job_location = 'Anywhere' AND
       salary_year_avg IS NOT NULL AND
       skill_id IS NOT NULL
    group by skill_id 
    ORDER BY avg_salary DESC
    LIMIT 25 

SELECT 
    avg_salary,
    skills_dim.skills AS skill_name
FROM top_requested_skills
Left JOIN skills_dim ON top_requested_skills.skill_id = skills_dim.skill_id
ORDER BY avg_salary DESC;