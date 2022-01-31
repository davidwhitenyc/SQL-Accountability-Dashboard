--Math Level 3 Overall Benchmark
CREATE OR REPLACE TABLE
`harlemlinksy2122.datasources.benchmarks_math_level3` AS

SELECT
osis,
CASE
    WHEN SUM(points_earned)/SUM(points_available) >= .75 THEN "Achieved Benchmark"
    WHEN SUM(points_earned)/SUM(points_available) BETWEEN .6 AND .74999999 THEN "Approaching Benchmark"
    WHEN SUM(points_earned)/SUM(points_available) < .6 THEN "Below Benchmark"
    ELSE ""
END AS results_benchmark

FROM `harlemlinksy2122.unions.math_level3_leadership_sy21_22` 

GROUP BY 1 ;





--ELA Test Prep Overall Benchmark
CREATE OR REPLACE TABLE
`harlemlinksy2122.datasources.benchmarks_test_prep_ela` AS

SELECT
osis,
CASE
    WHEN SUM(points_earned)/SUM(points_available) >= .75 THEN "Achieved Benchmark"
    WHEN SUM(points_earned)/SUM(points_available) BETWEEN .6 AND .74999999 THEN "Approaching Benchmark"
    WHEN SUM(points_earned)/SUM(points_available) < .6 THEN "Below Benchmark"
    ELSE ""
END AS results_benchmark

FROM `harlemlinksy2122.datasources.ela_tp_leadership` 

GROUP BY 1 ;





--Math Test Prep Overall Benchmark
CREATE OR REPLACE TABLE
`harlemlinksy2122.datasources.benchmarks_test_prep_math` AS

SELECT
osis,
CASE
    WHEN SUM(points_earned)/SUM(points_available) >= .75 THEN "Achieved Benchmark"
    WHEN SUM(points_earned)/SUM(points_available) BETWEEN .6 AND .74999999 THEN "Approaching Benchmark"
    WHEN SUM(points_earned)/SUM(points_available) < .6 THEN "Below Benchmark"
    ELSE ""
END AS results_benchmark

FROM `harlemlinksy2122.datasources.math_tp_leadership`

GROUP BY 1 ;