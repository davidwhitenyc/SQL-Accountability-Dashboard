-----------------------------------------------------------------------------------------------------
--run this combined script to REFRESH ACADEMIC DATA of the  HLCS Data & Accountablitiy Dashboard---
-----------------------------------------------------------------------------------------------------


--update test prep academic year------------------------------------------------------------------------
--refresh each grade level datasource

SELECT * FROM `harlemlinksy2122.datasources.math_tp_grade3`  ;

SELECT * FROM `harlemlinksy2122.datasources.math_tp_grade4`  ;

SELECT * FROM `harlemlinksy2122.datasources.math_tp_grade5`  ; 


--create math test prep leadership view datasource

CREATE OR REPLACE TABLE 
`harlemlinksy2122.datasources.math_tp_leadership` AS

SELECT *,
  CASE 
    WHEN student IS NOT NULL THEN 'SY 2021–22'
  END AS academic_year
FROM `harlemlinksy2122.datasources.math_tp_grade3`


UNION ALL
SELECT *,
 CASE 
    WHEN student IS NOT NULL THEN 'SY 2021–22'
  END AS academic_year
FROM `harlemlinksy2122.datasources.math_tp_grade4`


UNION ALL
SELECT *,
 CASE 
    WHEN student IS NOT NULL THEN 'SY 2021–22'
  END AS academic_year
FROM `harlemlinksy2122.datasources.math_tp_grade5`  ;

--refresh each grade level datasource

SELECT * FROM `harlemlinksy2122.datasources.ela_tp_grade3`  ;

SELECT * FROM `harlemlinksy2122.datasources.ela_tp_grade4`  ;

SELECT * FROM `harlemlinksy2122.datasources.ela_tp_grade5`  ; 



--create ela test prep leadership view datasource

CREATE OR REPLACE TABLE 
`harlemlinksy2122.datasources.ela_tp_leadership` AS

SELECT 
  --start by pulling the osis on the combined results table
  osis,
  --pull these columns from the .demographics.students table
  student,
  sy_21_22_class,
  sped,
  enl,
  hl_upk,
  holdovers,
  new_students,
  ais,
  --also pull these test-related columns from the results table
  question_id,
  ccls_standard,
  standard_description,
  question_text,
  quiz,
  points_earned,
  points_available,
  student_answer,
  correct_answer,
  ela_tp_pct_points,
  ela_tp_benchmark,
  genre,
  CASE 
    WHEN student IS NOT NULL THEN 'SY 2021–22'
  END AS academic_year

FROM `harlemlinksy2122.datasources.ela_tp_grade3`
UNION ALL
SELECT 
  --start by pulling the osis on the combined results table
  osis,
  --pull these columns from the .demographics.students table
  student,
  sy_21_22_class,
  sped,
  enl,
  hl_upk,
  holdovers,
  new_students,
  ais,
  --also pull these test-related columns from the results table
  question_id,
  ccls_standard,
  standard_description,
  question_text,
  quiz,
  points_earned,
  points_available,
  student_answer,
  correct_answer,
  ela_tp_pct_points,
  ela_tp_benchmark,
  genre,
    CASE 
    WHEN student IS NOT NULL THEN 'SY 2021–22'
  END AS academic_year

FROM `harlemlinksy2122.datasources.ela_tp_grade4`
UNION ALL
SELECT 
  --start by pulling the osis on the combined results table
  osis,
  --pull these columns from the .demographics.students table
  student,
  sy_21_22_class,
  sped,
  enl,
  hl_upk,
  holdovers,
  new_students,
  ais,
  --also pull these test-related columns from the results table
  question_id,
  ccls_standard,
  standard_description,
  question_text,
  quiz,
  points_earned,
  points_available,
  student_answer,
  correct_answer,
  ela_tp_pct_points,
  ela_tp_benchmark,
  genre,
    CASE 
    WHEN student IS NOT NULL THEN 'SY 2021–22'
  END AS academic_year


FROM `harlemlinksy2122.datasources.ela_tp_grade5`  ;




----------------------------------------------------------------------------------------------




--[step 03.1] combine all grade level math level 3 datasources


CREATE OR REPLACE TABLE
`harlemlinksy2122.unions.math_level3_leadership` AS


