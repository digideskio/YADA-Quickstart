CREATE DATABASE IF NOT EXISTS YADA;		
GRANT ALL ON YADA.* TO 'yada'@'localhost' IDENTIFIED BY 'yada' WITH GRANT OPTION;

DROP TABLE IF EXISTS YADA.YADA_QUERY;
CREATE TABLE IF NOT EXISTS YADA.YADA_QUERY
(	
	QNAME        VARCHAR(255)  NOT NULL, 
	QUERY        VARCHAR(4000) NOT NULL, 
	APP          VARCHAR(20), 
	CREATED      DATE,
	MODIFIED     DATE, 
	CREATED_BY   VARCHAR(20), 
	MODIFIED_BY  VARCHAR(20), 
	LAST_ACCESS  DATE, 
	ACCESS_COUNT INT DEFAULT 0
);

DROP TABLE IF EXISTS YADA.YADA_QUERY_CONF;
CREATE TABLE IF NOT EXISTS YADA.YADA_QUERY_CONF 
(	
	APP     VARCHAR(20)   NOT NULL, 
	SOURCE  VARCHAR(4000) NOT NULL, 
	VERSION VARCHAR(20)
);

DROP TABLE IF EXISTS YADA.YADA_PARAMS;
CREATE TABLE IF NOT EXISTS YADA.YADA_PARAMS 
(	
	TARGET VARCHAR(20)   NOT NULL, 
	NAME   VARCHAR(20)   NOT NULL, 
	VALUE  VARCHAR(4000) NOT NULL, 
	RULE   VARCHAR(1)    DEFAULT 1
);
   
DROP TABLE IF EXISTS YADA.YADA_TEST;
CREATE TABLE IF NOT EXISTS YADA.YADA_TEST 
(	
	COL1 VARCHAR(3), 
	COL2 INT,
	COL3 DOUBLE(2,1), 
	COL4 DATE,
	COL5 TIMESTAMP
);

USE YADA;

INSERT into YADA_QUERY_CONF (APP,SOURCE,VERSION) values ('YADA','java:comp/env/jdbc/yada',null);
INSERT into YADA_QUERY_CONF (APP,SOURCE,VERSION) values ('QGO','http://www.ebi.ac.uk/QuickGO/GTerm?',null);
INSERT into YADA_QUERY_CONF (APP,SOURCE,VERSION) values ('YADAFSIN','file:///io/in',null);
INSERT into YADA_QUERY (qname,query,created_by,app) VALUES ('YADA default','select ''YADA is alive''','YADABOT','YADA');
-- THESE LINES DON'T WORK IN WORKBENCH, BUT MAYBE ON CLI
-- source YADA_query_essentials.sql;
-- source YADA_query_tests.sql;
