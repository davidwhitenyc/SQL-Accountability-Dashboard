-----------------------------------------------------------------------------------------------------
--run this combined script to REFRESH ATTENDANCE DATA of the  HLCS Data & Accountablitiy Dashboard---
-----------------------------------------------------------------------------------------------------
--[step 02.1] pull sy 2021–22 daily attendance from harlemlinksy21_22 project
CREATE OR REPLACE TABLE
`harlemlink-accountability.student_attendance.daily_attendance_sy21_22` AS

SELECT
student_number AS osis,
date,
present_days

FROM `harlemlinksy2122.datasources.v2_daily_attendance_report` 


WHERE student_number IS NOT NULL ;



--[step 02.2] import wide-format sy 2020–21 attendance
SELECT *
FROM
`harlemlink-accountability.student_attendance.wide_format_daily_attendance_sy20_21`  ;



--[step 02.3] unpivot sy 2020–21 attendance data
CREATE OR REPLACE TABLE 
`harlemlink-accountability.unpivots.hlcs_date_format_sy20_21_attendance` AS

SELECT
  osis,
  hlcs_date,
  present_days
FROM
  `harlemlink-accountability.student_attendance.wide_format_daily_attendance_sy20_21` UNPIVOT(present_days FOR hlcs_date IN (hlcs_2020_09_02,
    hlcs_2020_09_03,
hlcs_2020_09_04,
hlcs_2020_09_08,
hlcs_2020_09_09,
hlcs_2020_09_10,
hlcs_2020_09_11,
hlcs_2020_09_14,
hlcs_2020_09_15,
hlcs_2020_09_16,
hlcs_2020_09_17,
hlcs_2020_09_18,
hlcs_2020_09_21,
hlcs_2020_09_22,
hlcs_2020_09_23,
hlcs_2020_09_24,
hlcs_2020_09_25,
hlcs_2020_09_29,
hlcs_2020_09_30,
hlcs_2020_10_01,
hlcs_2020_10_02,
hlcs_2020_10_05,
hlcs_2020_10_06,
hlcs_2020_10_07,
hlcs_2020_10_08,
hlcs_2020_10_09,
hlcs_2020_10_13,
hlcs_2020_10_14,
hlcs_2020_10_15,
hlcs_2020_10_16,
hlcs_2020_10_19,
hlcs_2020_10_20,
hlcs_2020_10_21,
hlcs_2020_10_22,
hlcs_2020_10_23,
hlcs_2020_10_26,
hlcs_2020_10_27,
hlcs_2020_10_28,
hlcs_2020_10_29,
hlcs_2020_10_30,
hlcs_2020_11_02,
hlcs_2020_11_04,
hlcs_2020_11_05,
hlcs_2020_11_06,
hlcs_2020_11_09,
hlcs_2020_11_10,
hlcs_2020_11_12,
hlcs_2020_11_13,
hlcs_2020_11_16,
hlcs_2020_11_17,
hlcs_2020_11_18,
hlcs_2020_11_19,
hlcs_2020_11_20,
hlcs_2020_11_23,
hlcs_2020_11_24,
hlcs_2020_11_25,
hlcs_2020_11_30,
hlcs_2020_12_02,
hlcs_2020_12_03,
hlcs_2020_12_04,
hlcs_2020_12_07,
hlcs_2020_12_08,
hlcs_2020_12_09,
hlcs_2020_12_10,
hlcs_2020_12_11,
hlcs_2020_12_14,
hlcs_2020_12_15,
hlcs_2020_12_16,
hlcs_2020_12_17,
hlcs_2020_12_18,
hlcs_2020_12_21,
hlcs_2020_12_22,
hlcs_2020_12_23,
hlcs_2021_01_04,
hlcs_2021_01_05,
hlcs_2021_01_06,
hlcs_2021_01_07,
hlcs_2021_01_08,
hlcs_2021_01_11,
hlcs_2021_01_12,
hlcs_2021_01_13,
hlcs_2021_01_14,
hlcs_2021_01_15,
hlcs_2021_01_19,
hlcs_2021_01_20,
hlcs_2021_01_21,
hlcs_2021_01_22,
hlcs_2021_01_25,
hlcs_2021_01_26,
hlcs_2021_01_27,
hlcs_2021_01_28,
hlcs_2021_01_29,
hlcs_2021_02_01,
hlcs_2021_02_02,
hlcs_2021_02_03,
hlcs_2021_02_04,
hlcs_2021_02_05,
hlcs_2021_02_08,
hlcs_2021_02_09,
hlcs_2021_02_10,
hlcs_2021_02_11,
hlcs_2021_02_22,
hlcs_2021_02_23,
hlcs_2021_02_24,
hlcs_2021_02_25,
hlcs_2021_02_26,
hlcs_2021_03_01,
hlcs_2021_03_02,
hlcs_2021_03_03,
hlcs_2021_03_04,
hlcs_2021_03_05,
hlcs_2021_03_08,
hlcs_2021_03_09,
hlcs_2021_03_10,
hlcs_2021_03_11,
hlcs_2021_03_12,
hlcs_2021_03_15,
hlcs_2021_03_17,
hlcs_2021_03_18,
hlcs_2021_03_19,
hlcs_2021_03_22,
hlcs_2021_03_23,
hlcs_2021_03_24,
hlcs_2021_03_25,
hlcs_2021_03_26,
hlcs_2021_04_05,
hlcs_2021_04_06,
hlcs_2021_04_07,
hlcs_2021_04_08,
hlcs_2021_04_09,
hlcs_2021_04_12,
hlcs_2021_04_13,
hlcs_2021_04_14,
hlcs_2021_04_15,
hlcs_2021_04_16,
hlcs_2021_04_19,
hlcs_2021_04_20,
hlcs_2021_04_21,
hlcs_2021_04_22,
hlcs_2021_04_23,
hlcs_2021_04_26,
hlcs_2021_04_27,
hlcs_2021_04_28,
hlcs_2021_04_29,
hlcs_2021_04_30,
hlcs_2021_05_03,
hlcs_2021_05_04,
hlcs_2021_05_05,
hlcs_2021_05_06,
hlcs_2021_05_07,
hlcs_2021_05_10,
hlcs_2021_05_11,
hlcs_2021_05_12,
hlcs_2021_05_14,
hlcs_2021_05_17,
hlcs_2021_05_18,
hlcs_2021_05_19,
hlcs_2021_05_20,
hlcs_2021_05_21,
hlcs_2021_05_24,
hlcs_2021_05_25,
hlcs_2021_05_26,
hlcs_2021_05_27,
hlcs_2021_05_28,
hlcs_2021_06_01,
hlcs_2021_06_02,
hlcs_2021_06_03,
hlcs_2021_06_04,
hlcs_2021_06_07,
hlcs_2021_06_09,
hlcs_2021_06_10,
hlcs_2021_06_11,
hlcs_2021_06_14,
hlcs_2021_06_15,
hlcs_2021_06_16,
hlcs_2021_06_17,
hlcs_2021_06_18,
hlcs_2021_06_21,
hlcs_2021_06_22

  )) ;







