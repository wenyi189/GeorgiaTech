DROP TABLE IF EXISTS microbiologyevents;
CREATE EXTERNAL TABLE microbiologyevents (
    ROW_ID INT,
    SUBJECT_ID INT,
    HADM_ID INT,
    ITEMID INT,
    CHARTTIME TIMESTAMP,
    VALUE VARCHAR(200),
    VALUENUM DOUBLE,
    VALUEUOM VARCHAR(20),
    FLAG VARCHAR(20)
  )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (    "separatorChar" = ",",    "quoteChar"     = "\"" )
STORED AS TEXTFILE
LOCATION '/mimic/microbiologyevents'
tblproperties ("skip.header.line.count"="1");
