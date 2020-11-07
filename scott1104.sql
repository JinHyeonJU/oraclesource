-- scott ������ ������ �ִ� �� ���̺� ����
select * from tab;

-- emp ���̺��� ����
DESC emp;

--emp ���̺� ��� ���� ��ȸ
select * from emp;

-- emp ���̺��� Ư�� �ʵ常 ��ȸ
SELECT ename, job, sal from emp;

-- �ߺ� ���ڵ� ������ �� ��ȸ
SELECT DISTINCT deptno FROM emp;

-- alais(��Ī) : AS
SELECT empno AS �����ȣ FROM emp; 

SELECT ename, sal, sal*12+comm AS ����, comm FROM emp;

SELECT ename as ����̸�, job as "�� å" from emp;

-- ORDER BY : �����Ͽ� ��ȸ

-- �ϳ��� ���� ������ �־� �������� ��ȸ
SELECT ename,sal FROM emp ORDER BY sal;

-- �ϳ��� ���� ������ �־� �������� ��ȸ
SELECT ename,sal FROM emp ORDER BY sal DESC;

-- ��ü �����͸� ��ȸ(�����ȣ ��������)
SELECT * FROM emp ORDER BY empno;

-- �μ���ȣ�� ��������, �μ���ȣ�� �����ϴٸ� �޿��� ��������
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;

SELECT EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME,job, MGR AS MANAGER,
hiredate, SAL AS SALARY, COMM AS COMMISIION, DEPTNO AS DEPARTMENT_NO from emp ORDER BY deptno DESC, ename ASC;

SELECT * FROM emp WHERE empno = 7499 AND deptno = 30;
SELECT * from emp WHERE deptno = 30 OR job = 'CLERK';
SELECT * FROM emp WHERE deptno = 20 OR job = 'salesman';

-- IN�� ����ؼ� �μ���ȣ�� 10,20���� ������� ��ȸ
SELECT * FROM emp WHERE deptno IN(10, 20);



-- BETWEEN A AND B (���̿�)
-- 1)�޿��� 2000�̻� 3000������ ������� ��ȸ
SELECT * FROM emp WHERE sal >= 2000 AND sal<=3000;

SELECT *
FROM emp
WHERE sal BETWEEN 2000 AND 3000;

-- 2) �޿��� 2000�̻� 3000 ���ϰ� �ƴ� ������� ��ȸ(NOT BETWEEN)
SELECT *
FROM emp
WHERE sal NOT BETWEEN 2000 AND 3000; 

-- �� LIKE : ���ڿ� �˻� ���(s�� �����ϴ�, h�� ������, ����� t�� ������)
SELECT * FROM emp WHERE job LIKE 's%'
SELECT * FROM emp WHERE job LIKE '_s%'
SELECT * FROM emp WHERE job LIKE '%s%'

-- IS NULL
SELECT * FROM emp WHERE comm IS NULL;

-- MGR (�Ŵ���ID)�� NULL�� �ƴ� �������
SELECT * FROM emp WHERE mgr IS NOT NULL;

-- �����տ����� : ������(UNION), ������(INTERSECT), ������(MINUS)
-- �������̺��� ���

-- 1)DEPTNO �� 10�� ���̺�� DEPTNO �� 20�� ����� ���ؼ� ���� �����ֱ�(UNION : �ٸ����̺��϶�)
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 20;
-- 1.1)UNION : ALL �� ������� �ߺ������� ���� ���
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;
-- 1.2)UNION ALL : �ߺ��� �����͵� ���
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION ALL
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;
-- 2)�μ���ȣ�� 10�� �ƴ� ������� ���� ��ȸ
SELECT empno, ename, sal, deptno FROM emp
MINUS
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;
-- 3)�μ���ȣ�� 10�� ������� ��ȸ
SELECT empno, ename, sal, deptno FROM emp
INTERSECT
SELECT empno, ename, sal, deptno FROM emp WHERE deptno=10;

