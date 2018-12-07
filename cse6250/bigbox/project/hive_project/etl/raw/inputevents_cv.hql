DROP TABLE IF EXISTS inputevents_cv;
CREATE EXTERNAL TABLE inputevents_cv (
    ROW_ID INT,
    SUBJECT_ID INT,
    HADM_ID INT,
    ICUSTAY_ID INT,
    CHARTTIME TIMESTAMP,
    ITEMID INT,
    AMOUNT DOUBLE,
    AMOUNTUOM VARCHAR(30),
    RATE DOUBLE,
    RATEUOM VARCHAR(30),
    STORETIME TIMESTAMP,
    CGID INT,
    ORDERID INT,
    LINKORDERID INT,
    STOPPED VARCHAR(30),
    NEWBOTTLE INT,
    ORIGINALAMOUNT DOUBLE,
    ORIGINALAMOUNTUOM VARCHAR(30),
    ORIGINALROUTE VARCHAR(30),
    ORIGINALRATE DOUBLE,
    ORIGINALRATEUOM VARCHAR(30),
    ORIGINALSITE VARCHAR(30)
  )
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/mimic/inputevents_cv'
tblproperties ("skip.header.line.count"="1");