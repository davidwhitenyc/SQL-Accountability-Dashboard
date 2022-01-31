-----------------------------------------------------------------------------------------------------
--run this combined script to REFRESH ENROLMENT DATA of the  HLCS Data & Accountablitiy Dashboard---
-----------------------------------------------------------------------------------------------------
--[step 01.1] import and refresh all student roster tables
SELECT *
FROM
`harlemlink-accountability.student_rosters.student_roster_sy17_18` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.student_roster_sy18_19` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.student_roster_sy19_20` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.student_roster_sy20_21` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.student_roster_sy21_22` ;


SELECT *
FROM 
`harlemlink-accountability.student_rosters.beds_day_2020_roster` ;



--[step 01.2] combine the student roster tables into a single table
CREATE OR REPLACE TABLE
`harlemlink-accountability.unions.all_students` AS

SELECT
academic_year,
osis,
last_first,
grade_level,
ic_grade_level,
class,
student_lastName,
student_firstName
FROM 
`harlemlink-accountability.student_rosters.student_roster_sy17_18`

UNION ALL
SELECT
academic_year,
osis,
last_first,
grade_level,
ic_grade_level,
class,
student_lastName,
student_firstName
FROM 
`harlemlink-accountability.student_rosters.student_roster_sy18_19`

UNION ALL
SELECT
academic_year,
osis,
last_first,
grade_level,
ic_grade_level,
class,
student_lastName,
student_firstName
FROM 
`harlemlink-accountability.student_rosters.student_roster_sy19_20`

UNION ALL
SELECT
academic_year,
osis,
last_first,
grade_level,
ic_grade_level,
class,
student_lastName,
student_firstName
FROM 
`harlemlink-accountability.student_rosters.student_roster_sy20_21`

UNION ALL
SELECT
academic_year,
osis,
last_first,
grade_level,
ic_grade_level,
class,
student_lastName,
student_firstName
FROM 
`harlemlink-accountability.student_rosters.student_roster_sy21_22` ;





--[step 01.3] import and refresh all student zip codes tables
SELECT *
FROM
`harlemlink-accountability.zip_codes.student_zip_codes_sy17_18` ;

SELECT *
FROM
`harlemlink-accountability.zip_codes.student_zip_codes_sy18_19` ;

SELECT *
FROM
`harlemlink-accountability.zip_codes.student_zip_codes_sy19_20` ;

SELECT *
FROM
`harlemlink-accountability.zip_codes.student_zip_codes_sy20_21` ;

SELECT *
FROM
`harlemlink-accountability.zip_codes.student_zip_codes_sy21_22` ;





--[step 01.4] combine the student zip codes tables into a single table
CREATE OR REPLACE TABLE
`harlemlink-accountability.unions.all_student_zip_codes` AS

SELECT
academic_year,
osis,
last_name,
first_name,
zip_code
FROM
`harlemlink-accountability.zip_codes.student_zip_codes_sy17_18`

UNION ALL
SELECT
academic_year,
osis,
last_name,
first_name,
zip_code
FROM
`harlemlink-accountability.zip_codes.student_zip_codes_sy18_19`

UNION ALL
SELECT
academic_year,
osis,
last_name,
first_name,
zip_code
FROM
`harlemlink-accountability.zip_codes.student_zip_codes_sy19_20`

UNION ALL
SELECT
academic_year,
osis,
last_name,
first_name,
zip_code
FROM
`harlemlink-accountability.zip_codes.student_zip_codes_sy20_21`

UNION ALL
SELECT
academic_year,
osis,
last_name,
first_name,
zip_code
FROM
`harlemlink-accountability.zip_codes.student_zip_codes_sy21_22`  ;




--[step 01.5] import and refresh both RDGS demographics tables tables
SELECT *
FROM
`harlemlink-accountability.student_rosters.rdgs_sy20_21` ;


SELECT *
FROM
`harlemlink-accountability.student_rosters.rdgs_sy21_22` ;



--[step 01.6] combine the RDGS demographics tables into a single table
CREATE OR REPLACE TABLE
`harlemlink-accountability.unions.all_rdgs_demographics` AS

SELECT
academic_year,
school,
last_name,
first_name,
osis,
d_o_b,
grade,
level,
off_cls,
spec_ed,
ethnic_code,
ell,
economically_disadvantaged,
econ_dis,
gender

FROM
`harlemlink-accountability.student_rosters.rdgs_sy20_21`


UNION ALL
SELECT
academic_year,
school,
last_name,
first_name,
osis,
d_o_b,
grade,
level,
off_cls,
spec_ed,
ethnic_code,
ell,
economically_disadvantaged,
econ_dis,
gender

FROM
`harlemlink-accountability.student_rosters.rdgs_sy21_22` ;







--[step 01.7] import and refresh all sped roster tables
SELECT *
FROM
`harlemlink-accountability.student_rosters.sped_roster_sy17_18` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.sped_roster_sy18_19` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.sped_roster_sy19_20` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.sped_roster_sy20_21` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.sped_roster_sy21_22` ;



