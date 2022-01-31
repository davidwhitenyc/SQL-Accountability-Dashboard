--------------------------------------------------------------------------------------------------------------
--run this combined script to REFRESH STUDENT RECRUITMENT DATA of the  HLCS Data & Accountablitiy Dashboard---
--------------------------------------------------------------------------------------------------------------
--[step 07.1] import data from each applications table

SELECT * 
FROM
 `harlemlink-accountability.applications.applications_sy2017_18`;

SELECT * 
FROM
 `harlemlink-accountability.applications.applications_sy2018_19`;


SELECT * 
FROM
 `harlemlink-accountability.applications.applications_sy2019_20`;


SELECT * 
FROM
 `harlemlink-accountability.applications.applications_sy2020_21`;


SELECT * 
FROM
 `harlemlink-accountability.applications.applications_sy2021_22`;

SELECT * 
FROM
 `harlemlink-accountability.applications.applications_sy2022_23`;



--[step 07.2] combine individual year applications tables into one table containing all applications

-- --list of available columns:
-- application_id,
-- sm_student_id,
-- application_student_id,
-- sis_student_id,
-- sis_id,
-- students_first_name,
-- students_last_name,
-- school_applying_to,
-- grade_applying_to,
-- application_status,
-- waitlist_number,
-- application_type,
-- account_id,
-- account_preferred_language,
-- current_grade,
-- enrollment_period,
-- submission_date,
-- submitted_by,
-- offered_date,
-- accepted_date,
-- registration_completed_date,
-- last_update_date,
-- student_id,
-- student_first_name,
-- student_middle_name,
-- student_last_name,
-- student_birth_date,
-- student_gender,
-- current_school,
-- last_status_change,
-- studentaddress_zip,
-- studentaddress_coordinates,
-- district,
-- how_did_you_hear_about_us,
-- admin_info_source,
-- student_most_used_language,
-- student_home_use_language,
-- home_most_used_language,
-- extra_language_support,
-- individualized_education_program,
-- homeless_shelter,
-- nyc_public_housing,
-- unaccompanied_youth,
-- failing_grade_school,
-- individualized_education_program_school,
-- individualized_education_program_date,
-- special_education_services_yes_no,
-- special_education_services,
-- health_issues,
-- health_impairments,
-- free_reduced_lunch,
-- snap_tanf,
-- priorities,
-- ethnicities,
-- primary_guardian_relation,
-- secondary_guardian_relation,
-- does_the_student_have_a_brother_or_sister_currently_attending_a_school_within_this_organization,
-- does_the_student_have_a_brother_or_sister_who_has_graduated_from_a_school_in_this_organization
-- string_studentaddress_zip
-- nyc_school_district

-- --Google Sheets pre-processing for 'string_studentaddress_zip' column:
-- =IF(AU2=0,"Not Listed", IF((LEFT([studentaddress_zip],5)*1)<10000,CONCATENATE("0",LEFT([studentaddress_zip],5)),LEFT([studentaddress_zip],5)))

-- --Google Sheets pre-processing for 'nyc_school_district' column:
-- =IF(COUNT([district])<1,"Not Listed or Outside NYC",CONCATENATE("District ",[district]))


CREATE OR REPLACE TABLE
  `harlemlink-accountability.unions.all_applications` AS
SELECT 
school_applying_to,
enrollment_period AS academic_year,
application_id,
sm_student_id,
grade_applying_to,
admin_info_source,
CASE 
  WHEN grade_applying_to = 'pk' THEN '.Pre-K'
  WHEN grade_applying_to = 'k' THEN 'Grade K'
  WHEN grade_applying_to = '1' THEN 'Grade 1'
  WHEN grade_applying_to = '2' THEN 'Grade 2'
  WHEN grade_applying_to = '3' THEN 'Grade 3'
  WHEN grade_applying_to = '4' THEN 'Grade 4'
  WHEN grade_applying_to = '5' THEN 'Grade 5'
  ELSE 'Not Listed'
END AS application_grade_applying_to,
application_status,
application_type,
account_preferred_language,
student_gender,
how_did_you_hear_about_us,
does_the_student_have_a_brother_or_sister_who_has_graduated_from_a_school_in_this_organization,
string_studentaddress_zip,
nyc_school_district


FROM
  `harlemlink-accountability.applications.applications_sy2017_18`
UNION ALL
SELECT 
school_applying_to,
enrollment_period AS academic_year,
application_id,
sm_student_id,
grade_applying_to,
admin_info_source,
CASE 
  WHEN grade_applying_to = 'pk' THEN '.Pre-K'
  WHEN grade_applying_to = 'k' THEN 'Grade K'
  WHEN grade_applying_to = '1' THEN 'Grade 1'
  WHEN grade_applying_to = '2' THEN 'Grade 2'
  WHEN grade_applying_to = '3' THEN 'Grade 3'
  WHEN grade_applying_to = '4' THEN 'Grade 4'
  WHEN grade_applying_to = '5' THEN 'Grade 5'
  ELSE 'Not Listed'
END AS application_grade_applying_to,
application_status,
application_type,
account_preferred_language,
student_gender,
how_did_you_hear_about_us,
does_the_student_have_a_brother_or_sister_who_has_graduated_from_a_school_in_this_organization,
string_studentaddress_zip,
nyc_school_district

  
FROM
  `harlemlink-accountability.applications.applications_sy2018_19`
