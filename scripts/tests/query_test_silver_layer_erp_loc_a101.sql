USE DataWarehouse;

SELECT 
cid,
REPLACE (cid,'-',''),
cntry,
CASE WHEN TRIM(cntry)='DE' THEN 'Germany'
	WHEN TRIM(cntry) IN ('US','USA') THEN 'United States'
	WHEN TRIM(cntry)= '' OR cntry IS NULL THEN 'n/a'
	ELSE TRIM(cntry)

END AS cntry 
FROM bronze.erp_loc_a101 
WHERE REPLACE (cid,'-','') NOT IN 
(
SELECT cst_key FROM silver.crm_cust_info)

SELECT cst_key FROM silver.crm_cust_info

-- Data Standarization & Consistency

SELECT DISTINCT cntry
FROM bronze.erp_loc_a101 
ORDER BY cntry

SELECT DISTINCT cntry
FROM silver.erp_loc_a101
ORDER BY cntry

SELECT * FROM silver.erp_loc_a101