--[step 01.8] combine the sped roster tables into a single table
CREATE OR REPLACE TABLE
`harlemlink-accountability.unions.all_sped_students` AS

SELECT 
academic_year,
osis,
last_name,
first_name,
sped
FROM 
`harlemlink-accountability.student_rosters.sped_roster_sy17_18`

UNION ALL
SELECT
academic_year,
osis,
last_name,
first_name,
sped
FROM 
`harlemlink-accountability.student_rosters.sped_roster_sy18_19`

UNION ALL
SELECT
academic_year,
osis,
last_name,
first_name,
sped
FROM 
`harlemlink-accountability.student_rosters.sped_roster_sy19_20`

UNION ALL
SELECT
academic_year,
osis,
last_name,
first_name,
sped
FROM 
`harlemlink-accountability.student_rosters.sped_roster_sy20_21`

UNION ALL
SELECT
academic_year,
osis,
last_name,
first_name,
sped
FROM 
`harlemlink-accountability.student_rosters.sped_roster_sy21_22` ;





--[step 01.9] import and refresh all enl roster tables
SELECT *
FROM
`harlemlink-accountability.student_rosters.enl_roster_sy17_18` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.enl_roster_sy18_19` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.enl_roster_sy19_20` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.enl_roster_sy20_21` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.enl_roster_sy21_22` ;




--[step 01.10] combine the enl roster tables into a single table
CREATE OR REPLACE TABLE
`harlemlink-accountability.unions.all_enl_students` AS

SELECT
academic_year,
osis,
last_first,
enl
FROM
`harlemlink-accountability.student_rosters.enl_roster_sy17_18`

UNION ALL
SELECT
academic_year,
osis,
last_first,
enl
FROM
`harlemlink-accountability.student_rosters.enl_roster_sy18_19`

UNION ALL
SELECT
academic_year,
osis,
last_first,
enl
FROM
`harlemlink-accountability.student_rosters.enl_roster_sy19_20`

UNION ALL
SELECT
academic_year,
osis,
last_first,
enl
FROM
`harlemlink-accountability.student_rosters.enl_roster_sy20_21`

UNION ALL
SELECT
academic_year,
osis,
last_first,
enl
FROM
`harlemlink-accountability.student_rosters.enl_roster_sy21_22` ;





--[step 01.11] import and refresh all ais roster tables
SELECT *
FROM
`harlemlink-accountability.student_rosters.ais_roster_17_18` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.ais_roster_18_19` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.ais_roster_19_20` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.ais_roster_20_21` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.ais_roster_21_22` ;





--[step 01.12] combine the ais roster tables into a single table
CREATE OR REPLACE TABLE
`harlemlink-accountability.unions.all_ais_students` AS

SELECT 
academic_year,
osis,
last_first,
ais
FROM
`harlemlink-accountability.student_rosters.ais_roster_17_18`

UNION ALL
SELECT 
academic_year,
osis,
last_first,
ais
FROM
`harlemlink-accountability.student_rosters.ais_roster_18_19`

UNION ALL
SELECT 
academic_year,
osis,
last_first,
ais
FROM
`harlemlink-accountability.student_rosters.ais_roster_19_20`

UNION ALL
SELECT 
academic_year,
osis,
last_first,
ais
FROM
`harlemlink-accountability.student_rosters.ais_roster_20_21`

UNION ALL
SELECT 
academic_year,
osis,
last_first,
ais
FROM
`harlemlink-accountability.student_rosters.ais_roster_21_22` ;





