create table dept_TEMP2 AS SELECT * FROM DEPT;

-- DEPT_TEMP2�� �ִ�  LOC�� ��� ����
UPDATE DEPT_TEMP2 --���̺��
SET LOC= 'SEOUL';--������ ����


SELECT * FROM DEPT_TEMP2;

ROLLBACK;

UPDATE DEPT_TEMP2 --���̺��
SET LOC= 'SEOUL'--������ ����
WHERE DEPTNO = 10; --������Ʈ ���� 

/* EMP_TEMP ���̺��� ����� �߿��� �޿��� 3000������ ����� �߰������� 50���� ���� */
UPDATE EMP_TEMP
SET COMM = 50, DEPTNO = 10-- ������ comm�ȿ� ���� �ִٸ� comm = comm+50
WHERE SAL <= 3000;

/* ���������� �̿��� ������ ����
   40�� �μ��� �μ���� ������ 30�� �μ��� �μ���� �������� ���� */
UPDATE dept_temp2
SET (DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO=30)
WHERE DEPTNO = 40;

UPDATE dept_temp2
SET LOC = 'SEOUL'
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'OPERATIONS');