--select columns from grade k math
SELECT
osis,
student,
sy_21_22_class,
sped,
enl,
hl_upk,
holdovers,
new_students,
ais,
question_id,
ccls_standard,
standard_description,
question_text,
unit,
points_earned,
points_available

FROM
`harlemlinksy2122.datasources.math_gradek`


--select columns from grade 1 math
UNION ALL
SELECT
osis,
student,
sy_21_22_class,
sped,
enl,
hl_upk,
holdovers,
new_students,
ais,
question_id,
ccls_standard,
standard_description,
question_text,
unit,
points_earned,
points_available

FROM
`harlemlinksy2122.datasources.math_grade1`


--select columns from grade 2 math
UNION ALL
SELECT
osis,
student,
sy_21_22_class,
sped,
enl,
hl_upk,
holdovers,
new_students,
ais,
question_id,
ccls_standard,
standard_description,
question_text,
unit,
points_earned,
points_available

FROM
`harlemlinksy2122.datasources.math_grade2`


--select columns from grade 3 math
UNION ALL
SELECT
osis,
student,
sy_21_22_class,
sped,
enl,
hl_upk,
holdovers,
new_students,
ais,
question_id,
ccls_standard,
standard_description,
question_text,
unit,
points_earned,
points_available

FROM
`harlemlinksy2122.datasources.math_grade3`


--select columns from grade 4 math
UNION ALL
SELECT
osis,
student,
sy_21_22_class,
sped,
enl,
hl_upk,
holdovers,
new_students,
ais,
question_id,
ccls_standard,
standard_description,
question_text,
unit,
points_earned,
points_available

FROM
`harlemlinksy2122.datasources.math_grade4`


--select columns from grade 5 math
UNION ALL
SELECT
osis,
student,
sy_21_22_class,
sped,
enl,
hl_upk,
holdovers,
new_students,
ais,
question_id,
ccls_standard,
standard_description,
question_text,
unit,
points_earned,
points_available

FROM
`harlemlinksy2122.datasources.math_grade5`  ;





--[step 03.2] add a column for the current academic year to the combined results table
CREATE OR REPLACE TABLE
`harlemlinksy2122.unions.math_level3_leadership_sy21_22` AS


SELECT *,

CASE
  WHEN student IS NOT NULL THEN 'SY 2021–22'
END AS academic_year 

FROM
`harlemlinksy2122.unions.math_level3_leadership`  ;



--[step 03.3] join combined grade level math level 3 datasources with demographic data
CREATE OR REPLACE TABLE
`harlemlink-accountability.datasources.math_level3` AS

--select columns from the combined math level 3 datasource (alias: results)
SELECT 
results.osis AS results_osis,
results.student,
results.sy_21_22_class,
results.sped,
results.enl,
results.hl_upk,
results.holdovers,
results.new_students,
results.ais,
results.question_id,
results.ccls_standard,
results.standard_description,
results.question_text,
results.unit,
results.points_earned,
results.points_available,

CASE 
  WHEN results.student IS NOT NULL THEN 'SY 2021–22'
END AS academic_year,


--select columns from students datasource (alias: students)
students.osis,
students.last_first,
students.grade_level,
students.ic_grade_level,
students.class,
students.student_lastName,
students.student_firstName,
students.academic_year AS students_academic_year,
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
students.gender,

--select column from overall benchmark
benchmarks.results_benchmark


FROM
`harlemlinksy2122.unions.math_level3_leadership_sy21_22` results

LEFT JOIN
`harlemlink-accountability.datasources.students` students

ON
results.osis = students.osis  AND  results.academic_year = students.academic_year 

LEFT JOIN
`harlemlinksy2122.datasources.benchmarks_math_level3` benchmarks

ON 
results.osis = benchmarks.osis


WHERE students.last_first IS NOT NULL ;





--[step 03.4] clone of leadership view math test prep data source and join demographic data
CREATE OR REPLACE TABLE
`harlemlink-accountability.datasources.math_test_prep` AS