-- PRACTICE) 20, 30�� �μ��� �ٹ��ϰ� �ִ� ��� �� SAL �� 2000�ʰ��� ����� ���� �� ����
-- ����� SELECT ���� ����Ͽ�, �����ȣ, �̸�, �޿�, �μ���ȣ�� ����ϴ�
-- SQL �� �ۼ��ϱ�

--���տ����� ������� �ʴ� ���
SELECT deptno, ename, sal, empno
FROM emp
WHERE deptno IN(20,30) AND sal > 2000;
--���տ����ڸ� ����ϴ� ���
-- ������(INTERSECT)
SELECT deptno, ename, sal, empno FROM emp
INTERSECT
SELECT deptno, ename, sal, empno FROM emp WHERE deptno IN(20,30) AND sal > 2000;
-- ������(MINUS)
SELECT deptno, ename, sal, empno FROM emp WHERE sal>2000
MINUS
SELECT deptno, ename, sal, empno FROM emp WHERE deptno = 10;
-- ������(UNION)
SELECT deptno, ename, sal, empno FROM emp WHERE sal>2000 AND deptno=20
UNION
SELECT deptno, ename, sal, empno FROM emp WHERE sal>2000 AND deptno=30;


-- ����Ŭ �Լ� (Ŭ������ ��� ��)
-- 1) ���� �Լ� : UPPER(�빮��), LOWER(�ҹ���), INITCAP(ù�ܾ� �빮��)
--              LENGTH, LENGTHB
-- ename �� UPPER, LOWER, INITCAP���� �����Ͽ� ��ȸ
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename)
FROM emp;

-- DUAL ���̺� �̿�(SYS�� �����ִ� ���̺�, �ӽÿ����̳� �Լ��� �������
-- Ȯ���ϴ� �뵵)
-- LENGTHB : ����Ʈ
-- LENGTH : ����
SELECT LENGTH('��������'), LENGTHB('��������') FROM DUAL;

-- ��å �̸��� 6���� �̻��� ������� ���� ����
SELECT * FROM emp WHERE LENGTH(job) >= 6;

-- 1) ���ڿ� �Լ� : SUBSTR(���̺�, a, b) a��° ���ں��� b��° ���� ���
SELECT job, SUBSTR(job,1,2), SUBSTR(job,3,2), substr(job,5) FROM emp;

SELECT job, SUBSTR(job, -LENGTH(job)), SUBSTR(job, -LENGTH(job),2),SUBSTR(job, -3)
FROM emp;

-- 2) ���ڿ� �Լ� : INSTR(Ư������ ��ġ ã��)
-- ('HELLO, ORACLE!', 'L', 5)5��° ���������� lã��
-- ('HELLO, ORACLE!', 'L', 2, 2) 2��° ���� & 2��° L��ġ ã��
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
       INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
       INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
       FROM dual;
       
-- 3) ���ڿ� �Լ� : REPLACE(ã�Ƽ� �ٲٱ�), ��������X ȭ����¸�����
-- REPLACE('�����ϰ���� �ܾ ���Ե� ����', '�����ϰ���� �ܾ�', '������ �ܾ�')
SELECT REPLACE('�̰��� oracle�̴�', '�̰���', 'THIS IS')
FROM dual;
-- ������ �ܾ ������ �������.
SELECT '010-1234-5678' AS REPLACE_BEFORE,
REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
REPLACE('010-1234-5678', '-') AS REPLACE_2
FROM dual;

--�� 4) ���ڿ� �Լ� : CONCAT(���ڿ� ����)
-- empno, ename�� �����Ͽ� ��ȸ
SELECT CONCAT(empno, ename), CONCAT(empno, CONCAT(':', ename))
FROM emp
WHERE ename='SCOTT';

-- 4.1) || : ������ �ǹ̷� ����
SELECT empno || ename, empno || ':' || ename
FROM emp
WHERE ename='SCOTT';

--�� 5) ���ڿ� �Լ� : TRIM(���� ����), LTRIM(���ʰ�������), RTRIM(�����ʰ�������)
--                  ����Ҷ�: ������ �̸��ۼ��� ' 'ȫ�浿�Ͻ� ������ֱ�����.
SELECT '    �̰���     ', TRIM('     �̰���        '), LTRIM('     �̰���    '), RTRIM('     �̰���    ')
FROM dual;

