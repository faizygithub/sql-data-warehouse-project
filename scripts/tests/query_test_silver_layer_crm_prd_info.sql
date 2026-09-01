-- Checks for duplicates or NUll in primary key
-- Expectation: No Results

SELECT 
prd_id,
COUNT(*)

FROM bronze.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 or prd_id IS NULL

-- Checks for unwanted Spaces
-- Expectation: No Results

SELECT 
prd_nm
FROM bronze.crm_prd_info
WHERE prd_nm !=TRIM(prd_nm)

-- Checks for NUlls or Negatives NUmbers
-- Expectation: No Results
 
-- Data Standarization and Consistancy

SELECT DISTINCT 
prd_line 

FROM bronze.crm_prd_info

WHERE REPLACE(SUBSTRING(prd_key, 1, 5), '-', '_') NOT IN 
(SELECT DISTINCT id FROM bronze.erp_px_cat_g1v2 )

SELECT DISTINCT id FROM bronze.erp_px_cat_g1v2


SELECT 
prd_id,
COUNT(*)

FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 or prd_id IS NULL

SELECT 
prd_nm
FROM silver.crm_prd_info
WHERE prd_nm !=TRIM(prd_nm)

-- Data Standarization and Consistancy

SELECT DISTINCT 
prd_line 

FROM silver.crm_prd_info

-- Check for invalid Date Orders

SELECT *
FROM silver.crm_prd_info
WHERE prd_end_dt< prd_start_dt


SELECT *
FROM silver.crm_prd_info
