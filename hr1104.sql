select * from tab;
select * from employees;
DESC EMPLOYEES;

--사원번호가 176인 사람의 LAST_NAME, 부서번호 조회
SELECT last_name, DEPARTMENT_ID FROM employees WHERE EMPLOYEE_ID =176;

-- 연봉이 12000 이상 (>=)되는 직원들의 LAST_NAME 및 연봉 조회
SELECT last_name, salary FROM employees WHERE salary>=12000;

-- 연봉이 5000에서 12000의 범위 이외의 사람들의 LAST_NAME 및 연봉 조회
SELECT LAST_NAME, salary FROM employees WHERE salary < 5000 or salary > 12000;