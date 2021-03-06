DROP TABLE IF EXISTS cptevents;
CREATE EXTERNAL TABLE cptevents (
    ROW_ID INT,
    SUBJECT_ID INT,
    HADM_ID INT,
    COSTCENTER VARCHAR(10),
    CHARTDATE TIMESTAMP,
    CPT_CD VARCHAR(10),
    CPT_NUMBER INT,
    CPT_SUFFIX VARCHAR(5),
    TICKET_ID_SEQ INT,
    SECTIONHEADER VARCHAR(50),
    SUBSECTIONHEADER VARCHAR(255),
    DESCRIPTION VARCHAR(200)
  )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (    "separatorChar" = ",",    "quoteChar"     = "\"" )
STORED AS TEXTFILE
LOCATION '/mimic/cptevents'
tblproperties ("skip.header.line.count"="1");
