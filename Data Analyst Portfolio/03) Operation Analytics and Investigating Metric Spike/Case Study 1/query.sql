create database Project;
show databases;
use Project;

-- CASE STUDY 1
-- TABLE 1 - JOB DATA
create table Job_Data(
ds varchar(50),
job_id int,
actor_id int,
event varchar(50),
language varchar(50),
time_spent int,
org varchar(20));

show variables like 'secure_file_priv';

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/job_data.csv"
into table Job_Data
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from Job_Data;
alter table Job_Data add column temp_created_at datetime;
update Job_Data set temp_created_at = STR_TO_DATE(ds, '%m/%d/%Y ');
alter table Job_Data Drop column ds;
alter table Job_Data change column temp_created_at ds datetime;


-- CASE STUDY 1: JOB DATA ANALYSIS

-- TASK 01  JOBS REVIEWED OVER TIME  (VICTOR SHAH)
SELECT
    COUNT(job_id) AS number_of_jobs,
    ROUND(SUM(time_spent) / 3600, 3) AS hours_per_day
FROM
    Job_Data
WHERE
    ds BETWEEN '2020-11-01' AND '2020-11-30'
GROUP BY ds;

-- TASK 2: THROUGHPUT ANALYSIS (VICTOR SHAH)
SELECT
AVG(number_of_events) OVER(ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS 7_day_rolling_avg
FROM
(SELECT
    COUNT(DISTINCT event) AS number_of_events
FROM
    Job_Data
GROUP BY ds) AS sub;

-- TASK 03 LANGUAGE SHARE ANALYSIS  (VICTOR SHAH)
SELECT language,
    ROUND((COUNT(language) / (SELECT COUNT(*) FROM job_data)) * 100,2) 
			AS language_share
FROM    job_data
WHERE    ds > (SELECT 
            MAX(ds) - INTERVAL 30 DAY
        FROM            job_data)
GROUP BY language;

-- TASK 04 DUPLICATE ROWS DETECTION  (VICTOR SHAH)
SELECT 
    job_id, COUNT(*)
FROM
    job_data
GROUP BY job_id , actor_id , event , language , time_spent , org , ds
HAVING COUNT(*) > 1;
Select * from job_data;












