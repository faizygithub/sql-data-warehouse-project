
SELECT 
* 
FROM bronze.crm_cust_info

SELECT 
cst_id,
COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
Having COUNT(*) > 1 OR cst_id IS NULL

-- Check for unwnanted spaces
-- Expectation: NO Results
SELECT 
cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname!= TRIM(cst_firstname)

SELECT 
cst_lastname
FROM silver.crm_cust_info
WHERE cst_firstname!= TRIM(cst_firstname)

SELECT 
cst_gndr
FROM silver.crm_cust_info
WHERE cst_gndr!= TRIM(cst_gndr)

-- Data Standarization & Consistency Checks

SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info

SELECT * FROM silver.crm_cust_info

