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