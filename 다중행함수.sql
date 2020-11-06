-- sum : �հ�
SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal) FROM emp;

-- count : ���� ex) ���̺� ���� �� ��
SELECT COUNT(*) FROM emp; --emp���̺� 14���� �����Ͱ� ������
-- COUNT EX1) �μ���ȣ�� 30���� ���� �� ���ϱ�
SELECT COUNT(*) FROM emp WHERE deptno = 30;
SELECT COUNT(sal), COUNT(DISTINCT sal), COUNT(ALL sal) FROM emp;

/*��MAX(�ִ밪), MIN(�ּҰ�)��*/
SELECT MAX(sal), MIN(SAL) FROM emp;

/*�μ���ȣ�� 20�� ����� �Ի��� �� ���� �ֱ� �Ի��� ���ϱ�*/
SELECT MAX(hiredate) FROM emp WHERE deptno=20;

/*��AVERAGE(AVG) : ��ա� */
SELECT ROUND(AVG(sal), 1) FROM emp;
SELECT ROUND(AVG(sal), 2) FROM emp WHERE deptno=30; /*30���μ������*/
SELECT ROUND(AVG(DISTINCT sal), 1) FROM emp;

/* �μ��� ������ ����� �˰� �ʹٸ�?
   10,20,30 �μ��� ���� ��� ���
   ��GROUP BY : ������� ���ϴ� ���� ���� ��¡�*/
SELECT deptno, AVG(SAL) FROM emp GROUP BY deptno;

/* �μ���ȣ�� �߰����� ��� ���ϱ�*/
SELECT deptno, AVG(COMM) FROM emp GROUP BY deptno;

/*�μ���ȣ, ��å�� �޿� ��� ���ϱ�*/
SELECT deptno, job, AVG(sal)
FROM emp
GROUP BY deptno, job;

/* group by ���� ���� �ȵǴ� ���� select�� �����ϸ� �ȵ�*/
SELECT deptno, AVG(sal)
FROM emp
GROUP BY deptno;

/* ��HAVING : GROUP BY ���� ������ �� �� ����
HAVING�� GROUP BY�� ��Ʈ, HAVING �ܵ����� ��� �Ұ�
�� �μ��� ��å�� ��� �޿��� ���ϵ� �� ��� �޿��� 2000�̻��� �׷츸���*/
SELECT deptno, job, AVG(sal)
FROM emp
GROUP BY deptno, job
HAVING AVG(sal) >= 2000
ORDER BY deptno;

/* EMP ���̺��� �μ��� ��å�� ��� �޿��� 500�̻��� �������
�μ���ȣ, ��å, �μ��� ��å�� ��� �޿� ���*/
SELECT deptno, job, AVG(sal)
FROM emp
GROUP BY deptno, job HAVING AVG(sal) >= 500
ORDER BY deptno, job;

SELECT deptno, job, AVG(sal)
FROM emp
WHERE sal<=3000
GROUP BY deptno, job HAVING AVG(sal) >=2000 -- GROUP BY, HAVING�� �������� ����
ORDER BY deptno, job;

/* [�ǽ�1] */
SELECT deptno, FLOOR(AVG(sal)) AS AVG_SAL, MAX(sal) AS MAX_SAL,
MIN(sal) AS MIN_SAL, COUNT(deptno)
FROM emp
GROUP BY deptno;
/* [�ǽ�2] */
SELECT JOB, COUNT(job/* '*' �� ����*/) FROM emp
GROUP BY job HAVING COUNT(job) >= 3;
/* [�ǽ�3] */
SELECT TO_CHAR(hiredate, 'yyyy') AS HIRE_YEAR, DEPTNO, COUNT(*) AS CNT
FROM emp
GROUP BY deptno, TO_CHAR(hiredate, 'yyyy')
ORDER BY TO_CHAR(hiredate, 'yyyy');