SELECT
--select columns from math test prep datasource (alias: math_prep)
math_prep.osis,
math_prep.student,
math_prep.sy_21_22_class,
math_prep.sped,
math_prep.enl,
math_prep.hl_upk,
math_prep.holdovers,
math_prep.new_students,
math_prep.ais,
math_prep.question_id,
math_prep.ccls_standard,
math_prep.standard_description,
math_prep.question_text,
math_prep.quiz,
math_prep.points_earned,
math_prep.points_available,
math_prep.student_answer,
math_prep.correct_answer,
math_prep.category,
math_prep.math_tp_pct_points,
math_prep.math_tp_benchmark,


--select columns from students datasource (alias: students)
students.osis AS students_osis,
students.last_first AS students_last_first,
students.grade_level AS students_grade_level,
students.ic_grade_level,
students.class AS students_class,
students.student_lastName,
students.student_firstName,
students.academic_year AS students_academic_year,
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
students.gender,

--select column from overall benchmark
benchmarks.results_benchmark


FROM
`harlemlinksy2122.datasources.math_tp_leadership` math_prep

LEFT JOIN
`harlemlink-accountability.datasources.students` students

ON
math_prep.osis = students.osis  AND  math_prep.academic_year = students.academic_year 

LEFT JOIN
`harlemlinksy2122.datasources.benchmarks_math_level3` benchmarks

ON 
math_prep.osis = benchmarks.osis

WHERE students.last_first IS NOT NULL ;





--[step 03.5] clone of leadership view ELA test prep data source and join demographic data
CREATE OR REPLACE TABLE
`harlemlink-accountability.datasources.ela_test_prep` AS

SELECT
--select columns from ELA test prep datasource (alias: ela_prep)
ela_prep.osis,
ela_prep.student,
ela_prep.sy_21_22_class,
ela_prep.sped,
ela_prep.enl,
ela_prep.hl_upk,
ela_prep.holdovers,
ela_prep.new_students,
ela_prep.ais,
ela_prep.question_id,
ela_prep.ccls_standard,
ela_prep.standard_description,
ela_prep.question_text,
ela_prep.quiz,
ela_prep.points_earned,
ela_prep.points_available,
ela_prep.student_answer,
ela_prep.correct_answer,
ela_prep.genre,
ela_prep.ela_tp_pct_points,
ela_prep.ela_tp_benchmark,

--select columns from students datasource (alias: students)
students.osis AS students_osis,
students.last_first AS students_last_first,
students.grade_level AS students_grade_level,
students.ic_grade_level,
students.class AS students_class,
students.student_lastName,
students.student_firstName,
students.academic_year AS students_academic_year,
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
students.gender,

--select column from overall benchmark
benchmarks.results_benchmark


FROM
`harlemlinksy2122.datasources.ela_tp_leadership` ela_prep

LEFT JOIN
`harlemlink-accountability.datasources.students` students

ON
ela_prep.osis = students.osis  AND  ela_prep.academic_year = students.academic_year 

LEFT JOIN
`harlemlinksy2122.datasources.benchmarks_math_level3` benchmarks

ON 
ela_prep.osis = benchmarks.osis

WHERE students.last_first IS NOT NULL ;





--[step 03.6] clone of whole-school F&P data source and join demographic data
CREATE OR REPLACE TABLE
`harlemlink-accountability.datasources.fp` AS

SELECT
--select columns from f&p test prep datasource (alias: fp)
fp.osis,
fp.jun_2021_instructional_level,
fp.jun_2021_student_vs_benchmark,
fp.nov_2021_instructional_level,
fp.nov_2021_student_vs_benchmark,
fp.growth_jun_2021_to_nov_2021,
fp.student,
fp.sy_21_22_class,
fp.sy21_22_grade_level,
fp.sped,
fp.enl,
fp.hl_upk,
fp.holdovers,
fp.new_students,
fp.ais,
fp.jun_2021_independent_benchmark,
fp.jun_2021_instructional_benchmark,
fp.sep_2021_independent_benchmark,
fp.sep_2021_instructional_benchmark,
fp.nov_2021_independent_benchmark,
fp.nov_2021_instructional_benchmark,
fp.mar_2022_independent_benchmark,
fp.mar_2022_instructional_benchmark,
fp.jun_2022_independent_benchmark,
fp.jun_2022_instructional_benchmark,