--[step 01.13] import and refresh all holdover roster tables
SELECT *
FROM
`harlemlink-accountability.student_rosters.holdovers_17_18` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.holdovers_18_19` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.holdovers_19_20` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.holdovers_20_21` ;

SELECT *
FROM
`harlemlink-accountability.student_rosters.holdovers_21_22` ;





--[step 01.14] combine the holdover roster tables into a single table
CREATE OR REPLACE TABLE
`harlemlink-accountability.unions.all_holdovers` AS

SELECT
academic_year,
osis,
last_first,
holdovers
FROM
`harlemlink-accountability.student_rosters.holdovers_17_18`

UNION ALL
SELECT
academic_year,
osis,
last_first,
holdovers
FROM
`harlemlink-accountability.student_rosters.holdovers_18_19`

UNION ALL
SELECT
academic_year,
osis,
last_first,
holdovers
FROM
`harlemlink-accountability.student_rosters.holdovers_19_20`

UNION ALL
SELECT
academic_year,
osis,
last_first,
holdovers
FROM
`harlemlink-accountability.student_rosters.holdovers_20_21`

UNION ALL
SELECT
academic_year,
osis,
last_first,
holdovers
FROM
`harlemlink-accountability.student_rosters.holdovers_21_22`  ;





--[step 01.15] join the combined roster table with location and demographic subgroup information
CREATE OR REPLACE TABLE
`harlemlink-accountability.unions.joined_students` AS

SELECT
--select columns from the combined 'all_students' roster (alias: students)
students.osis,
students.last_first,
students.grade_level,
students.ic_grade_level,
students.class,
students.student_lastName,
students.student_firstName,
students.academic_year,

--select columns from the combined 'all_sped_students' roster (alias: sped)
sped.sped,



--select columns from the combined 'all_enl_students' roster (alias: enl)
enl.enl,



--select columns from the combined 'all_ais_students' roster (alias: ais)
ais.ais,



--select columns from the combined 'all_holdovers' roster (alias: holdovers)
holdovers.holdovers,



--select columns from the combined 'rdgs_demographics' table (alias: rdgs)
ethnic_code,
CASE
  WHEN ethnic_code = 'A' THEN 'Hispanic'
  WHEN ethnic_code = 'B' THEN 'Native American'
  WHEN ethnic_code = 'C' THEN 'Asian'
  WHEN ethnic_code = 'D' THEN 'Pacific Islander'
  WHEN ethnic_code = 'E' THEN 'Black'
  WHEN ethnic_code = 'F' THEN 'White'
  WHEN ethnic_code = 'G' THEN 'Multi-Racial'
  ELSE 'No Data'
END AS rdgs_race,
economically_disadvantaged,
econ_dis,
gender,


--select columns from the combined 'all_student_zip_codes' table (alias: zip)
zip.zip_code,



--select columns from the 'locations_by_zip_code' table (alias: locations)
zip_code_text,
neighborhood,
borough,


--select columns from the BEDS Day 2020 table (alias: beds)
cohort,

--select student aliases from redacted student names table (alias: redacted)
redacted_student_name AS hlcs_student


FROM 
`harlemlink-accountability.unions.all_students` students

LEFT JOIN
`harlemlink-accountability.unions.all_sped_students` sped
ON students.osis = sped.osis AND students.academic_year = sped.academic_year

LEFT JOIN
`harlemlink-accountability.unions.all_enl_students` enl
ON students.osis = enl.osis AND students.academic_year = enl.academic_year

LEFT JOIN
`harlemlink-accountability.unions.all_ais_students` ais
ON students.osis = ais.osis AND students.academic_year = ais.academic_year

LEFT JOIN
`harlemlink-accountability.unions.all_holdovers` holdovers
ON students.osis = holdovers.osis AND students.academic_year = holdovers.academic_year

LEFT JOIN
`harlemlink-accountability.unions.all_rdgs_demographics` rdgs
ON students.osis = rdgs.osis AND students.academic_year = rdgs.academic_year

LEFT JOIN
`harlemlink-accountability.unions.all_student_zip_codes` zip
ON students.osis = zip.osis AND students.academic_year = zip.academic_year

LEFT JOIN
`harlemlink-accountability.zip_codes.locations_by_zip_code` locations
ON zip.zip_code = locations.zip_code_numeric

LEFT JOIN
`harlemlink-accountability.student_rosters.beds_day_2020_roster` beds
ON students.osis = beds.osis 

LEFT JOIN
`harlemlink-accountability.datasources.redacted_student_names` redacted
ON students.osis = redacted.osis  ;





--[step 01.16] fill in all categorical data to create 'students' datasource
CREATE OR REPLACE TABLE
`harlemlink-accountability.datasources.students` AS

SELECT *,


CASE
  WHEN last_first IS NOT NULL THEN 'Harlem Link Charter School'
END AS school,

CASE 
  WHEN sped = 'SPED Students' THEN 'SPED Students'
  ELSE 'GenEd Students'
END AS sped_status,

CASE 
  WHEN enl = 'ENL Students' THEN 'ENL Students'
  ELSE 'Non-ENL Students'
END AS enl_status,

CASE 
  WHEN ais = 'AIS-Yes' THEN 'AIS Students'
  ELSE 'Non-AIS Students'
END AS ais_status,

CASE 
  WHEN holdovers = 'Current Holdovers' THEN 'Current Holdovers'
  WHEN holdovers = 'Former Holdovers' THEN 'Former Holdovers'
  ELSE 'Non-Holdovers'
END AS holdover_status,

CASE
  WHEN cohort = '2+ Years Cohort' THEN '2+ Years Cohort'
  ELSE 'Not In Accountability Cohort'
END AS cohort_status


FROM
`harlemlink-accountability.unions.joined_students` ;





--[step 01.17] import withdrawals data and join with student demeographics 
CREATE OR REPLACE TABLE
`harlemlink-accountability.datasources.withdrawals` AS

SELECT

--select columns from withdrawals_data_import table (alias: withdrawals)
withdrawals.academic_year AS withdrawal_academic_year,
withdrawals.osis AS withdrawals_osis,
withdrawals.name,
withdrawals.sy2020_21_class,
withdrawals.sy2021_22_class,
discharge_date,
reason,
notes,
destination_school,
confirmed,
discharged_from_ats,

--select columns from students datasource (alias: students)
students.osis,
students.last_first,
students.grade_level,
students.ic_grade_level,
students.class,
students.student_lastName,
students.student_firstName,
students.academic_year,
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
`harlemlink-accountability.student_rosters.withdrawals_data_import` withdrawals

LEFT JOIN
`harlemlink-accountability.datasources.students` students

ON
withdrawals.osis = students.osis ;





--END------------------------------------------------------------------------------------------------