-----------------------------------------------------------------------------------------------------
--run this combined script to REFRESH SCHOOL CULTURE of the  HLCS Data & Accountablitiy Dashboard---
-----------------------------------------------------------------------------------------------------
--[step 04.1] import data from suspensions tracker

SELECT * 
FROM `harlemlink-accountability.student_rosters.suspensions_data_import` ;


--[step 04.2] join demograpic data to create suspensions datasource
CREATE OR REPLACE TABLE
`harlemlink-accountability.datasources.suspensions` AS

SELECT
--select columns from suspensions import (alias: suspensions)
suspensions.academic_year,
suspensions.osis AS suspensions_osis,
suspensions.date,
suspensions.last_name,
suspensions.first_name,
suspensions.grade,
suspensions.room,
suspensions.gender,
suspensions.iep,
suspensions.iep_info,
suspensions.suspension_date,
suspensions.number_of_days,
suspensions.iss_or_oss,
suspensions.subject,
suspensions.reason,
suspensions.offsite_instruction,
suspensions.suspension_letter,



--select columns from students datasource (alias: students)
students.osis,
students.last_first,
students.grade_level,
students.ic_grade_level,
students.class,
students.student_lastName,
students.student_firstName,
students.academic_year AS students_academic_year,
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
students.cohort_status

FROM 
`harlemlink-accountability.student_rosters.suspensions_data_import` suspensions


LEFT JOIN
`harlemlink-accountability.datasources.students` students

ON
suspensions.osis = students.osis  AND suspensions.academic_year=students.academic_year  ;



--END------------------------------------------------------------------------------------------------