--select columns from students datasource (alias: students)
students.osis AS students_osis,
students.last_first AS students_last_first,
students.grade_level AS students_grade_level,
students.ic_grade_level,
students.class AS students_class,
students.student_lastName,
students.student_firstName,
students.academic_year AS students_academic_year,
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
`harlemlinksy2122.whole_school_fp.fp_datasourcev1` fp

LEFT JOIN
`harlemlink-accountability.datasources.students` students

ON
fp.osis = students.osis  AND  fp.academic_year = students.academic_year 

WHERE students.last_first IS NOT NULL ;




--[step 03.7] combine MAP ELA data
CREATE OR REPLACE TABLE
`harlemlink-accountability.unions.all_nwea_map_ela` AS

--fall 2021-22 administration, ela
SELECT
academic_year,
student_id,
student_last_name,
student_first_name,
student_middle_initial,
term_tested,
term_rostered,
school,
grade,
subject,
course,
included_in_2_years_cohort,
rit_score,
met_suny_eoy_cut_score_math,
met_suny_eoy_cut_score_ela,
rapidguessing_,
rit_score_10_point_range,
lexilescore,
lexilerange,
quantilescore,
quantilerange,
test_name,
mathematics_geometry,
mathematics_measurement_and_data,
mathematics_number_and_operations,
mathematics_operations_and_algebraic_thinking,
language_arts_foundational_skills,
language_arts_literary_and_informational_text,
language_arts_understand_key_ideas_details_and_connections,
language_arts_understand_language_craft_and_structure,
language_arts_vocabulary_acquisition_and_use_all,
language_arts_writing_and_conventions_of_academic_english,
map_sped,
map_enl,
map_hl_upk,
map_holdovers,
map_new_students,
map_ais,
grade_level_suny_eoy_cut_score_math,
grade_level_suny_eoy_cut_score_ela

FROM
`harlemlink-accountability.nwea_map.sy21_22_fall_ela`

--winter 2021-22 administration, ela
UNION ALL
SELECT
academic_year,
student_id,
student_last_name,
student_first_name,
student_middle_initial,
term_tested,
term_rostered,
school,
grade,
subject,
course,
included_in_2_years_cohort,
rit_score,
met_suny_eoy_cut_score_math,
met_suny_eoy_cut_score_ela,
rapidguessing_,
rit_score_10_point_range,
lexilescore,
lexilerange,
quantilescore,
quantilerange,
test_name,
mathematics_geometry,
mathematics_measurement_and_data,
mathematics_number_and_operations,
mathematics_operations_and_algebraic_thinking,
language_arts_foundational_skills,
language_arts_literary_and_informational_text,
language_arts_understand_key_ideas_details_and_connections,
language_arts_understand_language_craft_and_structure,
language_arts_vocabulary_acquisition_and_use_all,
language_arts_writing_and_conventions_of_academic_english,
map_sped,
map_enl,
map_hl_upk,
map_holdovers,
map_new_students,
map_ais,
grade_level_suny_eoy_cut_score_math,
grade_level_suny_eoy_cut_score_ela

FROM
`harlemlink-accountability.nwea_map.sy21_22_winter_ela`


--spring 2021-22 administration, ela
UNION ALL
SELECT
academic_year,
student_id,
student_last_name,
student_first_name,
student_middle_initial,
term_tested,
term_rostered,
school,
grade,
subject,
course,
included_in_2_years_cohort,
rit_score,
met_suny_eoy_cut_score_math,
met_suny_eoy_cut_score_ela,
rapidguessing_,
rit_score_10_point_range,
lexilescore,
lexilerange,
quantilescore,
quantilerange,
test_name,
mathematics_geometry,
mathematics_measurement_and_data,
mathematics_number_and_operations,
mathematics_operations_and_algebraic_thinking,
language_arts_foundational_skills,
language_arts_literary_and_informational_text,
language_arts_understand_key_ideas_details_and_connections,
language_arts_understand_language_craft_and_structure,
language_arts_vocabulary_acquisition_and_use_all,
language_arts_writing_and_conventions_of_academic_english,
map_sped,
map_enl,
map_hl_upk,
map_holdovers,
map_new_students,
map_ais,
grade_level_suny_eoy_cut_score_math,
grade_level_suny_eoy_cut_score_ela

