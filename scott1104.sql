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