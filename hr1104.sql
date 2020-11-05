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