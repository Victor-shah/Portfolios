-- CASE STUDY 2
-- TABLE 1 - email_events 

create table email_events(
user_id int,
occurred_at varchar(20),
action varchar(50),
user_type int);

show variables like 'secure_file_priv';

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/email_events.csv"
into table email_events
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from email_events;
alter table email_events add column temp_created_at datetime;
update email_events set temp_created_at = STR_TO_DATE(occurred_at, '%d-%m-%Y %H:%i');
alter table email_events Drop column occurred_at;
alter table email_events change column temp_created_at occurred_at datetime;

select * from email_events;

-- TABLE 2 - events  user_id	occurred_at	event_type	event_name	location	device	user_type

create table events(
user_id int,
occurred_at varchar(20),
event_type varchar(20),
event_name varchar(50),
location varchar(20),
device varchar(50),
user_type int);

show variables like 'secure_file_priv';

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/events.csv"
into table events
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from events;
alter table events add column temp_created_at datetime;
update events set temp_created_at = STR_TO_DATE(occurred_at, '%d-%m-%Y %H:%i');
alter table events Drop column occurred_at;
alter table events change column temp_created_at occurred_at datetime;

-- TABLE 3 user_id	created_at	company_id	language	activated_at	state

create table users(
user_id int,
created_at varchar(50),
company_id int,
language varchar(50),
activated_at varchar(50),
state varchar(50));

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/users.csv"
into table users
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from users;

alter table users add column temp_created_at datetime;
update users set temp_created_at = STR_TO_DATE(created_at, '%d-%m-%Y %H:%i');
alter table users  Drop column created_at;
alter table users change column temp_created_at created_at datetime;

alter table users add column temp_created_at datetime;
update users set temp_created_at = STR_TO_DATE(activated_at, '%d-%m-%Y %H:%i');
alter table users  Drop column activated_at;
alter table users change column temp_created_at activated_at datetime;
select * from events;
-- TASK 01 WEEKLY USER ENGAGEMENT (VICTOR SHAH)
SELECT EXTRACT(WEEK FROM occurred_at) AS week_num,
    COUNT(DISTINCT user_id) AS active_users
FROM    events
WHERE
    event_type = 'engagement'
GROUP BY week_num;

-- TASK 02 USER GROWTH ANALYSIS (VICTOR SHAH)
with tab1 as (select extract(year from created_at) as years,
extract(month from created_at) as months,count(*) as freq from users
group by years,months)
select years, months, sum(freq) over(order by years,months) as cum_freq,
 freq as user_growth from tab1;

-- TASK 03 WEEKLY RETENTION ANALYSIS (VICTOR SHAH)
with retention as (
select e.user_id,extract(week from created_at) as create_week_no,
min(case when event_type = 'engagement' then extract(week from occurred_at) end) as login_week
 from users u join events e on u.user_id = e.user_id
 group by e.user_id,create_week_no),
 week_retention as (
 select *, login_week - create_week_no as weeks_retained from retention order by weeks_retained DESC)
 select weeks_retained, count(user_id) as no_of_users from week_retention group by weeks_retained order by weeks_retained;


-- TASK 04 WEEKLY ENGAGEMENT PER DEVICE  (VICTOR SHAH)
select extract(week from occurred_at) as weeks, device, 
count(distinct user_id) as occurrence from events where event_type = 'engagement' 
group by weeks, device order by weeks, device;

-- TASK 05 EMAIL ENGAGEMENT ANALYSIS  (VICTOR SHAH)
SELECT 
    EXTRACT(WEEK FROM occurred_at) AS weeks,
    action,
    COUNT(*) AS email_actions
FROM
    email_events
GROUP BY weeks , action
ORDER BY weeks;

select * from events;




















