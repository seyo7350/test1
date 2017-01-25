CREATE TABLE CAREER(
	C_SEQ NUMBER NOT NULL PRIMARY KEY,
	E_IDENNUM NUMBER NOT NULL,
	C_NAME VARCHAR2(100) NOT NULL,
	C_RANK VARCHAR2(50) NOT NULL,
	C_START VARCHAR2(10) NOT NULL,
	C_END VARCHAR2(10) NOT NULL
)

DROP TABLE CAREER

ALTER TABLE CAREER
ADD CONSTRAINT FK_C_E_IDENNUM FOREIGN KEY(E_IDENNUM) REFERENCES EMPLOYEE(E_IDENNUM)

create sequence C_SEQ
increment by 1
start with 1
maxvalue 99999999