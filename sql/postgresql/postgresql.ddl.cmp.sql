ALTER TABLE PHONEEJB_TABLE DROP CONSTRAINT FK_FOR_ADDRESSEJB_ ;
ALTER TABLE ORDEREJB_TABLE DROP CONSTRAINT FK4_FOR_CUSTOMEREJ ;
ALTER TABLE ORDEREJB_TABLE DROP CONSTRAINT FK0_FOR_LINEITEMEJ ;
ALTER TABLE FKS_FOR_ALIAS_CUSTOMER DROP CONSTRAINT FK_FOR_ALIASEJB_TA ;
ALTER TABLE LINEITEMEJB_TABLE DROP CONSTRAINT FK1_FOR_ORDEREJB_T ;
ALTER TABLE LINEITEMEJB_TABLE DROP CONSTRAINT FK_FOR_PRODUCTEJB_ ;
ALTER TABLE SPOUSEEJB_TABLE DROP CONSTRAINT FK_INFOEJBTAB ;
ALTER TABLE SPOUSEEJB_TABLE DROP CONSTRAINT FK7_CUSTOMEREJBTAB ;
ALTER TABLE INFOEJB_TABLE DROP CONSTRAINT FK_SPOUSEEJBTAB ;
ALTER TABLE COMPLEXPK_TABLE1 DROP CONSTRAINT FK_FOR_LINEITEMS ;
ALTER TABLE COMPLEXPK_LINEITEM_TABLE1 DROP CONSTRAINT FK_FOR_ID ;
ALTER TABLE FKS_ALIASNOOP_CUSTNOOP DROP CONSTRAINT FK2_ALIASEJBTAB ;
ALTER TABLE FKS_ALIASNOOP_CUSTNOOP DROP CONSTRAINT FK8_CUSTOMEREJBTAB ;
ALTER TABLE FKS_FOR_ALIAS_CUSTOMER DROP CONSTRAINT FK_FOR_CUSTOMEREJB ;
ALTER TABLE ALIASEJB_TABLE DROP CONSTRAINT FK1_FOR_CUSTOMEREJ ;
ALTER TABLE ALIASEJB_TABLE DROP CONSTRAINT FK2_FOR_CUSTOMEREJ ;
ALTER TABLE CREDITCARDEJB_TABLE DROP CONSTRAINT FK3_FOR_CUSTOMEREJ ;


DROP TABLE COMMON_TABLE;
CREATE TABLE COMMON_TABLE (ID INTEGER, BRANDNAME VARCHAR(25), PRICE NUMERIC(126), CONSTRAINT COMMON_TAB_PK PRIMARY KEY (ID));

DROP TABLE COMMON_TABLE2;
CREATE TABLE COMMON_TABLE2 (ID INTEGER, BRANDNAME VARCHAR(25), PRICE NUMERIC(126), CONSTRAINT COMMON_TAB_PK2 PRIMARY KEY (ID));

DROP TABLE COMMON_TABLE3;
CREATE TABLE COMMON_TABLE3 (ID INTEGER, BRANDNAME VARCHAR(25), PRICE NUMERIC(126), CONSTRAINT COMMON_TAB_PK3 PRIMARY KEY (ID));

DROP TABLE LOCALACCESSTEST_TABLE1;
CREATE TABLE LOCALACCESSTEST_TABLE1 ( ID INTEGER, NAME VARCHAR(25) , VALUE NUMERIC(126) , CONSTRAINT  LOCALACCESS_TAB1  PRIMARY KEY (ID));

DROP TABLE EBACCESSTEST_TABLE2;
CREATE TABLE EBACCESSTEST_TABLE2 ( ID INTEGER, NAME VARCHAR(25) , VALUE NUMERIC(126) , CONSTRAINT EBACCESSTEST_TABL2  PRIMARY KEY (ID));

DROP TABLE ENTITY_BEAN_TABLE1;
CREATE TABLE ENTITY_BEAN_TABLE1 ( KEY_ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT ENTITY_BEAN_TAB1  PRIMARY KEY (KEY_ID));

DROP TABLE PHONEEJB_TABLE;
CREATE TABLE PHONEEJB_TABLE ( ID VARCHAR(255)   PRIMARY KEY NOT NULL, AREA VARCHAR(255) , PHONE_NUMBER VARCHAR(255) , FK_FOR_ADDRESSEJB_TABLE VARCHAR(255) );

