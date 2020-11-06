select * from tab;
select * from employees;
DESC EMPLOYEES;



--�����ȣ�� 176�� ����� LAST_NAME, �μ���ȣ ��ȸ
SELECT last_name, DEPARTMENT_ID FROM employees WHERE EMPLOYEE_ID =176;

-- ������ 12000 �̻� (>=)�Ǵ� �������� LAST_NAME �� ���� ��ȸ
SELECT last_name, salary FROM employees WHERE salary>=12000;

-- ������ 5000���� 12000�� ���� �̿��� ������� LAST_NAME �� ���� ��ȸ
SELECT LAST_NAME, salary FROM employees WHERE salary < 5000 or salary > 12000;




-- 20�� �� 50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ���ȣ�� ���ĺ���
-- ���� ��ȸ

SELECT LAST_NAME, DEPARTMENT_ID FROM employees ORDER BY employee_id DESC,
WHERE DEPARTMENT_ID IN(20, 50);

SELECT last_name, department_id
FROM employees
WHERE department_id in(20,50) OREDER BY last_name,departmnet_id;



-- Ŀ�̼��� ���� ��� ������� LAST_NAME, ����, Ŀ�̼� ��ȸ�ϱ�. ��,������ ���� ��
-- Ŀ�̼� �������� ��� ����ϱ�

SELECT last_name, commission_pct, salary FROM employees ORDER BY commission_pct DESC AND ORDER BY salary DESC AND
WHERE commission_pct < 0;

SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct>0 ORDER BY salary DESC, commission_pct DESC;


-- ������ 2500, 3500, 7000�� �ƴϸ�, ������ sa_rep �̳� st_clerk�� ����� ��ȸ
SELECT * FROM employees WHERE salary NOT IN(2500, 3500, 7000), job_id = sa_rep or job_id = st_clerk;

-- 2008/02/20 ~ 2008/05/01 ���̿� ���� ������� LAST_NAME, �����ȣ, ������� ��ȸ
-- ��, ������� ������������ �����Ͽ� ���
SELECT last_name, employee_id, hire_date
FROM employees
WHERE hire_data >= '2008-02-20' AND hire_data <= '2008-05-01' ORDER BY hire_date DESC;


-- 2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� ��������
-- �������� �����Ͽ� ���
SELECT last_name, hire_date
FROM employees
WHERE hire_date >= '2004-01-01' AND hire_date <= '2004-12-31' ORDER BY hire_date;


-- BETWEEN ���
-- ������ 5000���� 12000�� ������ �ְ�,20 OR 50�� �μ��� �ٹ��ϴ�
--������� ������ ��ȸ�Ͽ� ������������ �����ֱ�(LAST_NAME, SALARY)

SELECT last_name, salary, department_id
FROM employees
WHERE  department_id IN (20,50) AND salary BETWEEN 5000 AND 12000
ORDER BY salary;


-- 2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� ��������
-- �������� �����Ͽ� ���
SELECT last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-31'
ORDER BY hire_date;

-- ������ 5000~12000���� �ǿ��� ������� LAST_NAME, SALARY�� ��ȸ
SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;


-- LIKE
-- 1) 2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ͽ� �Ի��� ��������
--�������� �����Ͽ� ���
SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '04%' ORDER BY hire_date;


-- 2)LAST_NAME �� u�� ���ԵǴ� ������� ��� �� last_name ��ȸ
SELECT last_name, employee_id
FROM employees
WHERE last_name LIKE '%u%';


-- 3) last_name �� aȤ�� e���ڰ� �ִ� ������� last_name �� ��ȸ�Ͽ� last_name
-- �������� ����
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%' OR last_name LIKE '%e%'
ORDER BY last_name;



--4) last_name �� a��  e���ڰ� �ִ� ������� last_name �� ��ȸ�Ͽ� last_name
-- �������� ����
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%' AND last_name LIKE '%e%' ORDER BY last_name;


