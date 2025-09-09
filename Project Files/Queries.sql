-- =======================================================
-- PART 1: BASIC DATA ANALYSIS & EXPLORATION
-- =======================================================
-- 1. Find the total number of job postings.
SELECT COUNT(*) AS total_postings FROM job_postings;

-- 2. Find the average minimum and maximum salary across all job postings.
SELECT
    AVG(min_salary_lpa) AS avg_min_salary,
    AVG(max_salary_lpa) AS avg_max_salary
FROM job_postings;

-- 3. Count the number of job postings for each work mode.
SELECT work_mode, COUNT(*) AS number_of_jobs
FROM job_postings
GROUP BY work_mode
ORDER BY number_of_jobs DESC;

-- 4. Find the top 10 most common locations for job postings.
SELECT location, COUNT(*) AS number_of_jobs
FROM job_postings
GROUP BY location
ORDER BY number_of_jobs DESC
LIMIT 10;

-- =======================================================
-- PART 2: SKILL DEMAND ANALYSIS
-- =======================================================
-- 1. Count the number of job postings that mention 'python'.
-- The '%' wildcard matches any sequence of characters, ensuring we find 'python'
-- even if it's in the middle of a string of skills.
SELECT
    COUNT(*) AS python_jobs
FROM job_postings
WHERE skills LIKE '%python%';

-- 2. Count the number of job postings that mention 'sql'.
SELECT
    COUNT(*) AS sql_jobs
FROM job_postings
WHERE skills LIKE '%sql%';

-- 3. Count the number of job postings that require both 'python' AND 'sql'.
SELECT
    COUNT(*) AS python_and_sql_jobs
FROM job_postings
WHERE skills LIKE '%python%' AND skills LIKE '%sql%';

-- =======================================================
-- PART 3: JOINING AND AGGREGATING (assumes you have two tables/files)
-- NOTE: The following queries assume you have a 'data_analyst_jobs' table
-- which has columns like "Job Role" and a 'cleaned_data' table
-- with columns like "Min Salary (LPA)" and "Max Salary (LPA)".
-- =======================================================

-- 1. Join the two datasets and calculate the average salary for each job role.
-- This uses an INNER JOIN, which only returns rows with a match in both tables.
SELECT
    T1."Job Role",
    AVG(T2."Min Salary (LPA)") AS avg_min_salary,
    AVG(T2."Max Salary (LPA)") AS avg_max_salary
FROM data_analyst_jobs AS T1
INNER JOIN cleaned_data AS T2
    ON T1."Job Role" = T2."Job Role"
GROUP BY T1."Job Role"
ORDER BY avg_max_salary DESC;

-- 2. Find the average salary for 'Data Analyst' and 'Senior Data Analyst' by joining.
SELECT
    T1."Job Role",
    AVG(T2."Min Salary (LPA)") AS avg_min_salary,
    AVG(T2."Max Salary (LPA)") AS avg_max_salary
FROM data_analyst_jobs AS T1
INNER JOIN cleaned_data AS T2
    ON T1."Job Role" = T2."Job Role"
WHERE T1."Job Role" IN ('Data Analyst', 'Senior Data Analyst')
GROUP BY T1."Job Role"
ORDER BY avg_max_salary DESC;

-- =======================================================
-- PART 4: LOCATION AND WORK MODE SALARY ANALYSIS
-- =======================================================
-- 1. Compare average salaries for 'Data Analyst' across different work modes.
SELECT
    T1."Work Mode",
    AVG(T2."Min Salary (LPA)") AS avg_min_salary,
    AVG(T2."Max Salary (LPA)") AS avg_max_salary
FROM data_analyst_jobs AS T1
INNER JOIN cleaned_data AS T2
    ON T1."Job Role" = T2."Job Role"
WHERE T1."Job Role" = 'Data Analyst'
GROUP BY T1."Work Mode"
ORDER BY avg_max_salary DESC;

-- 2. Find the average salary for 'Data Analyst' in the top 5 most common locations.
SELECT
    T1.Location,
    AVG(T2."Min Salary (LPA)") AS avg_min_salary,
    AVG(T2."Max Salary (LPA)") AS avg_max_salary
FROM data_analyst_jobs AS T1
INNER JOIN cleaned_data AS T2
    ON T1."Job Role" = T2."Job Role"
WHERE T1."Job Role" = 'Data Analyst'
GROUP BY T1.Location
ORDER BY avg_max_salary DESC
LIMIT 5;

-- =======================================================
-- PART 5: ADVANCED INSIGHTS AND TRENDS
-- =======================================================

-- 1. Average salary by experience level.
-- This helps you see if salaries truly scale with experience.
SELECT
    "Experience Level",
    AVG(T2."Min Salary (LPA)") AS avg_min_salary,
    AVG(T2."Max Salary (LPA)") AS avg_max_salary
FROM data_analyst_jobs AS T1
INNER JOIN cleaned_data AS T2
    ON T1."Job Role" = T2."Job Role"
GROUP BY "Experience Level"
ORDER BY avg_max_salary DESC;

-- 2. Top 10 companies with the highest average salary ranges.
-- This can identify which companies are the most lucrative.
SELECT
    Company,
    AVG(T2."Min Salary (LPA)") AS avg_min_salary,
    AVG(T2."Max Salary (LPA)") AS avg_max_salary
FROM data_analyst_jobs AS T1
INNER JOIN cleaned_data AS T2
    ON T1.Company = T2.Company
GROUP BY Company
ORDER BY avg_max_salary DESC
LIMIT 10;

-- 3. Number of job postings by year.
-- This query helps you spot long-term trends in job market growth.
SELECT
    STRFTIME('%Y', "Job Posting Date") AS posting_year,
    COUNT(*) AS number_of_jobs
FROM data_analyst_jobs
WHERE "Job Posting Date" IS NOT NULL
GROUP BY posting_year
ORDER BY posting_year DESC;
