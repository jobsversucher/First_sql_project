  with top_paying_skills AS (
    SELECT 
    ROUND(AVG(salary_year_avg),0) AS avg_salary,
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
  ),most_requested_skills AS (
    SELECT 
    Count(job_postings_fact.job_id)AS total_job_postings,
    skill_id
    FROM job_postings_fact  
    LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE 
       job_title_short = 'Data Analyst' AND
       job_location = 'Anywhere'
    group by skill_id
    ORDER BY total_job_postings DESC
  )


  SELECT 
    skills_dim.skills AS skill_name,
    top_paying_skills.avg_salary,
    top_paying_skills.total_job_postings AS total_job_postings_for_top_paying_skills,
    most_requested_skills.total_job_postings AS total_job_postings_for_most_requested_skills
    FROM top_paying_skills
    LEFT JOIN most_requested_skills ON top_paying_skills.skill_id = most_requested_skills.skill_id
    LEFT JOIN skills_dim ON top_paying_skills.skill_id = skills_dim.skill_id
    Where
      top_paying_skills.total_job_postings > 10 
 order by avg_salary DESC   
 LIMIT 25;