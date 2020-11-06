-- sum : 합계
SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal) FROM emp;

-- count : 개수 ex) 테이블 갯수 셀 때
SELECT COUNT(*) FROM emp; --emp테이블에 14개의 데이터가 들어가있음
-- COUNT EX1) 부서번호가 30번인 직원 수 구하기
SELECT COUNT(*) FROM emp WHERE deptno = 30;
SELECT COUNT(sal), COUNT(DISTINCT sal), COUNT(ALL sal) FROM emp;

/*●MAX(최대값), MIN(최소값)●*/
SELECT MAX(sal), MIN(SAL) FROM emp;

/*부서번호가 20인 사원의 입사일 중 가장 최근 입사일 구하기*/
SELECT MAX(hiredate) FROM emp WHERE deptno=20;

/*●AVERAGE(AVG) : 평균● */
SELECT ROUND(AVG(sal), 1) FROM emp;
SELECT ROUND(AVG(sal), 2) FROM emp WHERE deptno=30; /*30번부서의평균*/
SELECT ROUND(AVG(DISTINCT sal), 1) FROM emp;

/* 부서별 월급의 평균을 알고 싶다면?
   10,20,30 부서별 월급 평균 출력
   ●GROUP BY : 결과값을 원하는 열로 묶어 출력●*/
SELECT deptno, AVG(SAL) FROM emp GROUP BY deptno;

/* 부서번호별 추가수당 평균 구하기*/
SELECT deptno, AVG(COMM) FROM emp GROUP BY deptno;

/*부서번호, 직책별 급여 평균 구하기*/
SELECT deptno, job, AVG(sal)
FROM emp
GROUP BY deptno, job;

/* group by 절에 포함 안되는 열을 select에 포함하면 안됨*/
SELECT deptno, AVG(sal)
FROM emp
GROUP BY deptno;

/* ●HAVING : GROUP BY 절에 조건을 줄 때 사용●
HAVING과 GROUP BY는 세트, HAVING 단독으로 사용 불가
각 부서의 직책별 평균 급여를 구하되 그 평균 급여가 2000이상인 그룹만출력*/
SELECT deptno, job, AVG(sal)
FROM emp
GROUP BY deptno, job
HAVING AVG(sal) >= 2000
ORDER BY deptno;

/* EMP 테이블의 부서별 직책의 평균 급여가 500이상인 사원들의
부서번호, 직책, 부서별 직책의 평균 급여 출력*/
SELECT deptno, job, AVG(sal)
FROM emp
GROUP BY deptno, job HAVING AVG(sal) >= 500
ORDER BY deptno, job;

SELECT deptno, job, AVG(sal)
FROM emp
WHERE sal<=3000
GROUP BY deptno, job HAVING AVG(sal) >=2000 -- GROUP BY, HAVING은 마지막에 실행
ORDER BY deptno, job;

/* [실습1] */
SELECT deptno, FLOOR(AVG(sal)) AS AVG_SAL, MAX(sal) AS MAX_SAL,
MIN(sal) AS MIN_SAL, COUNT(deptno)
FROM emp
GROUP BY deptno;
/* [실습2] */
SELECT JOB, COUNT(job/* '*' 도 무관*/) FROM emp
GROUP BY job HAVING COUNT(job) >= 3;
/* [실습3] */
SELECT TO_CHAR(hiredate, 'yyyy') AS HIRE_YEAR, DEPTNO, COUNT(*) AS CNT
FROM emp
GROUP BY deptno, TO_CHAR(hiredate, 'yyyy')
ORDER BY TO_CHAR(hiredate, 'yyyy');