--������ ���� : ������ ���̽� �޸�, ����, �����, ����, ��ü�� ���� ����Ŭ
--��� �ʿ��� �߿��� �����Ͱ� ������ ���

- scott �������� ��밡���� ������ ����

select * from dict;

SELECT * FROM user_tables;
SELECT * FROM all_tables;

-- �� : ���� ���̺�

CREATE view vm_emp20 as  (select empno, ename, job, deptno
                          from emp
                          where deptno=20);
select * from vm_emp20;
-- �� Ȯ��
select * from user_views;

CREATE VIEW vm_emp30all as select * from emp;

-- ������ �並 ���� INSERT �۾�

INSERT INTO vm_emp30all values(7777,'KIM','JUNKI', NULL,'20/10/19',2650,NULL,20);

SELECT * FROM VM_EMP30ALL;
SELECT * FROM EMP;
-- ��� SELECT�� �����ϵ��� ����
create view VM_EMP_READ AS SELECT EMPNO, ENAME, JOB FROM EMP WITH READ ONLY;
--������ �信 ������ �����Ѱ�?
SELECT
     *
FROM user_updatable_columns where table_name = 'VM_EMP30ALL';

SELECT
     *
FROM user_updatable_columns where table_name = 'VM_EMP_READ';
-- �並 ����ϴ� ����
-- ����(���� ���̺��� ������ �ִ� �ΰ��� ���� ����)
SELECT * FROM EMP; --SAL,COMM
-- ��������, ���ΰ� ���� ������ ��������� �����ؼ� ���

--�ε���  - �����̱⶧���� SELECT���� ȿ���� ����

-- SCOTT ������ ������ �ε��� ���� ����
SELECT * FROM USER_INDEXES;
--�⺻Ű ���� => �ڵ� �ε����� ��
-- �ε��� ����(EMP ���̺��� SAL ���� �ε��� ����)
CREATE INDEX IDX_EMP_SQL ON EMP(SAL);

SELECT * FROM EMP WHERE SAL = 1250;

-----
CREATE TABLE USERTBL(
USERID CHAR(8)
CREATE TABLE USERTBL(
     USERID CHAR(8) NOT NULL PRIMARY KEY,
     USERNAME NVACAHR2(10) NOT NULL,
     BIRTHYEAR NUMBER(4) NOT NULL,
     MOBILE CHAR(3));
SELECT INDEX_NAME,UNIQUENESS,INDEX_TYPE FROM USER_INDEXES;

-- ������ : Ư�� ��Ģ�� �´� ���� ���� ����
--        : �Խñ� ��ȣ, ��ǰ ��ȣ, �ֹ���ȣ....

CREATE SEQUENCE DEPT_SEQ
INCREMENT BY 10 -- 10�� ����
START WITH 10 -- ó�� ���� ����
MAXVALUE 90 --����������
MINVALUE 0 --START ������ �۰� ����
NOCYCLE CACHE 2; -- �ݺ����� ����, �̸� ������ ������ ����

CREATE TABLE DEPT_SEQ_TBL AS SELECT * FROM DEPT WHERE 1<>1;

-- �������� �̿��ؼ� ����
SELECT * FROM DEPT_SEQ_TBL;

INSERT INTO DEPT_SEQ_TBL VALUES(DEPT_SEQ.NEXTVAL,'DATABASE','SEOUL');

-- �ó��� ����

ALTER SEQUENCE DEPT_SEQ INCREMENT BY 3 MAXVALUE 99 CYCLE;

-- ������ ����� ������ Ȯ���ϱ�
SELECT DEPT_SEQ.CURRVAL FROM DUAL;

-- SYNONYM(���Ǿ�) : ���� ��Ī
-- ���̺�, �� , ������ �� ��ü�鿡�� ��� ����� �� �ִ� �̸� �ο�

CREATE SYNOMYM E FOR EMP;

SELECT * FROM E;
DROP SYNONYM E;