DROP TABLE ADDRESSEJB_TABLE;
CREATE TABLE ADDRESSEJB_TABLE ( ID VARCHAR(255)   PRIMARY KEY NOT NULL, STREET VARCHAR(255) , CITY VARCHAR(255) , STATE VARCHAR(255) , ZIP VARCHAR(255) , FK5_FOR_CUSTOMEREJB_TABLE VARCHAR(255) , FK6_FOR_CUSTOMEREJB_TABLE VARCHAR(255) );

DROP TABLE CUSTOMEREJB_TABLE;
CREATE TABLE CUSTOMEREJB_TABLE ( ID VARCHAR(255)   PRIMARY KEY NOT NULL, NAME VARCHAR(255) , COUNTRY BYTEA);

DROP TABLE ALIASEJB_TABLE;
CREATE TABLE ALIASEJB_TABLE ( ID VARCHAR(255)   PRIMARY KEY NOT NULL, ALIAS VARCHAR(255) , FK1_FOR_CUSTOMEREJB_TABLE VARCHAR(255) , FK2_FOR_CUSTOMEREJB_TABLE VARCHAR(255) );

DROP TABLE FKS_FOR_ALIAS_CUSTOMER;
CREATE TABLE FKS_FOR_ALIAS_CUSTOMER ( FK_FOR_CUSTOMEREJB_TABLE VARCHAR(255)  NOT NULL, FK_FOR_ALIASEJB_TABLE VARCHAR(255) );

DROP table FKS_ALIASNOOP_CUSTNOOP ;
CREATE TABLE FKS_ALIASNOOP_CUSTNOOP( FK8_FOR_CUSTOMEREJB_TABLE VARCHAR(255) , FK2_FOR_ALIASEJB_TABLE VARCHAR(255));

DROP TABLE CREDITCARDEJB_TABLE;
CREATE TABLE CREDITCARDEJB_TABLE ( ID VARCHAR(255)   PRIMARY KEY NOT NULL, TYPE VARCHAR(255) , EXPIRES VARCHAR(255) , APPROVED BOOLEAN , CREDITCARD_NUMBER VARCHAR(255) , BALANCE DOUBLE PRECISION, FK3_FOR_CUSTOMEREJB_TABLE VARCHAR(255) , FK_FOR_ORDEREJB_TABLE VARCHAR(255) );

DROP TABLE ORDEREJB_TABLE;
CREATE TABLE ORDEREJB_TABLE ( ID VARCHAR(255)   PRIMARY KEY NOT NULL, TOTALPRICE DOUBLE PRECISION , FK4_FOR_CUSTOMEREJB_TABLE VARCHAR(255) , FK0_FOR_LINEITEMEJB_TABLE VARCHAR(255) );

DROP TABLE PRODUCTEJB_TABLE;
CREATE TABLE PRODUCTEJB_TABLE ( ID VARCHAR(255)   PRIMARY KEY NOT NULL, NAME VARCHAR(255) , PRICE DOUBLE PRECISION , QUANTITY INT, PNUM INT );

DROP table INFOEJB_TABLE ;
CREATE TABLE INFOEJB_TABLE (ID VARCHAR(255) PRIMARY KEY NOT NULL, INFOSTREET VARCHAR(255), INFOCITY VARCHAR(255), INFOSTATE VARCHAR(255), INFOZIP VARCHAR(255), FK_FOR_SPOUSEEJB_TABLE VARCHAR(255) ) ;

DROP table SPOUSEEJB_TABLE ;
CREATE TABLE SPOUSEEJB_TABLE (ID VARCHAR(255) PRIMARY KEY NOT NULL,  FIRSTNAME VARCHAR(255), MAIDENNAME VARCHAR(255), LASTNAME VARCHAR(255), SOCSECNUM VARCHAR(255), FK7_FOR_CUSTOMEREJB_TABLE VARCHAR(255), FK_FOR_INFOEJB_TABLE VARCHAR(255) );

DROP TABLE LINEITEMEJB_TABLE;
CREATE TABLE LINEITEMEJB_TABLE ( ID VARCHAR(255)   PRIMARY KEY NOT NULL, QUANTITY INT , FK_FOR_PRODUCTEJB_TABLE VARCHAR(255) , FK1_FOR_ORDEREJB_TABLE VARCHAR(255) );