--[step 02.4] import wide-format sy 2019–20 post-closure attendance
SELECT *
FROM
`harlemlink-accountability.student_attendance.wide_format_daily_attendance_sy20_21`  ;



--[step 02.5] unpivot sy 2019–20 post-closure attendance data
CREATE OR REPLACE TABLE 
`harlemlink-accountability.unpivots.hlcs_date_format_sy19_20_post_closure_attendance` AS

SELECT
  osis,
  hlcs_date,
  present_days
FROM
  `harlemlink-accountability.student_attendance.wide_format_daily_attendance_sy19_20_post_closure` UNPIVOT(present_days FOR hlcs_date IN (hlcs_2020_03_23,
    hlcs_2020_03_24,
hlcs_2020_03_25,
hlcs_2020_03_26,
hlcs_2020_03_27,
hlcs_2020_03_30,
hlcs_2020_03_31,
hlcs_2020_04_01,
hlcs_2020_04_02,
hlcs_2020_04_03,
hlcs_2020_04_06,
hlcs_2020_04_07,
hlcs_2020_04_08,
hlcs_2020_04_20,
hlcs_2020_04_21,
hlcs_2020_04_22,
hlcs_2020_04_23,
hlcs_2020_04_24,
hlcs_2020_04_27,
hlcs_2020_04_28,
hlcs_2020_04_29,
hlcs_2020_04_30,
hlcs_2020_05_01,
hlcs_2020_05_04,
hlcs_2020_05_05,
hlcs_2020_05_06,
hlcs_2020_05_07,
hlcs_2020_05_08,
hlcs_2020_05_11,
hlcs_2020_05_12,
hlcs_2020_05_13,
hlcs_2020_05_14,
hlcs_2020_05_15,
hlcs_2020_05_18,
hlcs_2020_05_19,
hlcs_2020_05_20,
hlcs_2020_05_21,
hlcs_2020_05_22,
hlcs_2020_05_26,
hlcs_2020_05_27,
hlcs_2020_05_28,
hlcs_2020_05_29,
hlcs_2020_06_01,
hlcs_2020_06_02,
hlcs_2020_06_03,
hlcs_2020_06_04,
hlcs_2020_06_08,
hlcs_2020_06_09,
hlcs_2020_06_10,
hlcs_2020_06_11,
hlcs_2020_06_15,
hlcs_2020_06_16,
hlcs_2020_06_17,
hlcs_2020_06_18

  )) ; 



