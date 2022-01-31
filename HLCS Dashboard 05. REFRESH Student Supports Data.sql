-----------------------------------------------------------------------------------------------------------
--run this combined script to REFRESH STUDENT SUPPORTS DATa of the  HLCS Data & Accountablitiy Dashboard---
-----------------------------------------------------------------------------------------------------------
--[step 05.1] import data from social work cases tracker
SELECT * 
FROM 
`harlemlink-accountability.student_rosters.social_work_open_cases_data_import` ;





--[step 05.2] join social work cases with demographic data to create 'social_work_open_cases' datasource
CREATE OR REPLACE TABLE
`harlemlink-accountability.datasources.social_work_open_cases` AS

SELECT

--select columns from open cases import table (alias: cases)
cases.academic_year AS cases_academic_year,
cases.osis AS cases_osis,
cases.last_first AS cases_last_first,
cases.class AS cases_class,
cases.type,
cases.staff_member_assigned,


--select columns from students datasource (alias: students)
students.osis,
students.last_first,
students.grade_level,
students.ic_grade_level,
students.class,
students.student_lastName,
students.student_firstName,
students.sped,
students.enl,
students.ais,
students.holdovers,
students.ethnic_code,
students.rdgs_race,
students.zip_code,
students.zip_code_text,
students.neighborhood,
students.borough,
students.cohort,
students.hlcs_student,
students.school,
students.sped_status,
students.enl_status,
students.ais_status,
students.holdover_status,
students.cohort_status,
students.economically_disadvantaged,
students.econ_dis,
students.gender


FROM
`harlemlink-accountability.student_rosters.social_work_open_cases_data_import` cases

LEFT JOIN
`harlemlink-accountability.datasources.students` students

ON
cases.osis = students.osis 


WHERE cases.last_first IS NOT NULL ;





--[step 05.3] import data from ACS cases tracker
SELECT * 
FROM 
`harlemlink-accountability.student_rosters.social_work_acs_data_import` ;





--[step 05.4] join social work cases with demographic data to create 'social_work_acs' datasource
CREATE OR REPLACE TABLE
`harlemlink-accountability.datasources.social_work_acs` AS

SELECT

--select columns from open cases import table (alias: acs)
acs.academic_year AS acs_academic_year,
acs.osis AS acs_osis,
acs.last_first AS acs_last_first,
acs.grade_level AS acs_grade_level,
acs.soical_worker1,
acs.soical_worker2,
acs.status,


--select columns from students datasource (alias: students)
students.osis,
students.last_first,
students.grade_level,
students.ic_grade_level,
students.class,
students.student_lastName,
students.student_firstName,
students.sped,
students.enl,
students.ais,
students.holdovers,
students.ethnic_code,
students.rdgs_race,
students.zip_code,
students.zip_code_text,
students.neighborhood,
students.borough,
students.cohort,
students.hlcs_student,
students.school,
students.sped_status,
students.enl_status,
students.ais_status,
students.holdover_status,
students.cohort_status,
students.economically_disadvantaged,
students.econ_dis,
students.gender



FROM
`harlemlink-accountability.student_rosters.social_work_acs_data_import` acs

LEFT JOIN
`harlemlink-accountability.datasources.students` students

ON
acs.osis = students.osis 


WHERE acs.last_first IS NOT NULL ;



--END------------------------------------------------------------------------------------------------------