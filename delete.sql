CREATE TABLE EMP_TEMP3 AS SELECT * FROM EMP; /* EMP Ŭ�����̺� ���� */
SELECT * FROM EMP_TEMP2; /* ���̺� ��ȸ */

/* JOB�� MANAGER�� ������ �����ϱ� */
DELETE FROM EMP_TEMP3 WHERE JOB = 'MANAGER'; /* DELETE �ڿ� �� �ȵ� */
DELETE EMP_TEMP3 /* ���̺� EMP_TEMP2�� ��� �� ���� */
ROLLBACK;

/* EMP_TEMP2 ���̺��� ��� �߿��� �޿��� 5000 �̻��� ��� ���� */
DELETE FROM EMP_TEMP3 WHERE SAL >= 5000;

COMMIT;

--�޿� ��� 3��� ���̿��ִ� 30�� �μ��� ����鸸 ����

DELETE FROM EMP_TEMP2 WHERE EMPNO IN (SELECT E.EMPNO
                                   FROM EMP_TEMP2 E, SALGRADE S
                                   WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                                   AND S.GRADE = 3 AND DEPTNO =30);




