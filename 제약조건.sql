-- 제약 조건
-- 1. NOT NULL - NULL이 들어오면 안돼!
CREATE TABLE TABLE_NOTNULL(
LOGIN_ID VARCHAR2(18) NOT NULL,
LOGIN_PWD VARCHAR2(18) NOT NULL,
TEL VARCHAR2(20));
-- 만약 안된다면 접속을 끊었다가 다시 해보기

INSERT INTO TABLE_NOTNULL (LOGIN_ID,LOGIN_PWD)
VALUES('KIMDE1031','KIM@103522');
/* INSERT INTO TABLE_NOTNULL (LOGIN_ID,LOGIN_PWD) VALUES('REDIAN1031',NULL); - 오류
   NULL을 ("TEST"."TABLE_NOTNULL"."LOGIN_PWD") 안에 삽입할 수 없습니다 - 많이 만나는 오류 구문 */

-- UPDATE TABLE_NOTNULL SET login_pwd=NULL WHERE LOGIN_ID='KIMDE1031'; - 오류
-- NULL로 ("TEST"."TABLE_NOTNULL"."LOGIN_PWD")을 갱신할 수 없습니다

SELECT * FROM TABLE_NOTNULL;

-- 제약 조건 확인하기
SELECT * FROM USER_CONSTRAINTS;

-- 제약 조건명 지정하기
CREATE TABLE TABLE_NOTNULL2(
LOGIN_ID VARCHAR2(20) CONSTRAINT TBL_NN_LGIND_NN NOT NULL ,
LOGIN_PWD VARCHAR2(20) CONSTRAINT TBL_NN_LGPWD_NN NOT NULL,
TEL VARCHAR2(20));

-- 제약 조건 추가
ALTER TABLE TABLE_NOTNULL2 MODIFY(TEL NOT NULL);
ALTER TABLE TABLE_NOTNULL2 MODIFY(TEL CONSTRAINT TBL_NN_TEL_NN NOT NULL); -- 이름을 주었을 때 알고 있으라고.. NULL값이라서 오류남

-- ALTER TABLE TABLE_NOTNULL MODIFY(TEL NOT NULL); - 오류
-- 이미 NULL값이 들어가 있기 때문에 안 됨
-- 아래처럼 NULL 값이 아닐 때면 됨
UPDATE TABLE_NOTNULL SET TEL='010-1111-1111' WHERE LOGIN_ID='KIMDE1031'; -- 값이 NULL 일 경우 수정  
ALTER TABLE TABLE_NOTNULL MODIFY(TEL NOT NULL); -- 수정 후 다시하면 잘 됨

-- 제약 조건 이름 변경
ALTER TABLE TABLE_NOTNULL2 RENAME CONSTRAINT SYS_C0011154 TO TBL_NN_TEL_NN; 

-- 제약 조건 삭제
ALTER TABLE TABLE_NOTNULL2 DROP CONSTRAINT TBL_NN_TEL_NN;

-- 2. UNIQUE : 유일하게 하나만 있는 값(중복 되지 않음)
CREATE TABLE TABLE_UNIQUE(
    LOGIN_ID VARCHAR2(20) UNIQUE,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20));

INSERT INTO TABLE_UNIQUE(LOGIN_ID,LOGIN_PWD, TEL)
VALUES('TEST_ID01','PW001','010-1234-1224'); -- 한 번 더 넣으면 중복이므로 안 넣어짐

SELECT * FROM TABLE_UNIQUE;

-- 제약 조건 확인
SELECT * FROM USER_CONSTRAINTS;

CREATE TABLE TABLE_UNIQUE2( -- 이름 주기
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBL_UNIQUE2_LOGNID_UNQ UNIQUE,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBL_UNIQUE2_LOGPWD_NN NOT NULL,
    TEL VARCHAR2(20));
    
-- 3. PRIMARY KEY(NOT NULL + UNIQUE) : 기본키 
CREATE TABLE TABLE_PK(
    LOGIN_ID VARCHAR2(20) PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20));

INSERT INTO TABLE_PK(LOGIN_ID,LOGIN_PWD, TEL)
VALUES('TEST_ID01','PW001','010-1234-1224'); -- 한 번 더 넣으면 유니크 조건 위배

INSERT INTO TABLE_PK(LOGIN_ID,LOGIN_PWD, TEL)
VALUES(NULL,'PW001','010-1234-1224'); -- 널 값이 들어갔으므로 NOT NULL 조건 위배

SELECT * FROM TABLE_PK;

CREATE TABLE TABLE_PK2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLPK2_LOGNID_PK PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLPK2_LOGPWD_PK NOT NULL,
    TEL VARCHAR2(20));
    
-- 제약 조건만 모아서 주기
CREATE TABLE TABLE_CONSTRAINT(
    ID NUMBER(6),
    NAME VARCHAR2(10),
    ADDR VARCHAR2(10),
    TEL VARCHAR2(20),
    CONSTRAINT TBL_ID_PK PRIMARY KEY(ID),
    CONSTRAINT TBL_TEL_UIQ UNIQUE(TEL));

-- 4. FOREIGN KEY(왜래키) : 서로 다른 테이블 간 관계 정의
CREATE TABLE DEPT_EMP(
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_FK PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13));
    
CREATE TABLE EMP_FK( -- 오류?
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_FK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_EMPNO_FK 
    REFERENCES DEPT_EMP(DEPTNO) ON DELETE CASCADE);
    
SELECT * FROM TAB;
    
-- ON DELETE CASCADE - 부모 테이블을 제거할 때 자식 테이블도 제거
-- ON DELETE SET NULL  - 부모 테이블이 제거될 때 자식의 값은 NULL 값으로 변경
    
INSERT INTO DEPT_FK VALUES(50,'DATABASE','SEOUL');

INSERT INTO EMP_FK VALUES(1111,'HANG','CLERK','7788','2018-12-02',1200,'',50); -- 오류
-- COMM까지 인데 DEPTNO가 들어가서
-- 항상 부모를 먼저 넣고 들어가야 됨 지금 부모는 DEPT

DELETE FROM DEPT_FK WHERE DEPTNO=50;

DROP TABLE EMP_FK;
DROP TABLE DEPT_EMP;

-- 5. CHECK : 열에 저장할 수 있는 값의 범위 또는 패턴 정의
CREATE TABLE TABLE_CHECK(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK_LOGID_PK PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLCK_LOGPWD_CK CHECK (LENGTH(LOGIN_PWD)>3), -- 패스워드가 3자리를 넘어야 된다는 것
    TEL VARCHAR2(20));
    
INSERT INTO TABLE_CHECK VALUES('TEST_ID','123','010-5122-3234')

-- 6. DEFAULT : 기본값 정하기   / 좀 많이 씀
CREATE TABLE TABLE_DEFAULT(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLDF_LOGID_PK PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) DEFAULT '1234', 
    TEL VARCHAR2(20));

CREATE TABLE TABLE_DEFAULT(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBDF_LOGID_PK PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) DEFAULT '1234',
    TEL VARCHAR2(20));
    
DESC TABLE_DEFAULT;

INSET INTO TABLE_DEFAULT VALUES('TEST_ID','','010-1234-1233');
INSET INTO TABLE_DEFAULT VALUES('TEST_ID2','4533','010-1222-3333');
INSET INTO TABLE_DEFAULT(LOGIN_ID, TEL) VALUES('TEST_ID1','010-1222-3333');

SELECT * FROM TABLE_DEFAULT;
    