--[step 02.6] join dates from school calendar to sy 2020–21 attendance data
CREATE OR REPLACE TABLE 
`harlemlink-accountability.student_attendance.daily_attendance_sy20_21` AS

SELECT
osis,
calendar.date,
present_days

FROM
`harlemlink-accountability.unpivots.hlcs_date_format_sy20_21_attendance` granular 

LEFT JOIN 
`harlemlink-accountability.student_attendance.school_calendar_days` calendar
ON granular.hlcs_date = calendar.hlcs_date ; 





--[step 02.7] join dates from school calendar to sy 2019–20 post-closure attendance data
CREATE OR REPLACE TABLE 
`harlemlink-accountability.student_attendance.daily_attendance_sy19_20_post_closure` AS

SELECT
osis,
calendar.date,
present_days

FROM
`harlemlink-accountability.unpivots.hlcs_date_format_sy19_20_post_closure_attendance` granular 

LEFT JOIN 
`harlemlink-accountability.student_attendance.school_calendar_days` calendar
ON granular.hlcs_date = calendar.hlcs_date ; 





--[step 02.8] import sy 2019–20 pre-closure attendance
SELECT *
FROM
`harlemlink-accountability.student_attendance.daily_attendance_sy19_20_pre_closure` ;





--[step 02.9] import sy 2017–18 and sy 2018–19 granular attendance
SELECT *
FROM
`harlemlink-accountability.student_attendance.daily_attendance_sy17_18` ;

SELECT *
FROM
`harlemlink-accountability.student_attendance.daily_attendance_sy18_19` ;





--[step 02.10] combine all granular daily attendance
CREATE OR REPLACE TABLE
`harlemlink-accountability.unions.all_attendance` AS

SELECT 
osis,
date,
present_days
FROM
`harlemlink-accountability.student_attendance.daily_attendance_sy17_18` 

UNION ALL
SELECT 
osis,
date,
present_days
FROM
`harlemlink-accountability.student_attendance.daily_attendance_sy18_19` 

UNION ALL
SELECT 
osis,
date,
present_days
FROM
`harlemlink-accountability.student_attendance.daily_attendance_sy19_20_pre_closure`

UNION ALL
SELECT 
osis,
date,
present_days
FROM
`harlemlink-accountability.student_attendance.daily_attendance_sy19_20_post_closure`

UNION ALL
SELECT 
osis,
date,
present_days
FROM
`harlemlink-accountability.student_attendance.daily_attendance_sy20_21`

UNION ALL
SELECT 
osis,
date,
present_days
FROM
`harlemlink-accountability.student_attendance.daily_attendance_sy21_22` ;





--[step 02.11] join student information to granular daily attendance to create attendance datasource
CREATE OR REPLACE TABLE
`harlemlink-accountability.datasources.attendance` AS

SELECT
--pull columns from combined granular attendance (alias: granular)
granular.osis AS granular_osis,
granular.date AS granular_date,
granular.present_days,


--pull columns from school calendar days (alias: days)
days.academic_year AS days_academic_year,
days.term,
days.date AS days_date,
days.day_of_school_year,
days.hlcs_date,
days.num_iso_month,
days.iso_month,
days.num_iso_day,
days.iso_day,


--pull columns from students datasource (alias: demographics)
demographics.osis AS demographics_osis,
demographics.last_first,
demographics.grade_level,
demographics.ic_grade_level,
demographics.class,
demographics.student_lastName,
demographics.student_firstName,
demographics.sped,
demographics.enl,
demographics.ais,
demographics.holdovers,
demographics.ethnic_code,
demographics.rdgs_race,
demographics.zip_code,
demographics.zip_code_text,
demographics.neighborhood,
demographics.borough,
demographics.cohort,
demographics.school,
demographics.sped_status,
demographics.enl_status,
demographics.ais_status,
demographics.holdover_status,
demographics.cohort_status,
demographics.academic_year AS demographics_academic_year,
economically_disadvantaged,
econ_dis,
gender,

--select student aliases from redacted student names table (alias: redacted)
redacted_student_name AS hlcs_student


FROM
`harlemlink-accountability.unions.all_attendance` granular


LEFT JOIN
`harlemlink-accountability.student_attendance.school_calendar_days` days
ON granular.date = days.date


LEFT JOIN
`harlemlink-accountability.datasources.students` demographics
ON granular.osis = demographics.osis  AND days.academic_year = demographics.academic_year 


LEFT JOIN
`harlemlink-accountability.datasources.redacted_student_names` redacted
ON granular.osis = redacted.osis


WHERE demographics.last_first IS NOT NULL ;


















--END------------------------------------------------------------------------------------------------