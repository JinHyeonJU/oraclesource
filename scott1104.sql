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