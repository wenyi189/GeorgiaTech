DROP TABLE IF EXISTS datetimeevents;
CREATE EXTERNAL TABLE datetimeevents (
    ROW_ID INT,
    SUBJECT_ID INT,
    HADM_ID INT,
    ICUSTAY_ID INT,
    ITEMID INT,
    CHARTTIME TIMESTAMP,
    STORETIME TIMESTAMP,
    CGID INT,
    VALUE TIMESTAMP,
    VALUEUOM VARCHAR(50),
    WARNING SMALLINT,
    ERROR SMALLINT,
    RESULTSTATUS VARCHAR(50),
    STOPPED VARCHAR(50)
  )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (    "separatorChar" = ",",    "quoteChar"     = "\"" )
STORED AS TEXTFILE
LOCATION '/mimic/datetimeevents'
tblproperties ("skip.header.line.count"="1");
