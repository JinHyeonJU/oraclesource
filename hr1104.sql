select * from tab;
select * from employees;
DESC EMPLOYEES;

--�����ȣ�� 176�� ����� LAST_NAME, �μ���ȣ ��ȸ
SELECT last_name, DEPARTMENT_ID FROM employees WHERE EMPLOYEE_ID =176;

-- ������ 12000 �̻� (>=)�Ǵ� �������� LAST_NAME �� ���� ��ȸ
SELECT last_name, salary FROM employees WHERE salary>=12000;

-- ������ 5000���� 12000�� ���� �̿��� ������� LAST_NAME �� ���� ��ȸ
SELECT LAST_NAME, salary FROM employees WHERE salary < 5000 or salary > 12000;