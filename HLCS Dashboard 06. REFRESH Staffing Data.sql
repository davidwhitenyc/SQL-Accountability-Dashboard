-----------------------------------------------------------------------------------------------------
--run this combined script to REFRESH STAFFING DATA of the  HLCS Data & Accountablitiy Dashboard---
-----------------------------------------------------------------------------------------------------
--[step 06.1] import data from each year's staff table

SELECT *
FROM
`harlemlink-accountability.staff_rosters.staff_roster_sy17_18` ;

SELECT *
FROM
`harlemlink-accountability.staff_rosters.staff_roster_sy18_19` ;

SELECT *
FROM
`harlemlink-accountability.staff_rosters.staff_roster_sy19_20` ;

SELECT *
FROM
`harlemlink-accountability.staff_rosters.staff_roster_sy20_21` ;

SELECT *
FROM
`harlemlink-accountability.staff_rosters.staff_roster_sy21_22` ;





--[step 06.2] combine individual year's staff table into one table containing all staff members from all years
CREATE OR REPLACE TABLE
  `harlemlink-accountability.unions.all_staff` AS

SELECT
academic_year,
staff_id,
last_first,
job_title,
department,
team,
lead_teacher_or_non_lead_teacher,
original_hire_date,
full_or_partial_year
FROM
`harlemlink-accountability.staff_rosters.staff_roster_sy17_18`

UNION ALL
SELECT
academic_year,
staff_id,
last_first,
job_title,
department,
team,
lead_teacher_or_non_lead_teacher,
original_hire_date,
full_or_partial_year
FROM
`harlemlink-accountability.staff_rosters.staff_roster_sy18_19`

UNION ALL
SELECT
academic_year,
staff_id,
last_first,
job_title,
department,
team,
lead_teacher_or_non_lead_teacher,
original_hire_date,
full_or_partial_year
FROM
`harlemlink-accountability.staff_rosters.staff_roster_sy19_20`

UNION ALL
SELECT
academic_year,
staff_id,
last_first,
job_title,
department,
team,
lead_teacher_or_non_lead_teacher,
original_hire_date,
full_or_partial_year
FROM
`harlemlink-accountability.staff_rosters.staff_roster_sy20_21`

UNION ALL
SELECT
academic_year,
staff_id,
last_first,
job_title,
department,
team,
lead_teacher_or_non_lead_teacher,
original_hire_date,
full_or_partial_year
FROM
`harlemlink-accountability.staff_rosters.staff_roster_sy21_22` ;





--[step 06.3] import data from the staff absences table

SELECT *
FROM
`harlemlink-accountability.staff_absences.staff_absences_sy17_18` ;


SELECT *
FROM
`harlemlink-accountability.staff_absences.staff_absences_sy18_19` ;


SELECT *
FROM
`harlemlink-accountability.staff_absences.staff_absences_sy19_20` ;


SELECT *
FROM
`harlemlink-accountability.staff_absences.staff_absences_sy20_21` ;


SELECT *
FROM
`harlemlink-accountability.staff_absences.staff_absences_sy21_22` ;





--[step 06.4] combine each year's staff absences table into a single table

CREATE OR REPLACE TABLE
`harlemlink-accountability.unions.all_staff_absences` AS

SELECT
academic_year,
staff_id,
last_first,
date_of_absence,
whole_or_half_day_absent
FROM
`harlemlink-accountability.staff_absences.staff_absences_sy17_18` 

UNION ALL
SELECT
academic_year,
staff_id,
last_first,
date_of_absence,
whole_or_half_day_absent
FROM
`harlemlink-accountability.staff_absences.staff_absences_sy18_19`

UNION ALL
SELECT
academic_year,
staff_id,
last_first,
date_of_absence,
whole_or_half_day_absent
FROM
`harlemlink-accountability.staff_absences.staff_absences_sy19_20`

UNION ALL
SELECT
academic_year,
staff_id,
last_first,
date_of_absence,
whole_or_half_day_absent
FROM
`harlemlink-accountability.staff_absences.staff_absences_sy20_21`

UNION ALL
SELECT
academic_year,
staff_id,
last_first,
date_of_absence,
whole_or_half_day_absent
FROM
`harlemlink-accountability.staff_absences.staff_absences_sy21_22` ;





--[step 06.4] find the total absences for each staff member per year
CREATE OR REPLACE TABLE
`harlemlink-accountability.unions.staff_absence_totals` AS


SELECT
staff_id,
academic_year,
SUM(whole_or_half_day_absent) AS total_days_absent

FROM
`harlemlink-accountability.unions.all_staff_absences`

WHERE academic_year IS NOT NULL

GROUP BY 1,2 ;




--[step 06.5] join the staff_absences_totals (groupby) table to add total (or ytd) absences for each staff member
CREATE OR REPLACE TABLE
`harlemlink-accountability.datasources.staff` AS

SELECT
staff.academic_year,
staff.staff_id,
last_first,
job_title,
department,
team,
lead_teacher_or_non_lead_teacher,
original_hire_date,
full_or_partial_year,
total_days_absent

FROM
`harlemlink-accountability.unions.all_staff` staff

LEFT JOIN
`harlemlink-accountability.unions.staff_absence_totals` absences

ON staff.academic_year = absences.academic_year AND staff.staff_id = absences.staff_id ;





--END------------------------------------------------------------------------------------------------