/* �ڡ�����(JOIN)��
���� �� �ִ� ��� ���� */
SELECT * FROM emp, dept; ORDER BY empno;
SELECT COUNT(*) FROM emp, dept; ORDER BY empno; --56��(14 * 4)
SELECT * FROM dept; --4��
SELECT * FROM emp; --14��
/* 1) ��������(�����) */
SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno --JOIN����
ORDER BY empno;

SELECT *
FROM emp E, dept D
WHERE E.deptno = D.deptno --JOIN����
ORDER BY empno;

SELECT *
FROM emp E INNER JOIN dept D
ON E.deptno = D.DEPTNO -- ON : JOIN����
ORDER BY empno;
/* �� ���̺� ���� �̸��� �ʵ尡 �����ϴ� ��� 
��� ���̺� �ִ� �ʵ带 ������ �� ������ ��Ȯ�� ��� */
SELECT empno, ename, job, D.deptno, dname -- ������̺��� deptno�� �����ð�����
FROM EMP E INNER JOIN DEPT D
ON E.deptno = D.deptno
ORDER BY empno;

/* EMP���̺�� DEPT���̺��� �����Ͽ� EMPNO, ENAME, SAL, DEPTNO, DNAME, LOC�� ��ȸ�Ѵ�.
�� �޿��� 3000 �̻��� ����� ��� */
SELECT E.empno, E.ename, E.sal, D.deptno, D.dname, D.loc
FROM emp E, dept D
WHERE  E.DEPTNO = D.DEPTNO/* <- JOIN���� */ AND SAL >= 3000;

/* EMP ���̺��� ��Ī�� E��, DEPT ���̺� ��Ī�� D�� �Ͽ�
�޿��� 2500�����̰�, �����ȣ�� 9999 ������ ����� ������ ��� */
SELECT * FROM emp E JOIN dept D --INNER JOIN ON ���
ON E.deptno = D.deptno
WHERE E.sal <= 2500 AND E.empno <= 9999
ORDER BY E.sal;

SELECT * FROM emp E, dept D
WHERE E.deptno = D.deptno AND E.sal <= 2500 AND E.empno <=9999
ORDER BY E.sal;

/* EMP ���̺��� ��Ī�� E��, SALGRADE���̺� ��Ī�� S�� �Ͽ�
�� ����� ������ ���Ҿ� ����� ��� ������ ��� */
SELECT * FROM emp E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT *
FROM emp E JOIN SALGRADE S --INNER JOIN ON ���
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

/* 2) ��������(��ü����) : ���� ���̺��� �ڱ� �ڽ� ���̺��� ��
MGR = �������� EMPNO */
-- WHERE ��
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO; -- ��������
-- JOIN ON ��
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 JOIN EMP E2
ON E1.MGR = E2.EMPNO;

/* 3) �ܺ�����(OUTER JOIN) : ������ �������� �ʴ� ������ ���� */
/* 3.1)LEFT OUTER JOIN ǥ�ع�� */
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2 -- ������ ON�� = �������� ����, �����U
ON E1.MGR = E2.EMPNO;
/* 3.1)LEFT OUTER JOIN */
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);
/* 3.2) RIGHT OUTER JOIN ǥ�ع�� */
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2 -- ������ ON�� = �������� ����, �����U
ON E1.MGR = E2.EMPNO;
/* 3.2) RIGHT OUTER JOIN */
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO;

SELECT * FROM emp;
/* [�ǽ�1] JOIN */
SELECT D.deptno, D.dname, E.empno, E.ename, E.sal
FROM EMP E, DEPT D
WHERE E.deptno = D.deptno AND E.sal > 2000;

SELECT D.deptno, D.dname, E.empno, E.ename, E.sal
FROM EMP E JOIN DEPT D
ON E.deptno = D.deptno
WHERE E.sal > 2000;
/* [�ǽ�2] GROUP BY*/
SELECT
FROM
ON

/* [�ǽ�3] */
SELECT D.deptno, D.dname, E.empno, E.ename, E.job, E.sal
FROM EMP E FULL OUTER JOIN DEPT D
ON E.deptno = D.deptno
ORDER BY D.deptno, D.dname;

/* [�ǽ�4] */
SELECT
FROM
ON
WHERE



