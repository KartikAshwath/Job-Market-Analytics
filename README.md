# Job-Market-Analytics

This project performs data cleaning and exploratory data analysis (EDA) on a dataset of data analyst job postings.

## Project Overview

The goal of this project is to clean a raw dataset of data analyst job postings, handle missing values, standardize data formats, and then perform basic exploratory data analysis to understand key characteristics of the job market, such as popular job roles, locations, salary ranges, and required skills. The project also outlines steps for further analysis and visualization using Power BI and potential data storage in MySQL.

## Files

*   `data_analyst_jobs.csv`: The raw dataset containing data analyst job postings.
*   `cleaned_data.csv`: The cleaned dataset after processing.

## Data Cleaning Steps

The data cleaning process involves the following steps:

1.  **Loading and Inspecting Data:** Load the raw data and get an initial understanding of its structure and content.
2.  **Handling Duplicates:** Identify and remove duplicate job postings to ensure data integrity.
3.  **Trimming Whitespaces & Standardizing Case:** Clean up text data by removing leading/trailing spaces and standardizing the case of certain columns (e.g., Company, Job Role, Skills).
4.  **Fixing Inconsistent Values:** Correct common inconsistencies in skill names (e.g., PowerBI) and location names.
5.  **Handling Missing Values:** Address missing data in important columns by removing rows or filling missing values with a placeholder.
6.  **Fixing Corrupted Data Types:** Convert the salary range and job posting date columns to appropriate data types, extracting minimum and maximum salary into separate numerical columns.
7.  **Outlier Check:** Identify and handle potential outliers in the salary data.
8.  **Final Integrity Check:** Perform a final review of the cleaned data to ensure its quality.
9.  **Saving Cleaned Data:** Save the processed data to a new CSV file (`cleaned_data.csv`).

## Exploratory Data Analysis (EDA) Steps -Python

The EDA process explores the cleaned data using Python through the following steps:

1.  **Loading the Cleaned Data:** Load the data from the `cleaned_data.csv` file.
2.  **Analyzing Job Roles:** Determine the most frequent job roles in the dataset.
3.  **Analyzing Locations:** Identify the top locations for data analyst jobs.
4.  **Analyzing Salary Data:** Calculate and display the average minimum and maximum salary ranges.
5.  **Analyzing Skills:** Identify the most common skills listed in job postings.
6.  **Analyzing Monthly Trends:** Extract the month from the 'Job Posting Date' and analyze the number of job postings over time to identify any trends.

## MySQL EDA Specifications

The cleaned data can also be loaded into a MySQL database for further analysis using SQL queries. This would allow for more complex querying and integration with other data sources if needed. Potential analyses using MySQL could include:

*   **Aggregating data:** Calculating counts of jobs per city, skill, or job role.
*   **Joining tables:** If other relevant data sources were available (e.g., company information, industry data), they could be joined with the job posting data for richer analysis.
*   **Filtering and sorting:** Easily filter job postings based on specific criteria (e.g., salary range, required skills) and sort results.

## Power BI Visualization Specifications

An interactive Power BI dashboard can be built using the `cleaned_data.csv` to visualize the key insights. The dashboard could include the following pages and visualizations:

*   **Overview Page:**
    *   Total number of job postings.
    *   Key metrics (e.g., average salary).
    *   Charts showing the distribution of job roles and work modes.
*   **Skills Page:**
    *   Bar chart displaying the top required skills.
    *   Word cloud of skills.
    *   Filters to explore skills by job role or location.
*   **Salary Page:**
    *   Visualizations showing the distribution of minimum and maximum salaries.
    *   Charts comparing salary ranges across different experience levels or locations.
    *   Filters for salary range exploration.
*   **Locations Page:**
    *   Map visualization showing job posting density by location.
    *   Bar chart of top cities.
    *   Filters to explore locations by job role or salary range.

## How to Use

1.  Ensure you have the `data_analyst_jobs.csv` file in the same directory as your Python notebook.
2.  Run the code cells in your notebook sequentially to perform data cleaning and Python EDA. This will generate `cleaned_data.csv`.
3.  To perform Power BI visualization, import the `cleaned_data.csv` into Power BI Desktop and build the dashboard as per the specifications above.
4.  To perform MySQL EDA, load the `cleaned_data.csv` into a MySQL database table and execute SQL queries for analysis.

## Dependencies

This project requires the `pandas` library for the Python data cleaning and EDA. You can install it using pip:

```bash
pip install pandas
