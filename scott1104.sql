-- scott 계정이 가지고 있는 모돈 테이블 보기
select * from tab;

-- emp 테이블의 구조
DESC emp;

--emp 테이블 모든 내용 조회
select * from emp;

-- emp 테이블의 특정 필드만 조회
SELECT ename, job, sal from emp;

-- 중복 레코드 제거한 후 조회
SELECT DISTINCT deptno FROM emp;

-- alais(별칭) : AS
SELECT empno AS 사원번호 FROM emp; 

SELECT ename, sal, sal*12+comm AS 연봉, comm FROM emp;

SELECT ename as 사원이름, job as "직 책" from emp;

-- ORDER BY : 정렬하여 조회

-- 하나의 열로 기준을 주어 오름차순 조회
SELECT ename,sal FROM emp ORDER BY sal;

-- 하나의 열로 기준을 주어 내림차순 조회
SELECT ename,sal FROM emp ORDER BY sal DESC;

-- 전체 데이터를 조회(사원번호 오름차순)
SELECT * FROM emp ORDER BY empno;

-- 부서번호의 오름차순, 부서번호가 동일하다면 급여의 내림차순
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;

SELECT EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME,job, MGR AS MANAGER,
hiredate, SAL AS SALARY, COMM AS COMMISIION, DEPTNO AS DEPARTMENT_NO from emp ORDER BY deptno DESC, ename ASC;

SELECT * FROM emp WHERE empno = 7499 AND deptno = 30;
SELECT * from emp WHERE deptno = 30 OR job = 'CLERK';
SELECT * FROM emp WHERE deptno = 20 OR job = 'salesman';

-- IN을 사용해서 부서번호가 10,20번인 사원정보 조회
SELECT * FROM emp WHERE deptno IN(10, 20);



-- BETWEEN A AND B (사이에)
-- 1)급여가 2000이상 3000이하인 사원정보 조회
SELECT * FROM emp WHERE sal >= 2000 AND sal<=3000;

SELECT *
FROM emp
WHERE sal BETWEEN 2000 AND 3000;

-- 2) 급여가 2000이상 3000 이하가 아닌 사원정보 조회(NOT BETWEEN)
SELECT *
FROM emp
WHERE sal NOT BETWEEN 2000 AND 3000;