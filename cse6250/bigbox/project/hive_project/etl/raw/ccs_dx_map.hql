DROP TABLE IF EXISTS ccs_dx_map;
CREATE EXTERNAL TABLE ccs_dx_map (
    ICD_9_CM_CODE STRING,
    CCS_CATEGORY INT,
    CCS_CATEGORY_DESCRIPTION STRING,
    ICD_9_CM_CODE_DESCRIPTION STRING,
    OPTIONAL_CCS_CATEGORY STRING,
    OPTIONAL_CCS_CATEGORY_DESCRIPTION STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/ccs/ccs_dx_map'
tblproperties ("skip.header.line.count"="1");