ALTER TABLE PHONEEJB_TABLE ADD CONSTRAINT FK_FOR_ADDRESSEJB_ FOREIGN KEY (FK_FOR_ADDRESSEJB_TABLE) REFERENCES ADDRESSEJB_TABLE (ID) ;

ALTER TABLE ALIASEJB_TABLE ADD CONSTRAINT FK1_FOR_CUSTOMEREJ FOREIGN KEY (FK1_FOR_CUSTOMEREJB_TABLE) REFERENCES CUSTOMEREJB_TABLE (ID) ;

ALTER TABLE ALIASEJB_TABLE ADD CONSTRAINT FK2_FOR_CUSTOMEREJ FOREIGN KEY (FK2_FOR_CUSTOMEREJB_TABLE) REFERENCES CUSTOMEREJB_TABLE (ID) ;

ALTER TABLE FKS_FOR_ALIAS_CUSTOMER ADD CONSTRAINT FK_FOR_CUSTOMEREJB FOREIGN KEY (FK_FOR_CUSTOMEREJB_TABLE) REFERENCES CUSTOMEREJB_TABLE (ID) ;

ALTER TABLE FKS_FOR_ALIAS_CUSTOMER ADD CONSTRAINT FK_FOR_ALIASEJB_TA FOREIGN KEY (FK_FOR_ALIASEJB_TABLE) REFERENCES ALIASEJB_TABLE (ID) ;

ALTER TABLE FKS_ALIASNOOP_CUSTNOOP  add constraint FK2_ALIASEJBTAB Foreign Key (FK2_FOR_ALIASEJB_TABLE) references ALIASEJB_TABLE(id) ;

ALTER TABLE FKS_ALIASNOOP_CUSTNOOP  add constraint FK8_CUSTOMEREJBTAB Foreign Key (FK8_FOR_CUSTOMEREJB_TABLE) references CUSTOMEREJB_TABLE(id) ; 

ALTER TABLE CREDITCARDEJB_TABLE ADD CONSTRAINT FK3_FOR_CUSTOMEREJ FOREIGN KEY (FK3_FOR_CUSTOMEREJB_TABLE) REFERENCES CUSTOMEREJB_TABLE (ID) ;

ALTER TABLE CREDITCARDEJB_TABLE ADD CONSTRAINT FK_FOR_ORDEREJB_TA FOREIGN KEY (FK_FOR_ORDEREJB_TABLE) REFERENCES ORDEREJB_TABLE (ID) ;

ALTER TABLE ORDEREJB_TABLE ADD CONSTRAINT FK4_FOR_CUSTOMEREJ FOREIGN KEY (FK4_FOR_CUSTOMEREJB_TABLE) REFERENCES CUSTOMEREJB_TABLE (ID) ;

ALTER TABLE ORDEREJB_TABLE ADD CONSTRAINT FK0_FOR_LINEITEMEJ FOREIGN KEY (FK0_FOR_LINEITEMEJB_TABLE) REFERENCES LINEITEMEJB_TABLE (ID) ;

ALTER TABLE LINEITEMEJB_TABLE ADD CONSTRAINT FK_FOR_PRODUCTEJB_ FOREIGN KEY (FK_FOR_PRODUCTEJB_TABLE) REFERENCES PRODUCTEJB_TABLE (ID) ;

ALTER TABLE LINEITEMEJB_TABLE ADD CONSTRAINT FK1_FOR_ORDEREJB_T FOREIGN KEY (FK1_FOR_ORDEREJB_TABLE) REFERENCES ORDEREJB_TABLE (ID) ;

ALTER TABLE ADDRESSEJB_TABLE ADD CONSTRAINT FK5_FOR_CUSTOMEREJ FOREIGN KEY (FK5_FOR_CUSTOMEREJB_TABLE) REFERENCES CUSTOMEREJB_TABLE (ID) ;

ALTER TABLE ADDRESSEJB_TABLE ADD CONSTRAINT FK6_FOR_CUSTOMEREJ FOREIGN KEY (FK6_FOR_CUSTOMEREJB_TABLE) REFERENCES CUSTOMEREJB_TABLE (ID) ;

ALTER TABLE SPOUSEEJB_TABLE add constraint FK7_CUSTOMEREJBTAB Foreign Key (FK7_FOR_CUSTOMEREJB_TABLE) references CUSTOMEREJB_TABLE(ID) ;