-- 6) ���ڿ� �Լ� : REVERSE(�Ųٷ� ���)
SELECT REVERSE('Oracle') FROM dual;


-- 1) ���� �Լ� : ROUND(�ݿø�), TRUNC(����), CEIL(�Էµ� ���ڿ� ����� ū ����)
-- FLOOR(�Էµ� ���ڿ� ����� ���� ����), MOD(������)

SELECT ROUND(1324.5678) AS ROUND,
       ROUND(1324.5678, 0) AS ROUND_1,
       ROUND(1324.5678, 1) AS ROUND_2,
       ROUND(1324.5678,-1) AS ROUND_MINUS,
       ROUND(1324.5678,-2) AS ROUND_MINUS2
FROM dual;

SELECT TRUNC(1324.5678) AS TRUNC,
       TRUNC(1324.5678, 0) AS TRUNC_1,
       TRUNC(1324.5678, 1) AS TRUNC_2,
       TRUNC(1324.5678,-1) AS TRUNC_MINUS,
       TRUNC(1324.5678,-2) AS TRUNC_MINUS2
FROM dual;

SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14)
FROM dual;

SELECT MOD(15,6), MOD(10,2), MOD(11,2) FROM dual;

--�� 3) ��¥ �Լ� 1: SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP
-- SYSDATE : ȸ�����Խ� �� �� ȸ�������Ѱ��̶�� �����ϸ� ���̻��
SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;

--��¥�����ʹ� ������ ������ : EX) ��¥������ + 1, -1, ��¥������-��¥������
-- ��¥������ + ��¥�����ʹ� �ȵ�
SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE +1 AS TOMORROW
FROM dual;

-- ��¥ �Լ� 2: ADD_MONTHS (�� �߰�)
-- ADD_MONTHS(SYSDATE, 3) SYSDATE���� 3������ �߰��� ���� ���
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) FROM dual;

-- �Ի� 10�ֳ��� �Ǵ� ����� ��ȸ
SELECT empno, ename, hiredate, ADD_MONTHS(hiredate, 120) FROM emp;

-- �Ի� 38�� �̸��� ����� ��ȸ
SELECT * FROM emp WHERE ADD_MONTHS(hiredate, 456)> SYSDATE;

-- ��¥ �Լ� 3: MONTHS_BETWEEN(�� ��¥ ������ ���� ���)
SELECT * FROM emp WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) < 456;\

SELECT empno, ename, hiredate, SYSDATE, MONTHS_BETWEEN(hiredate, SYSDATE) AS MONTHS1,
MONTHS_BETWEEN(SYSDATE, hiredate) AS MONTHS2, TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) AS TRUNC
FROM emp;

-- ��¥�Լ� 4: NEXT_DAY, LAST_DAY(�� ���� ������ date)
SELECT SYSDATE, NEXT_DAY(SYSDATE, '������'), LAST_DAY(SYSDATE)
FROM dual;

-- ������ȯ �Լ� : TO_CHAR(��¥, ���ڵ����͸� ���ڷ� ��ȯ)
--               TO_NUMBER(���ڵ����͸� ���ڷ� ��ȯ)
--               TO_DATE(���� �����͸� ��¥�� ��ȯ)

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS ���糯¥ FROM dual; --2020/11/05
SELECT TO_CHAR(SYSDATE, 'MON') AS ���糯¥ FROM dual; --a��
SELECT TO_CHAR(SYSDATE, 'DD') AS ���糯¥ FROM dual; 
SELECT TO_CHAR(SYSDATE, 'MM') AS ���糯¥ FROM dual; 
SELECT TO_CHAR(SYSDATE, 'DAY') AS ���糯¥ FROM dual; --����
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') AS ���糯¥ FROM dual; --��:��:��
SELECT TO_CHAR(SYSDATE, 'HH12:MI:SS') AS ���糯¥ FROM dual;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') AS ���糯¥ FROM dual;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS AM') AS ���糯¥ FROM dual;