-- IS NULL ����
-- 1)�Ŵ����� ���� ������� LAST_NAME, JOB_ID ��ȸ
SELECT last_name, job_id
FROM employees
WHERE manager_id IS NULL;

-- 2) ST_CLERK�� JOB_ID�� ���� ����� ���� �μ�ID ��ȸ. �μ� ��ȣ�� NULL�� �� ����
SELECT DISTINCT department_id
FROM employees
WHERE JOB_ID NOT IN ('st_clerk') AND department_id IS NOT NULL;


--3)COMMISSION_PCT�� NULL�� �ƴ� ����� �߿���  COMMISSION =SALARY * COMMISSION_PCT
--�� ���Ͽ� EMPLOYEE_ID, FIRST_NAME,JOB_ID �� ��ȸ
SELECT employee_id, first_name, job_id, salary * commission_pct AS commission
FROM employees
WHERE commission_pct IS NOT NULL;




-- [�ǽ�]���ڿ� �Լ�
-- 1) first_name�� Curtis �� ����� first_name, last_name, email, phone_number,
--     job_id�� ��ȸ�Ѵ�. ��, job_id�� ����� �ҹ��ڷ� ���
SELECT first_name, last_name, email, phone_number, LOWER(job_id)
FROM employees
WHERE first_name = 'Curtis';

-- 2) �μ���ȣ�� 70,80,90�� ������� employee_id, first_name, hire_date,job_id��
--    ��ȸ�Ѵ�. ��, job_id�� it_prog�� ����� ��� ���α׷��ӷ� �����Ͽ� ���.
SELECT employee_id, first_name, hire_date, REPLACE(job_id, 'IT_PROG', '���α׷���') AS job_id
FROM employees
WHERE department_id IN(60,70,80,90);

-- 3) job_id�� ad_pres, pu_clerk�� ������� employee_id, first_name,last_name,
--   department_id, job_id�� ��ȸ�Ͻÿ�. ��, ������� first_namd�� last_name�� ����
--    �Ͽ� ����Ѵ�.
SELECT employee_id, department_id, job_id, CONCAT(first_name, CONCAT(' ', last_name)) AS FullName
FROM employees
WHERE job_id IN('AD_PRES', 'PU_CLERK');

SELECT employee_id, department_id, job_id, first_name || ' ' || last_name AS FullName
FROM employees
WHERE job_id IN('AD_PRES', 'PU_CLERK');


-- [�ǽ�4]
SELECT LAST_NAME, SALARY, CASE
                              WHEN salary BETWEEN 0 AND 1999 THEN salary*0
                              WHEN salary BETWEEN 2000 AND 3999 THEN 0.09
                              WHEN salary BETWEEN 4000 AND 5999 THEN 0.2
                              WHEN salary BETWEEN 6000 AND 7999 THEN 0.3
                              WHEN salary BETWEEN 8000 AND 9999 THEN 0.4
                              WHEN salary BETWEEN 10000 AND 11999 THEN 0.42
                              WHEN salary BETWEEN 12000 AND 13999 THEN 0.44
                              WHEN salary >14000 THEN 0.6
                                      END AS TAX_RATE
FROM employees;
-- < ��ȣ����� CASE��
SELECT last_name, salary,
          CASE
               WHEN salary < 2000 THEN 0
               WHEN (salary < 4000) THEN 0.09
               WHEN (salary < 6000) THEN 0.2
               WHEN (salary < 8000) THEN 0.3
               WHEN (salary < 10000) THEN 0.4
               WHEN (salary < 12000) THEN 0.42
               WHEN (salary < 14000) THEN 0.44
               ELSE 0.45
               END AS TAX_RATE
FROM employees
WHERE department_id=80;
-- TRUNC ����� DECODE��
SELECT last_name, salary,
               DECODE(TRUNC(salary/2000,0),
                         0,0.00,
                         1,0.09,
                         2,0.20,
                         3,0.30,
                         4,0.40,
                         5,0.42,
                         6,0.44,
                         0.45) AS TAX_RATE
FROM employees
WHERE department_id=80;