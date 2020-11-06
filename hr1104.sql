select * from tab;
select * from employees;
DESC EMPLOYEES;



--사원번호가 176인 사람의 LAST_NAME, 부서번호 조회
SELECT last_name, DEPARTMENT_ID FROM employees WHERE EMPLOYEE_ID =176;

-- 연봉이 12000 이상 (>=)되는 직원들의 LAST_NAME 및 연봉 조회
SELECT last_name, salary FROM employees WHERE salary>=12000;

-- 연봉이 5000에서 12000의 범위 이외의 사람들의 LAST_NAME 및 연봉 조회
SELECT LAST_NAME, salary FROM employees WHERE salary < 5000 or salary > 12000;




-- 20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서번호를 알파벳순
-- 으로 조회

SELECT LAST_NAME, DEPARTMENT_ID FROM employees ORDER BY employee_id DESC,
WHERE DEPARTMENT_ID IN(20, 50);

SELECT last_name, department_id
FROM employees
WHERE department_id in(20,50) OREDER BY last_name,departmnet_id;



-- 커미션을 버는 모든 사원들의 LAST_NAME, 연봉, 커미션 조회하기. 단,연봉의 역순 및
-- 커미션 역순으로 결과 출력하기

SELECT last_name, commission_pct, salary FROM employees ORDER BY commission_pct DESC AND ORDER BY salary DESC AND
WHERE commission_pct < 0;

SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct>0 ORDER BY salary DESC, commission_pct DESC;


-- 연봉이 2500, 3500, 7000이 아니며, 직업이 sa_rep 이나 st_clerk인 사람들 조회
SELECT * FROM employees WHERE salary NOT IN(2500, 3500, 7000), job_id = sa_rep or job_id = st_clerk;

-- 2008/02/20 ~ 2008/05/01 사이에 고용된 사원들의 LAST_NAME, 사원번호, 고용일자 조회
-- 단, 고용일자 내림차순으로 정렬하여 출력
SELECT last_name, employee_id, hire_date
FROM employees
WHERE hire_data >= '2008-02-20' AND hire_data <= '2008-05-01' ORDER BY hire_date DESC;


-- 2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로
-- 오름차순 정렬하여 출력
SELECT last_name, hire_date
FROM employees
WHERE hire_date >= '2004-01-01' AND hire_date <= '2004-12-31' ORDER BY hire_date;


-- BETWEEN 사용
-- 연봉이 5000에서 12000의 범위에 있고,20 OR 50번 부서에 근무하는
--사람들의 연봉을 조회하여 오름차순으로 보여주기(LAST_NAME, SALARY)

SELECT last_name, salary, department_id
FROM employees
WHERE  department_id IN (20,50) AND salary BETWEEN 5000 AND 12000
ORDER BY salary;


-- 2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로
-- 오름차순 정렬하여 출력
SELECT last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-31'
ORDER BY hire_date;

-- 연봉이 5000~12000범위 의외의 사람들의 LAST_NAME, SALARY를 조회
SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;


-- LIKE
-- 1) 2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회하여 입사일 기준으로
--오름차순 정렬하여 출력
SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '04%' ORDER BY hire_date;


-- 2)LAST_NAME 에 u가 포함되는 사람들의 사번 및 last_name 조회
SELECT last_name, employee_id
FROM employees
WHERE last_name LIKE '%u%';


-- 3) last_name 에 a혹은 e글자가 있는 사원들의 last_name 을 조회하여 last_name
-- 오름차순 정렬
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%' OR last_name LIKE '%e%'
ORDER BY last_name;



--4) last_name 에 a와  e글자가 있는 사원들의 last_name 을 조회하여 last_name
-- 오름차순 정렬
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%' AND last_name LIKE '%e%' ORDER BY last_name;


-- IS NULL 연습
-- 1)매니저가 없는 사람들의 LAST_NAME, JOB_ID 조회
SELECT last_name, job_id
FROM employees
WHERE manager_id IS NULL;

-- 2) ST_CLERK인 JOB_ID를 가진 사원이 없는 부서ID 조회. 부서 번호가 NULL인 값 제외
SELECT DISTINCT department_id
FROM employees
WHERE JOB_ID NOT IN ('st_clerk') AND department_id IS NOT NULL;


--3)COMMISSION_PCT가 NULL이 아닌 사원들 중에서  COMMISSION =SALARY * COMMISSION_PCT
--를 구하여 EMPLOYEE_ID, FIRST_NAME,JOB_ID 를 조회
SELECT employee_id, first_name, job_id, salary * commission_pct AS commission
FROM employees
WHERE commission_pct IS NOT NULL;




-- [실습]문자열 함수
-- 1) first_name이 Curtis 인 사람의 first_name, last_name, email, phone_number,
--     job_id를 조회한다. 단, job_id의 결과는 소문자로 출력
SELECT first_name, last_name, email, phone_number, LOWER(job_id)
FROM employees
WHERE first_name = 'Curtis';

-- 2) 부서번호가 70,80,90인 사람들의 employee_id, first_name, hire_date,job_id를
--    조회한다. 단, job_id가 it_prog인 사원의 경우 프로그래머로 변경하여 출력.
SELECT employee_id, first_name, hire_date, REPLACE(job_id, 'IT_PROG', '프로그래머') AS job_id
FROM employees
WHERE department_id IN(60,70,80,90);

-- 3) job_id가 ad_pres, pu_clerk인 사원들의 employee_id, first_name,last_name,
--   department_id, job_id를 조회하시오. 단, 사원명은 first_namd과 last_name을 연결
--    하여 출력한다.
SELECT employee_id, department_id, job_id, CONCAT(first_name, CONCAT(' ', last_name)) AS FullName
FROM employees
WHERE job_id IN('AD_PRES', 'PU_CLERK');

SELECT employee_id, department_id, job_id, first_name || ' ' || last_name AS FullName
FROM employees
WHERE job_id IN('AD_PRES', 'PU_CLERK');


-- [실습4]
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
-- < 기호사용한 CASE문
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
-- TRUNC 사용한 DECODE문
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