UNION ALL
SELECT 
school_applying_to,
enrollment_period AS academic_year,
application_id,
sm_student_id,
grade_applying_to,
admin_info_source,
CASE 
  WHEN grade_applying_to = 'pk' THEN '.Pre-K'
  WHEN grade_applying_to = 'k' THEN 'Grade K'
  WHEN grade_applying_to = '1' THEN 'Grade 1'
  WHEN grade_applying_to = '2' THEN 'Grade 2'
  WHEN grade_applying_to = '3' THEN 'Grade 3'
  WHEN grade_applying_to = '4' THEN 'Grade 4'
  WHEN grade_applying_to = '5' THEN 'Grade 5'
  ELSE 'Not Listed'
END AS application_grade_applying_to,
application_status,
application_type,
account_preferred_language,
student_gender,
how_did_you_hear_about_us,
does_the_student_have_a_brother_or_sister_who_has_graduated_from_a_school_in_this_organization,
string_studentaddress_zip,
nyc_school_district


FROM
  `harlemlink-accountability.applications.applications_sy2019_20`
UNION ALL
SELECT 
school_applying_to,
enrollment_period AS academic_year,
application_id,
sm_student_id,
grade_applying_to,
admin_info_source,
CASE 
  WHEN grade_applying_to = 'pk' THEN '.Pre-K'
  WHEN grade_applying_to = 'k' THEN 'Grade K'
  WHEN grade_applying_to = '1' THEN 'Grade 1'
  WHEN grade_applying_to = '2' THEN 'Grade 2'
  WHEN grade_applying_to = '3' THEN 'Grade 3'
  WHEN grade_applying_to = '4' THEN 'Grade 4'
  WHEN grade_applying_to = '5' THEN 'Grade 5'
  ELSE 'Not Listed'
END AS application_grade_applying_to,
application_status,
application_type,
account_preferred_language,
student_gender,
how_did_you_hear_about_us,
does_the_student_have_a_brother_or_sister_who_has_graduated_from_a_school_in_this_organization,
string_studentaddress_zip,
nyc_school_district


FROM
  `harlemlink-accountability.applications.applications_sy2020_21`
UNION ALL
SELECT 
school_applying_to,
enrollment_period AS academic_year,
application_id,
sm_student_id,
grade_applying_to,
admin_info_source,
CASE 
  WHEN grade_applying_to = 'pk' THEN '.Pre-K'
  WHEN grade_applying_to = 'k' THEN 'Grade K'
  WHEN grade_applying_to = '1' THEN 'Grade 1'
  WHEN grade_applying_to = '2' THEN 'Grade 2'
  WHEN grade_applying_to = '3' THEN 'Grade 3'
  WHEN grade_applying_to = '4' THEN 'Grade 4'
  WHEN grade_applying_to = '5' THEN 'Grade 5'
  ELSE 'Not Listed'
END AS application_grade_applying_to,
application_status,
application_type,
account_preferred_language,
student_gender,
how_did_you_hear_about_us,
does_the_student_have_a_brother_or_sister_who_has_graduated_from_a_school_in_this_organization,
string_studentaddress_zip,
nyc_school_district


FROM
  `harlemlink-accountability.applications.applications_sy2021_22`
UNION ALL
SELECT 
school_applying_to,
enrollment_period AS academic_year,
application_id,
sm_student_id,
grade_applying_to,
admin_info_source,
CASE 
  WHEN grade_applying_to = 'pk' THEN '.Pre-K'
  WHEN grade_applying_to = 'k' THEN 'Grade K'
  WHEN grade_applying_to = '1' THEN 'Grade 1'
  WHEN grade_applying_to = '2' THEN 'Grade 2'
  WHEN grade_applying_to = '3' THEN 'Grade 3'
  WHEN grade_applying_to = '4' THEN 'Grade 4'
  WHEN grade_applying_to = '5' THEN 'Grade 5'
  ELSE 'Not Listed'
END AS application_grade_applying_to,
application_status,
application_type,
account_preferred_language,
student_gender,
how_did_you_hear_about_us,
does_the_student_have_a_brother_or_sister_who_has_graduated_from_a_school_in_this_organization,
string_studentaddress_zip,
nyc_school_district


FROM
  `harlemlink-accountability.applications.applications_sy2022_23` ;





--[step 07.3] join the combined applications table with the locations table

CREATE OR REPLACE TABLE
  `harlemlink-accountability.datasources.applications` AS
SELECT
school_applying_to,
academic_year,
application_id,
sm_student_id,
grade_applying_to,
application_grade_applying_to,
application_status,
application_type,
account_preferred_language,
student_gender,
how_did_you_hear_about_us,
does_the_student_have_a_brother_or_sister_who_has_graduated_from_a_school_in_this_organization,
string_studentaddress_zip,
nyc_school_district,
zip_code_numeric,
zip_code_text,
neighborhood,
borough,
admin_info_source


FROM 
`harlemlink-accountability.unions.all_applications` a

LEFT JOIN
`harlemlink-accountability.zip_codes.locations_by_zip_code` z 

ON a.string_studentaddress_zip = z.zip_code_text ;





--END---------------------------------------------------------------------------------------------------------