-- ���ó�¥�� ��/��/�� 16:51:45ǥ��
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD   HH24:MI:SS') AS ���糯¥�ð� FROM dual;

SELECT 1300-TO_NUMBER('1500'), TO_NUMBER('1300')+1500 FROM dual;
SELECT TO_NUMBER('1,300','999,999') - TO_NUMBER('1,500','999,999') FROM dual;

SELECT TO_NUMBER('1,300','999,999') - TO_NUMBER('1,500','999,999') FROM dual;

SELECT TO_DATE ('2020-11-05', 'YYYY/MM/DD') AS TODATE1,
        TO_DATE ('20201105', 'YYYY-MM-DD') AS TODATE2 FROM dual;

-- 1981��6��1�� ���Ŀ� �Ի��� ������� ��ȸ
SELECT * FROM emp WHERE hiredate > '1981-06-01';
-- ��¥�����Ͷ�� �νĽ����ֱ�
SELECT * FROM emp WHERE hiredate > TO_DATE('1981-06-01', 'YYYY//MM/DD');

SELECT TO_DATE('2019-12-20')-TO_DATE('2019-10-20') FROM dual;

-- NULLó�� �Լ� : NVL, NVL2
SELECT empno, ename, sal, comm, sal+comm FROM emp;
SELECT empno, ename, sal, comm, sal+comm, NVL(COMM,0), SAL+NVL(COMM,0)
FROM emp;

SELECT empno, ename, sal, comm, comm, NVL2(COMM,'O','X'), --NULL�� �ƴϿ��� ����
SAL+NVL2(COMM,sal*12+comm, sal*12) AS annsal
FROM emp;

-- DECODE �Լ��� CASE��
-- job�� manager, salseman, analyst ��쿡 ������ �ٸ� ������ �����ϰ� �ʹٸ�?
SELECT empno,ename,job,sal, DECODE(job,
                                    'MANAGER',sal*1.1,
                                    'SALSEMAN',sal*1.05,
                                    'ANALYST',SAL,
                                    SAL*1.03) AS UPSAL 
FROM emp;

SELECT empno,ename,job,sal, CASE JOB
                            WHEN 'MANAGER' THEN SAL*1.1
                            WHEN 'SALSEMAN' THEN SAL*1.05
                            WHEN 'ANALYST' THEN SAL
                            ELSE SAL*1.03
                            END AS UPSAL 
FROM emp;

SELECT empno,ename,job,sal, CASE
                            WHEN COMM IS NULL THEN '�ش���׾���'
                            WHEN COMM=0 THEN '�������'
                            WHEN COMM>0 THEN '���� : ' || COMM
                            END AS COMM_TEXT FROM emp;


-- [�ǽ�1] : ����� �ٹ��ϼ� 21.5, DAY_PAY(�Ϸ�޿�) : SAL/21.5,
-- TIME_PAY(�ñ�) : SAL/21.5/8
--SELECT ROUND((sal/21.5),2) ROUND�� ��밡��
SELECT empno, ename, sal, TRUNC(sal/21.5, 2) AS DAY_PAY, 
ROUND((sal/21.5/8),1) as TIME_PAY
FROM emp;

-- [�ǽ�2]
SELECT empno, ename, hiredate, NEXT_DAY(ADD_MONTHS(hiredate, 3), '������') AS R_JOB,
       NVL(TO_CHAR(COMM), 'N/A') AS COMM
FROM emp;

-- [�ǽ�3]
-- �ٸ���� SELECT SUBSTR(TO_CHAR(mgr),1,2) FROM emp;
SELECT empno, ename, mgr, CASE WHEN MGR IS NULL THEN '0000'
                               WHEN MGR LIKE '75%' THEN '5555'
                               WHEN MGR LIKE '76%' THEN '6666'
                               WHEN MGR LIKE '77%' THEN '7777'
                               WHEN MGR LIKE '78%' THEN '8888'
                               ELSE TO_CHAR(MGR)
                               END AS CHG_MGR
FROM emp;

/* [�ǽ�2] */
SELECT job, COUNT(job)
FROM emp
GROUP BY job HAVING COUNT(job) >= 3;