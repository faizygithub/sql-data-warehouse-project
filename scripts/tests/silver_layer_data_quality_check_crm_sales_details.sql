--Check for invalid date

SELECT 
NULLIF(sls_ord_dt, 0) AS sls_ord_dt
FROM bronze.crm_sales_details
WHERE sls_ord_dt <=0 
OR LEN(sls_ord_dt)!= 8
OR sls_ord_dt> 20500101
OR sls_ord_dt <19000101

SELECT
* FROM bronze.crm_sales_details


SELECT 
NULLIF(sls_ship_dt, 0) AS sls_ship_dt
FROM bronze.crm_sales_details
WHERE sls_ship_dt <=0 
OR LEN(sls_ship_dt)!= 8
OR sls_ship_dt> 20500101
OR sls_ship_dt <19000101

SELECT
* FROM bronze.crm_sales_details


SELECT 
NULLIF(sls_due_dt, 0) AS sls_due_dt
FROM bronze.crm_sales_details
WHERE sls_due_dt <=0 
OR LEN(sls_due_dt)!= 8
OR sls_due_dt> 20500101
OR sls_due_dt <19000101

-- Check for invalid date orders
SELECT * FROM bronze.crm_sales_details
WHERE sls_ord_dt >sls_ship_dt OR sls_ord_dt >sls_due_dt


--Check Data Consistancy Between Sales, Quantity and Price
--->> Sales = Quantity * Price
-->> Values must not be NULL,zero or negative

SELECT DISTINCT
sls_sales AS old_sls_sales,
sls_quantity,
sls_price AS old_sls_price,

CASE WHEN sls_sales IS NULL OR sls_sales <=0 OR sls_sales !=sls_quantity*ABS(sls_price)
	THEN sls_quantity * ABS(sls_price) 
	ELSE sls_sales
END AS sls_sales,

CASE WHEN sls_price IS NULL OR sls_price<=0
	 THEN sls_sales/NULLIF(sls_quantity,0)
	 ELSE sls_price
END AS sls_price

FROM bronze.crm_sales_details
WHERE sls_sales <=0 OR sls_quantity <=0 OR sls_price <=0
OR sls_sales != (sls_quantity * sls_price)
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
ORDER BY sls_sales, sls_quantity, sls_price
