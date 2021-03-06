DROP TABLE IF EXISTS ccs_proc_map;
CREATE EXTERNAL TABLE ccs_proc_map (
    ICD_9_CM_CODE STRING,
    CCS_CATEGORY INT,
    CCS_CATEGORY_DESCRIPTION STRING,
    ICD_9_CM_CODE_DESCRIPTION STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (    "separatorChar" = ",",    "quoteChar"     = "'" )
STORED AS TEXTFILE
LOCATION '/ccs/ccs_proc_map'
tblproperties ("skip.header.line.count"="1");
s