ALTER TABLE SPOUSEEJB_TABLE add constraint FK_INFOEJBTAB Foreign Key (FK_FOR_INFOEJB_TABLE) references INFOEJB_TABLE(ID) ; 

ALTER TABLE INFOEJB_TABLE add constraint FK_SPOUSEEJBTAB Foreign Key (FK_FOR_SPOUSEEJB_TABLE) references SPOUSEEJB_TABLE(ID) ; 

DROP  table COMPLEXPK_LINEITEM_TABLE1 ;
CREATE table COMPLEXPK_LINEITEM_TABLE1(ID varchar(25) , QUANTITY INTEGER, FK_FOR_ID INTEGER, FK_FOR_BRANDNAME varchar(25), constraint PK_LineItem_Tab1 primary key(ID));

DROP TABLE COMPLEXPK_TABLE1;
CREATE TABLE COMPLEXPK_TABLE1 ( ID INTEGER, BRANDNAME VARCHAR(25), PRICE FLOAT , PRODUCT BYTEA, FK_FOR_LINEITEMS varchar(25), CONSTRAINT COMPLEXPK_TAB1  PRIMARY KEY (ID, BRANDNAME));

ALTER TABLE COMPLEXPK_TABLE1 add constraint FK_FOR_LINEITEMS  Foreign Key (FK_FOR_LINEITEMS) references COMPLEXPK_LINEITEM_TABLE1(ID);

ALTER TABLE COMPLEXPK_LINEITEM_TABLE1 add constraint FK_FOR_ID Foreign Key (FK_FOR_ID, FK_FOR_BRANDNAME) references COMPLEXPK_TABLE1(ID,BRANDNAME) ;

DROP TABLE CMP20_ENTITYCMP_TABLE1;
CREATE TABLE CMP20_ENTITYCMP_TABLE1 ( KEY_ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , B BYTEA, CONSTRAINT CMP20_ENTITYCMP_TA  PRIMARY KEY (KEY_ID));

DROP  table CMP20_ENTITY_CTX_TABLE1 ; 
CREATE TABLE CMP20_ENTITY_CTX_TABLE1 (KEY_ID VARCHAR(255) NOT NULL, BRAND_NAME VARCHAR(255) , CONSTRAINT CMP20ENTITYCTXTAB primary key (KEY_ID) ) ;

DROP TABLE CMP20_HANDLE_TABLE1;
CREATE TABLE CMP20_HANDLE_TABLE1 ( KEY_ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_HANDLE_TAB  PRIMARY KEY (KEY_ID));

DROP TABLE CMP20_HOMEM_TABLE1;
CREATE TABLE CMP20_HOMEM_TABLE1 ( NAME VARCHAR(25) , STATE VARCHAR(25) , CODE VARCHAR(25) , ZIP INTEGER , ID INTEGER, EXPIRES VARCHAR(25) , STREET VARCHAR(25) , CARDBALANCE DOUBLE PRECISION , CITY VARCHAR(25) , HOMEPHONE VARCHAR(25) , WORKPHONE VARCHAR(25) , LASTNAME VARCHAR(25) , PAYMENTTYPE VARCHAR(25) , CREDITCARDNUMBER VARCHAR(25) , ACCOUNTNUMBER VARCHAR(25) , MIDDLENAME VARCHAR(25) , FIRSTNAME VARCHAR(25) , CONSTRAINT CMP20_HOMEM_TABLE2  PRIMARY KEY (ID));

DROP TABLE UNKNOWNPK_TABLE1;
CREATE TABLE UNKNOWNPK_TABLE1 ( MIDDLENAME VARCHAR(255)  , LASTNAME VARCHAR(25) , FIRSTNAME VARCHAR(25) , STREET VARCHAR(25) , CITY VARCHAR(25) , STATE VARCHAR(25) , ZIP INTEGER , ACCOUNTNUMBER VARCHAR(25) , ABC DECIMAL(29,0) NOT NULL, CONSTRAINT UNKNOWNPK_TABLE11  PRIMARY KEY (ABC));

DROP TABLE CMP_COMPLEXPK_TABLE1;
CREATE TABLE CMP_COMPLEXPK_TABLE1 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE FLOAT , PRODUCT BYTEA, CONSTRAINT CMP_COMPLEXPK_TABL  PRIMARY KEY (ID, BRAND_NAME));

