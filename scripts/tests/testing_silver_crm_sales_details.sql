USE DataWarehouse;
SELECT 
sls_ord_num,
sls_prd_key,
sls_cust_id,
sls_ord_dt,
sls_ship_dt,
sls_sales,
sls_quantity,
sls_price
FROM bronze.crm_sales_details
--WHERE sls_ord_num!= TRIM(sls_ord_num)
--WHERE sls_prd_key NOT IN (SELECT prd_key FROM silver.crm_prd_info)
WHERE sls_cust_idn NOT IN (SELECT cst_id FROM silver.crm_cust_info)