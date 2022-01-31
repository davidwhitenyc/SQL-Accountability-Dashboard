-----------------------------------------------------------------------------------------------------
--run this combined script to REFRESH FINANCIAL DATA of the  HLCS Data & Accountablitiy Dashboard---
-----------------------------------------------------------------------------------------------------
--[step 08.1] import data from long-format finance ledgers
SELECT * 
FROM `harlemlink-accountability.datasources.budget_vs_actuals` ;


SELECT * 
FROM `harlemlink-accountability.datasources.statement_of_financial_position` ;


SELECT * 
FROM `harlemlink-accountability.datasources.statement_of_activity` ;


--END------------------------------------------------------------------------------------------------