DROP TABLE LRAPITEST_TABLE1;
CREATE TABLE LRAPITEST_TABLE1 ( ID INTEGER, NAME VARCHAR(25) , VALUE NUMERIC(126) , CONSTRAINT LRAPITEST_TABLE11  PRIMARY KEY (ID));

DROP TABLE LRAPITEST_TABLE2;
CREATE TABLE LRAPITEST_TABLE2 ( ID INTEGER, NAME VARCHAR(25) , VALUE NUMERIC(126) , CONSTRAINT LRAPITEST_TABLE21  PRIMARY KEY (ID));

DROP TABLE LRAPITEST_TABLE3;
CREATE TABLE LRAPITEST_TABLE3 ( ID VARCHAR(25)  NOT NULL, NAME VARCHAR(25) , VALUE NUMERIC(126) , CONSTRAINT LRAPITEST_TABLE31  PRIMARY KEY (ID));

DROP TABLE COMPAT_ENTITYCMP_TABLE1;
CREATE TABLE COMPAT_ENTITYCMP_TABLE1 ( KEY_ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT COMPAT_ENTITYCMP_T  PRIMARY KEY (KEY_ID));


DROP TABLE TX_NOT_TABLE3;
CREATE TABLE TX_NOT_TABLE3 ( KEY_ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT TX_NOT_TABLE31  PRIMARY KEY (KEY_ID));

DROP TABLE TX_NOT_TABLE4;
CREATE TABLE TX_NOT_TABLE4 ( KEY_ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT TX_NOT_TABLE41  PRIMARY KEY (KEY_ID));

DROP TABLE CMP11PK_TABLE1;
CREATE TABLE CMP11PK_TABLE1 ( CMPID VARCHAR(25) , CMPBRANDNAME VARCHAR(25) , CMPPRICE NUMERIC(126) , CONSTRAINT CMP11PK_TABLE11  PRIMARY KEY (CMPID));

DROP TABLE CMP11PK_TABLE2;
CREATE TABLE CMP11PK_TABLE2 ( CMPID INTEGER, CMPBRANDNAME VARCHAR(25) , CMPPRICE NUMERIC(126) , CONSTRAINT CMP11PK_TABLE21  PRIMARY KEY (CMPID));

DROP TABLE CMP11PK_TABLE3;
CREATE TABLE CMP11PK_TABLE3 ( CMPID FLOAT , CMPBRANDNAME VARCHAR(25) , CMPPRICE NUMERIC(126) , CONSTRAINT CMP11PK_TABLE31  PRIMARY KEY (CMPID));

DROP TABLE CMP11PK_TABLE4;
CREATE TABLE CMP11PK_TABLE4 ( PMIDINTEGER INTEGER, PMIDSTRING VARCHAR(25), PMIDFLOAT FLOAT , CMPBRANDNAME VARCHAR(25) , CMPPRICE NUMERIC(126) , CONSTRAINT CMP11PK_TABLE41  PRIMARY KEY (PMIDINTEGER, PMIDSTRING, PMIDFLOAT));

DROP TABLE CMP20_DEP_PKEY_TABLE1;
CREATE TABLE CMP20_DEP_PKEY_TABLE1 ( KEY_ID NUMERIC(126) , BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_DEP_PKEY_TAB  PRIMARY KEY (KEY_ID));

DROP TABLE CMP20_DEP_PKEY_TABLE2;
CREATE TABLE CMP20_DEP_PKEY_TABLE2 ( KEY_ID FLOAT , BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_DEP_PKEY_TA1  PRIMARY KEY (KEY_ID));

DROP TABLE CMP20_DEP_PKEY_TABLE3;
CREATE TABLE CMP20_DEP_PKEY_TABLE3 ( KEY_ID VARCHAR(50)  , BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_DEP_PKEY_TA2  PRIMARY KEY (KEY_ID));

DROP TABLE CMP20_DEP_PKEY_TABLE4;
CREATE TABLE CMP20_DEP_PKEY_TABLE4 ( PMIDINTEGER INTEGER, PMIDSTRING VARCHAR(25) , PMIDFLOAT FLOAT , BRANDNAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_DEP_PKEY_TA3  PRIMARY KEY (PMIDINTEGER, PMIDSTRING, PMIDFLOAT));

