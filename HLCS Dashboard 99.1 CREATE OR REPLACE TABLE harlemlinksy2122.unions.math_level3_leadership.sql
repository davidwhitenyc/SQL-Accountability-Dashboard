

----[step 01.1] combine all grade level math level 3 datasources


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






