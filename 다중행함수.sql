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

/* ★●조인(JOIN)●
나올 수 있는 모든 조합 */
SELECT * FROM emp, dept; ORDER BY empno;
SELECT COUNT(*) FROM emp, dept; ORDER BY empno; --56행(14 * 4)
SELECT * FROM dept; --4행
SELECT * FROM emp; --14행
/* 1) 내부조인(등가조인) */
SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno --JOIN기준
ORDER BY empno;

SELECT *
FROM emp E, dept D
WHERE E.deptno = D.deptno --JOIN기준
ORDER BY empno;

SELECT *
FROM emp E INNER JOIN dept D
ON E.deptno = D.DEPTNO -- ON : JOIN기준
ORDER BY empno;
/* 두 테이블에 같은 이름의 필드가 존재하는 경우 
어느 테이블에 있는 필드를 가지고 올 것인지 정확히 명시 */
SELECT empno, ename, job, D.deptno, dname -- 어느테이블의 deptno를 가져올것인지
FROM EMP E INNER JOIN DEPT D
ON E.deptno = D.deptno
ORDER BY empno;

/* EMP테이블과 DEPT테이블을 조인하여 EMPNO, ENAME, SAL, DEPTNO, DNAME, LOC를 조회한다.
단 급여가 3000 이상인 사원만 출력 */
SELECT E.empno, E.ename, E.sal, D.deptno, D.dname, D.loc
FROM emp E, dept D
WHERE  E.DEPTNO = D.DEPTNO/* <- JOIN조건 */ AND SAL >= 3000;

/* EMP 테이블의 별칭을 E로, DEPT 테이블 별칭을 D로 하여
급여가 2500이하이고, 사원번호가 9999 이하인 사원의 정보를 출력 */
SELECT * FROM emp E JOIN dept D --INNER JOIN ON 사용
ON E.deptno = D.deptno
WHERE E.sal <= 2500 AND E.empno <= 9999
ORDER BY E.sal;

SELECT * FROM emp E, dept D
WHERE E.deptno = D.deptno AND E.sal <= 2500 AND E.empno <=9999
ORDER BY E.sal;

/* EMP 테이블의 별칭을 E로, SALGRADE테이블 별칭을 S로 하여
각 사원의 정보와 더불어 사원의 등급 정보를 출력 */
SELECT * FROM emp E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT *
FROM emp E JOIN SALGRADE S --INNER JOIN ON 사용
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

/* 2) 셀프조인(자체조인) : 조인 테이블이 자기 자신 테이블일 때
MGR = 누군가의 EMPNO */
-- WHERE 문
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO; -- 연결조건
-- JOIN ON 문
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 JOIN EMP E2
ON E1.MGR = E2.EMPNO;

/* 3) 외부조인(OUTER JOIN) : 조건을 만족하지 않는 데이터 추출 */
/* 3.1)LEFT OUTER JOIN 표준방식 */
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2 -- 방향은 ON의 = 기준으로 왼쪽, 오른쪾
ON E1.MGR = E2.EMPNO;
/* 3.1)LEFT OUTER JOIN */
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);
/* 3.2) RIGHT OUTER JOIN 표준방식 */
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2 -- 방향은 ON의 = 기준으로 왼쪽, 오른쪾
ON E1.MGR = E2.EMPNO;
/* 3.2) RIGHT OUTER JOIN */
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO;

SELECT * FROM emp;
/* [실습1] JOIN */
SELECT D.deptno, D.dname, E.empno, E.ename, E.sal
FROM EMP E, DEPT D
WHERE E.deptno = D.deptno AND E.sal > 2000;

SELECT D.deptno, D.dname, E.empno, E.ename, E.sal
FROM EMP E JOIN DEPT D
ON E.deptno = D.deptno
WHERE E.sal > 2000;
/* [실습2] GROUP BY*/
SELECT
FROM
ON

/* [실습3] */
SELECT D.deptno, D.dname, E.empno, E.ename, E.job, E.sal
FROM EMP E FULL OUTER JOIN DEPT D
ON E.deptno = D.deptno
ORDER BY D.deptno, D.dname;

/* [실습4] */
SELECT
FROM
ON
WHERE



