# Data Analyst Job Market Analysis — SQL Project

## 📌 Introduction

This project is a SQL-based analysis of the Data Analyst job market. It explores job postings to uncover insights about salary levels, in-demand skills, and the relationship between specific skills and earning potential.

The goal of this project is to demonstrate practical SQL skills by answering real-world business questions using a PostgreSQL database.

---

## 🎯 Project Objectives

The main objectives of this project are to:

- Identify the top 10 highest-paying Data Analyst job opportunities.
- Determine the top 25 most in-demand skills for Data Analysts.
- Analyze which specific skills are associated with the highest-paying jobs.
- Find the highest-paid skills based on average salary.
- Combine demand and salary data to identify optimal skills for a Data Analyst to learn.

---

## 🛠️ SQL Skills & Techniques Demonstrated

Throughout this project, I practiced and applied several SQL techniques, including:

- **Common Table Expressions (CTEs):** Used to break down complex queries into readable and manageable steps.
- **Joins:** Used `LEFT JOIN` and `INNER JOIN` to combine data from fact and dimension tables.
- **Aggregate Functions:** Used functions such as `COUNT()` and `AVG()` to summarize and analyze data.
- **Filtering & Sorting:** Used `WHERE`, `IS NOT NULL`, `ORDER BY`, and `LIMIT` to filter and organize results.
- **Grouping:** Used `GROUP BY` for categorical and aggregated analysis.
- **Data Type Casting:** Used `::DATE` for date formatting and data type conversion.
- **Subqueries and CTEs:** Used to organize multi-step analysis and make queries easier to understand.

---

## 📂 Project Files & Analysis

### 1. `top_paying_jobs.sql`

**Business Question:**  
> What are the top 10 highest-paying Data Analyst jobs?

**Methodology:**

- Selects data from `job_postings_fact`.
- Uses a `LEFT JOIN` with `company_dim` to retrieve company information.
- Filters for Data Analyst positions.
- Filters for jobs located `Anywhere`.
- Excludes records where `salary_year_avg` is `NULL`.
- Sorts the results by `salary_year_avg` in descending order.
- Limits the results to the top 10 jobs.

**Output:**

- Job title
- Job location
- Company name
- Posting date
- Average yearly salary

---

### 2. `top_25_most_demanded_skills.sql`

**Business Question:**  
> What are the top 25 most in-demand skills for Data Analysts?

**Methodology:**

- Uses a CTE named `top_requested_skills`.
- Counts the number of job postings associated with each skill.
- Groups the results by `skill_id`.
- Joins `job_postings_fact` with `skills_job_dim`.
- Filters for Data Analyst positions.
- Filters for jobs located `Anywhere`.
- Joins the results with `skills_dim` to retrieve skill names.
- Orders the results by the number of job postings.
- Limits the results to the top 25 skills.

**Output:**

- Skill name
- Total number of job postings

---

### 3. `top_paying_skills.sql`

**Business Question:**  
> Which skills are associated with the highest-paying Data Analyst jobs?

**Methodology:**

- Uses a CTE named `top_paying_jobs`.
- Identifies the highest-paying Data Analyst jobs.
- Filters for records where `salary_year_avg` is not `NULL`.
- Joins the results with `skills_job_dim` to identify the skills associated with these jobs.
- Joins with `skills_dim` to retrieve the skill names.
- Orders the results by salary in descending order.

**Output:**

- Skill name
- Average yearly salary

---

### 4. `highest_paid_skills.sql`

**Business Question:**  
> What are the highest-paid skills for Data Analysts?

**Methodology:**

- Uses a CTE to calculate the average salary and number of job postings for each skill.
- Filters for Data Analyst positions.
- Filters for jobs located `Anywhere`.
- Excludes records where `salary_year_avg` or `skill_id` is `NULL`.
- Groups the results by `skill_id`.
- Orders the results by average salary in descending order.
- Limits the results to the top 25 skills.
- Joins with `skills_dim` to retrieve skill names.

**Output:**

- Skill name
- Average yearly salary

---

### 5. `optimal_skills_for_data_analyst.sql`

**Business Question:**  
> Which skills offer the best combination of high demand and high salary?

**Methodology:**

- Uses a CTE to calculate the number of job postings for each skill.
- Uses another CTE to calculate the average salary associated with each skill.
- Combines the two datasets using `skill_id`.
- Filters for skills with more than 10 job postings to provide a more meaningful comparison.
- Orders the results by average salary in descending order.
- Limits the results to the top 25 skills.

**Output:**

- Skill name
- Average yearly salary
- Total number of job postings

---

## 💡 Key Insights

The analysis provides several insights into the Data Analyst job market:

- **High Demand vs. High Salary:** The most frequently requested skills are not necessarily the skills associated with the highest salaries.
- **Skill Value:** Combining salary and demand data provides a better way to identify skills that are both valuable and frequently requested.
- **Job Opportunities:** The highest-paying job analysis provides an overview of the salary levels offered for Data Analyst positions.
- **Market-Oriented Learning:** The analysis can help identify technical skills that may be useful for someone preparing for a career in Data Analytics.

---

## 🧰 Tools Used

- **PostgreSQL** — Database and SQL analysis
- **SQL** — Data querying and analysis
- **Visual Studio Code** — Code editor
- **Git** — Version control
- **GitHub** — Project hosting and portfolio

---

## 📁 Project Structure

```text
sql_project/
│
├── top_paying_jobs.sql
├── top_25_most_demanded_skills.sql
├── top_paying_skills.sql
├── highest_paid_skills.sql
├── optimal_skills_for_data_analyst.sql
│
└── README.md