DROP TABLE TABLER5_DELETE;
CREATE TABLE TABLER5_DELETE ( ID VARCHAR(255)   PRIMARY KEY NOT NULL, NAME VARCHAR(255) , VALUE DECIMAL(18,0) NOT NULL, FK1_FOR_TABLER6_DELETE_ID VARCHAR(255) , FK2_FOR_TABLER6_DELETE_ID VARCHAR(255) , FK1_FOR_TABLER7_DELETE_ID VARCHAR(255) , FK2_FOR_TABLER7_DELETE_ID VARCHAR(255) );

DROP TABLE TABLER7_DELETE;
CREATE TABLE TABLER7_DELETE ( ID VARCHAR(255)   PRIMARY KEY NOT NULL, NAME VARCHAR(255) , VALUE DECIMAL(18,0) NOT NULL, FK_FOR_TABLER6_DELETE_ID VARCHAR(255) );

DROP TABLE TABLER6_DELETE;
CREATE TABLE TABLER6_DELETE ( ID VARCHAR(255)   PRIMARY KEY NOT NULL, NAME VARCHAR(255) , VALUE DECIMAL(18,0) NOT NULL);

ALTER TABLE TABLER5_DELETE ADD CONSTRAINT FK1_FOR_TABLER6_DE FOREIGN KEY (FK1_FOR_TABLER6_DELETE_ID) REFERENCES TABLER6_DELETE (ID) ;

ALTER TABLE TABLER5_DELETE ADD CONSTRAINT FK2_FOR_TABLER6_DE FOREIGN KEY (FK2_FOR_TABLER6_DELETE_ID) REFERENCES TABLER6_DELETE (ID) ;

ALTER TABLE TABLER5_DELETE ADD CONSTRAINT FK1_FOR_TABLER7_DE FOREIGN KEY (FK1_FOR_TABLER7_DELETE_ID) REFERENCES TABLER7_DELETE (ID) ;

ALTER TABLE TABLER5_DELETE ADD CONSTRAINT FK2_FOR_TABLER7_DE FOREIGN KEY (FK2_FOR_TABLER7_DELETE_ID) REFERENCES TABLER7_DELETE (ID) ;

ALTER TABLE TABLER7_DELETE ADD CONSTRAINT FK_FOR_TABLER6_DEL FOREIGN KEY (FK_FOR_TABLER6_DELETE_ID) REFERENCES TABLER6_DELETE (ID) ;

DROP TABLE CMP20_LSECP_TABLE1;
CREATE TABLE CMP20_LSECP_TABLE1 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_LSECP_TAB1  PRIMARY KEY (ID));

DROP TABLE CMP20_LSECP_TABLE2;
CREATE TABLE CMP20_LSECP_TABLE2 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_LSECP_TAB2  PRIMARY KEY (ID));

DROP TABLE CMP20_LSECP_TABLE3;
CREATE TABLE CMP20_LSECP_TABLE3 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_LSECP_TAB3  PRIMARY KEY (ID));

DROP TABLE CMP20_LSECR_TABLE1;
CREATE TABLE CMP20_LSECR_TABLE1 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_LSECR_TAB1  PRIMARY KEY (ID));

DROP TABLE CMP20_LSECR_TABLE2;
CREATE TABLE CMP20_LSECR_TABLE2 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_LSECR_TAB2  PRIMARY KEY (ID));

DROP TABLE CMP20_LSECR_TABLE3;
CREATE TABLE CMP20_LSECR_TABLE3 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_LSECR_TAB3  PRIMARY KEY (ID));

DROP TABLE CMP20_SEC_TABLE1;
CREATE TABLE CMP20_SEC_TABLE1 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_SEC_TAB1  PRIMARY KEY (ID));

DROP TABLE CMP20_SEC_TABLE2;
CREATE TABLE CMP20_SEC_TABLE2 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_SEC_TAB2  PRIMARY KEY (ID));

DROP TABLE CMP20_SECP_TABLE1;
CREATE TABLE CMP20_SECP_TABLE1 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_SECP_TAB11  PRIMARY KEY (ID));

DROP TABLE CMP20_SECP_TABLE2;
CREATE TABLE CMP20_SECP_TABLE2 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_SECP_TAB2  PRIMARY KEY (ID));

DROP TABLE CMP20_SECP_TABLE3;
CREATE TABLE CMP20_SECP_TABLE3 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_SECP_TAB3  PRIMARY KEY (ID));