FROM
`harlemlink-accountability.nwea_map.sy21_22_spring_ela`  ;





--[step 03.8] join combined MAP ELA data with demographic data
CREATE OR REPLACE TABLE
`harlemlink-accountability.datasources.nwea_map_ela` AS

SELECT
--select columns from MAP ELA datasource (alias: map_ela)
map_ela.academic_year,
map_ela.student_id,
map_ela.student_last_name,
map_ela.student_first_name,
map_ela.student_middle_initial,
map_ela.term_tested,
map_ela.term_rostered,
map_ela.school AS map_school,
map_ela.grade,
map_ela.subject,
map_ela.course,
map_ela.included_in_2_years_cohort,
map_ela.rit_score,
map_ela.met_suny_eoy_cut_score_math,
map_ela.met_suny_eoy_cut_score_ela,
map_ela.rapidguessing_,
map_ela.rit_score_10_point_range,
map_ela.lexilescore,
map_ela.lexilerange,
map_ela.quantilescore,
map_ela.quantilerange,
map_ela.test_name,
map_ela.mathematics_geometry,
map_ela.mathematics_measurement_and_data,
map_ela.mathematics_number_and_operations,
map_ela.mathematics_operations_and_algebraic_thinking,
map_ela.language_arts_foundational_skills,
map_ela.language_arts_literary_and_informational_text,
map_ela.language_arts_understand_key_ideas_details_and_connections,
map_ela.language_arts_understand_language_craft_and_structure,
map_ela.language_arts_vocabulary_acquisition_and_use_all,
map_ela.language_arts_writing_and_conventions_of_academic_english,
map_ela.map_sped,
map_ela.map_enl,
map_ela.map_hl_upk,
map_ela.map_holdovers,
map_ela.map_new_students,
map_ela.map_ais,
map_ela.grade_level_suny_eoy_cut_score_math,
map_ela.grade_level_suny_eoy_cut_score_ela,

--select columns from students datasource (alias: students)
students.osis,
students.last_first,
students.grade_level,
students.ic_grade_level,
students.class,
students.student_lastName,
students.student_firstName,
students.academic_year AS students_academic_year,
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
`harlemlink-accountability.unions.all_nwea_map_ela` map_ela

LEFT JOIN
`harlemlink-accountability.datasources.students` students

ON
map_ela.student_id = students.osis  AND  map_ela.academic_year = students.academic_year 

WHERE students.last_first IS NOT NULL ;





--[step 03.9] combine MAP math data
CREATE OR REPLACE TABLE
`harlemlink-accountability.unions.all_nwea_map_math` AS

--fall 2021-22 administration, math
SELECT
academic_year,
student_id,
student_last_name,
student_first_name,
student_middle_initial,
term_tested,
term_rostered,
school,
grade,
subject,
course,
included_in_2_years_cohort,
rit_score,
met_suny_eoy_cut_score_math,
met_suny_eoy_cut_score_ela,
rapidguessing_,
rit_score_10_point_range,
lexilescore,
lexilerange,
quantilescore,
quantilerange,
test_name,
mathematics_geometry,
mathematics_measurement_and_data,
mathematics_number_and_operations,
mathematics_operations_and_algebraic_thinking,
language_arts_foundational_skills,
language_arts_literary_and_informational_text,
language_arts_understand_key_ideas_details_and_connections,
language_arts_understand_language_craft_and_structure,
language_arts_vocabulary_acquisition_and_use_all,
language_arts_writing_and_conventions_of_academic_english,
map_sped,
map_enl,
map_hl_upk,
map_holdovers,
map_new_students,
map_ais,
grade_level_suny_eoy_cut_score_math,
grade_level_suny_eoy_cut_score_ela

FROM
`harlemlink-accountability.nwea_map.sy21_22_fall_math`

