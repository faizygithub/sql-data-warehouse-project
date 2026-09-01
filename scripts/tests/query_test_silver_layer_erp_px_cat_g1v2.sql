SELECT 
id,
cat,
subcat,
maintenance
FROM bronze.erp_px_cat_g1v2

-- CHeck for unwanted spaces
SELECT * FROM bronze.erp_px_cat_g1v2
WHERE cat!=TRIM(cat) OR subcat!=TRIM(subcat) OR maintenance!=TRIM(maintenance)


-- Data Standarization & Consistency

SELECT DISTINCT
cat
FROM bronze.erp_px_cat_g1v2

SELECT DISTINCT
subcat
FROM bronze.erp_px_cat_g1v2

SELECT DISTINCT
maintenance
FROM bronze.erp_px_cat_g1v2


-- Loading Silver data from silver.erp_px_cat_g1v2 

SELECT 
* 
FROM silver.erp_px_cat_g1v2