DROP TABLE CMP_SEC_TABLE1;
CREATE TABLE CMP_SEC_TABLE1 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP_SEC_TAB1  PRIMARY KEY (ID));

DROP TABLE CMP_SEC_TABLE2;
CREATE TABLE CMP_SEC_TABLE2 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP_SEC_TAB2  PRIMARY KEY (ID));

DROP TABLE CMP_SECP_TABLE1;
CREATE TABLE CMP_SECP_TABLE1 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP_SECP_TAB1  PRIMARY KEY (ID));

DROP TABLE CMP_SECP_TABLE2;
CREATE TABLE CMP_SECP_TABLE2 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP_SECP_TAB2  PRIMARY KEY (ID));

DROP TABLE CMP_SECP_TABLE3;
CREATE TABLE CMP_SECP_TABLE3 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP_SECP_TAB3  PRIMARY KEY (ID));

DROP TABLE CMP20_SECRASP_TABLE1;
CREATE TABLE CMP20_SECRASP_TABLE1 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_SECRASP_TABL  PRIMARY KEY (ID));

DROP TABLE CMP20_SECRASP_TABLE2;
CREATE TABLE CMP20_SECRASP_TABLE2 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_SECRASP_TAB1  PRIMARY KEY (ID));

DROP TABLE CMP20_SECRASP_TABLE3;
CREATE TABLE CMP20_SECRASP_TABLE3 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP20_SECRASP_TAB2  PRIMARY KEY (ID));

DROP TABLE CMP_SECRASP_TABLE1;
CREATE TABLE CMP_SECRASP_TABLE1 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP_SECRASP_TAB2  PRIMARY KEY (ID));

DROP TABLE CMP_SECRASP_TABLE2;
CREATE TABLE CMP_SECRASP_TABLE2 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP_SECRASP_TAB3  PRIMARY KEY (ID));

DROP TABLE CMP_SECRASP_TABLE3;
CREATE TABLE CMP_SECRASP_TABLE3 ( ID INTEGER, BRAND_NAME VARCHAR(25) , PRICE NUMERIC(126) , CONSTRAINT CMP_SECRASP_TAB4  PRIMARY KEY (ID));

DROP table TIMER_TABLE1 ;
CREATE TABLE TIMER_TABLE1 (KEY_ID INTEGER ,  BRAND_NAME VARCHAR(255), PRICE NUMERIC(126) , CONSTRAINT TIMER_TAB1 PRIMARY KEY (KEY_ID) );

DROP table TIMER_FLAGSTORE ;
CREATE TABLE TIMER_FLAGSTORE (KEY_ID INTEGER , BRAND_NAME VARCHAR(255) , PRICE NUMERIC(126) , REQUIRESNEWACCESSED BYTEA , REQUIREDACCESSED BYTEA , CONSTRAINT TIMER_FSTORE PRIMARY KEY (KEY_ID) );

DROP table CMP20_JACC_TABLE1 ;
CREATE TABLE CMP20_JACC_TABLE1 (ARG1 VARCHAR(255) , ARG2 INTEGER ,  ARG3 INTEGER , CONSTRAINT CMP20_JACC_TAB PRIMARY KEY (ARG1,ARG2,ARG3) );

DROP TABLE EMPLOYEEEJB ;
CREATE TABLE EMPLOYEEEJB (HIREDATE DATE , ID INTEGER , FIRSTNAME VARCHAR(256) , SALARY NUMERIC(126) NOT NULL, LASTNAME VARCHAR(256) , EMPLOYEEEJB_ID INTEGER , DEPARTMENTEJB_ID INTEGER , CONSTRAINT PK_EMPLOYEEEJB PRIMARY KEY (ID)) ;

DROP TABLE DEPARTMENTEJB ;
CREATE TABLE DEPARTMENTEJB (NAME VARCHAR(256) , ID INTEGER , CONSTRAINT PK_DEPARTMENTEJB PRIMARY KEY (ID)) ;

ALTER TABLE EMPLOYEEEJB ADD CONSTRAINT FK_MANAGER FOREIGN KEY (EMPLOYEEEJB_ID) REFERENCES EMPLOYEEEJB (ID) ;
ALTER TABLE EMPLOYEEEJB ADD CONSTRAINT FK_DEPARTMENT FOREIGN KEY (DEPARTMENTEJB_ID) REFERENCES DEPARTMENTEJB (ID) ;