--winter 2021-22 administration, math
UNION ALL
SELECT
academic_year,
student_id,
student_last_name,
student_first_name,
student_middle_initial,
term_tested,
term_rostered,
school,
grade,
subject,
course,
included_in_2_years_cohort,
rit_score,
met_suny_eoy_cut_score_math,
met_suny_eoy_cut_score_ela,
rapidguessing_,
rit_score_10_point_range,
lexilescore,
lexilerange,
quantilescore,
quantilerange,
test_name,
mathematics_geometry,
mathematics_measurement_and_data,
mathematics_number_and_operations,
mathematics_operations_and_algebraic_thinking,
language_arts_foundational_skills,
language_arts_literary_and_informational_text,
language_arts_understand_key_ideas_details_and_connections,
language_arts_understand_language_craft_and_structure,
language_arts_vocabulary_acquisition_and_use_all,
language_arts_writing_and_conventions_of_academic_english,
map_sped,
map_enl,
map_hl_upk,
map_holdovers,
map_new_students,
map_ais,
grade_level_suny_eoy_cut_score_math,
grade_level_suny_eoy_cut_score_ela

FROM
`harlemlink-accountability.nwea_map.sy21_22_winter_math`


--spring 2021-22 administration, math
UNION ALL
SELECT
academic_year,
student_id,
student_last_name,
student_first_name,
student_middle_initial,
term_tested,
term_rostered,
school,
grade,
subject,
course,
included_in_2_years_cohort,
rit_score,
met_suny_eoy_cut_score_math,
met_suny_eoy_cut_score_ela,
rapidguessing_,
rit_score_10_point_range,
lexilescore,
lexilerange,
quantilescore,
quantilerange,
test_name,
mathematics_geometry,
mathematics_measurement_and_data,
mathematics_number_and_operations,
mathematics_operations_and_algebraic_thinking,
language_arts_foundational_skills,
language_arts_literary_and_informational_text,
language_arts_understand_key_ideas_details_and_connections,
language_arts_understand_language_craft_and_structure,
language_arts_vocabulary_acquisition_and_use_all,
language_arts_writing_and_conventions_of_academic_english,
map_sped,
map_enl,
map_hl_upk,
map_holdovers,
map_new_students,
map_ais,
grade_level_suny_eoy_cut_score_math,
grade_level_suny_eoy_cut_score_ela

FROM
`harlemlink-accountability.nwea_map.sy21_22_spring_math`  ;




--[step 03.10] join combined MAP math data with demographic data
CREATE OR REPLACE TABLE
`harlemlink-accountability.datasources.nwea_map_math` AS

SELECT
--select columns from MAP math datasource (alias: map_math)
map_math.academic_year,
map_math.student_id,
map_math.student_last_name,
map_math.student_first_name,
map_math.student_middle_initial,
map_math.term_tested,
map_math.term_rostered,
map_math.school AS map_school,
map_math.grade,
map_math.subject,
map_math.course,
map_math.included_in_2_years_cohort,
map_math.rit_score,
map_math.met_suny_eoy_cut_score_math,
map_math.met_suny_eoy_cut_score_ela,
map_math.rapidguessing_,
map_math.rit_score_10_point_range,
map_math.lexilescore,
map_math.lexilerange,
map_math.quantilescore,
map_math.quantilerange,
map_math.test_name,
map_math.mathematics_geometry,
map_math.mathematics_measurement_and_data,
map_math.mathematics_number_and_operations,
map_math.mathematics_operations_and_algebraic_thinking,
map_math.language_arts_foundational_skills,
map_math.language_arts_literary_and_informational_text,
map_math.language_arts_understand_key_ideas_details_and_connections,
map_math.language_arts_understand_language_craft_and_structure,
map_math.language_arts_vocabulary_acquisition_and_use_all,
map_math.language_arts_writing_and_conventions_of_academic_english,
map_math.map_sped,
map_math.map_enl,
map_math.map_hl_upk,
map_math.map_holdovers,
map_math.map_new_students,
map_math.map_ais,
map_math.grade_level_suny_eoy_cut_score_math,
map_math.grade_level_suny_eoy_cut_score_ela,

--select columns from students datasource (alias: students)
students.osis,
students.last_first,
students.grade_level,
students.ic_grade_level,
students.class,
students.student_lastName,
students.student_firstName,
students.academic_year AS students_academic_year,
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
`harlemlink-accountability.unions.all_nwea_map_math` map_math

LEFT JOIN
`harlemlink-accountability.datasources.students` students

ON
map_math.student_id = students.osis  AND  map_math.academic_year = students.academic_year 

WHERE students.last_first IS NOT NULL ;



--END------------------------------------------------------------------------------------------------