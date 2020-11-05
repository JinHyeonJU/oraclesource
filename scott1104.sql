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

-- ★ LIKE : 문자열 검색 사용(s로 시작하는, h로 끝나는, 가운데에 t가 있으면)
SELECT * FROM emp WHERE job LIKE 's%'
SELECT * FROM emp WHERE job LIKE '_s%'
SELECT * FROM emp WHERE job LIKE '%s%'

-- IS NULL
SELECT * FROM emp WHERE comm IS NULL;

-- MGR (매니저ID)이 NULL이 아닌 사원정보
SELECT * FROM emp WHERE mgr IS NOT NULL;

-- ㅁ집합연산자 : 합집합(UNION), 교집합(INTERSECT), 차집합(MINUS)
-- 여러테이블에서 사용

-- 1)DEPTNO 가 10인 테이블과 DEPTNO 가 20인 결과를 구해서 같이 보여주기(UNION : 다른테이블일때)
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 20;
-- 1.1)UNION : ALL 이 없을경우 중복데이터 삭제 출력
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;
-- 1.2)UNION ALL : 중복된 데이터도 출력
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION ALL
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;
-- 2)부서번호가 10이 아닌 사원들의 정보 조회
SELECT empno, ename, sal, deptno FROM emp
MINUS
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;
-- 3)부서번호가 10인 사원정보 조회
SELECT empno, ename, sal, deptno FROM emp
INTERSECT
SELECT empno, ename, sal, deptno FROM emp WHERE deptno=10;

-- PRACTICE) 20, 30번 부서에 근무하고 있는 사원 중 SAL 이 2000초과인 사원을 다음 두 가지
-- 방식의 SELECT 문을 사용하여, 사원번호, 이름, 급여, 부서번호를 출력하는
-- SQL 문 작성하기

--집합연산자 사용하지 않는 방식
SELECT deptno, ename, sal, empno
FROM emp
WHERE deptno IN(20,30) AND sal > 2000;
--집합연산자를 사용하는 방식
-- 교집합(INTERSECT)
SELECT deptno, ename, sal, empno FROM emp
INTERSECT
SELECT deptno, ename, sal, empno FROM emp WHERE deptno IN(20,30) AND sal > 2000;
-- 차집합(MINUS)
SELECT deptno, ename, sal, empno FROM emp WHERE sal>2000
MINUS
SELECT deptno, ename, sal, empno FROM emp WHERE deptno = 10;
-- 합집합(UNION)
SELECT deptno, ename, sal, empno FROM emp WHERE sal>2000 AND deptno=20
UNION
SELECT deptno, ename, sal, empno FROM emp WHERE sal>2000 AND deptno=30;