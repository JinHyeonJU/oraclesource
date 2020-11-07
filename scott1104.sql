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


-- 오라클 함수 (클래스가 없어도 됨)
-- 1) 문자 함수 : UPPER(대문자), LOWER(소문자), INITCAP(첫단어 대문자)
--              LENGTH, LENGTHB
-- ename 을 UPPER, LOWER, INITCAP으로 변경하여 조회
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename)
FROM emp;

-- DUAL 테이블 이용(SYS가 갖고있는 테이블, 임시연산이나 함수의 결과값을
-- 확인하는 용도)
-- LENGTHB : 바이트
-- LENGTH : 글자
SELECT LENGTH('웅뇽뇽뇽'), LENGTHB('웅뇽뇽뇽') FROM DUAL;

-- 직책 이름이 6글자 이상인 사원들의 정보 추출
SELECT * FROM emp WHERE LENGTH(job) >= 6;

-- 1) 문자열 함수 : SUBSTR(테이블, a, b) a번째 글자부터 b번째 글자 출력
SELECT job, SUBSTR(job,1,2), SUBSTR(job,3,2), substr(job,5) FROM emp;

SELECT job, SUBSTR(job, -LENGTH(job)), SUBSTR(job, -LENGTH(job),2),SUBSTR(job, -3)
FROM emp;

-- 2) 문자열 함수 : INSTR(특정문자 위치 찾기)
-- ('HELLO, ORACLE!', 'L', 5)5번째 문자이후의 l찾기
-- ('HELLO, ORACLE!', 'L', 2, 2) 2번째 이후 & 2번째 L위치 찾기
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
       INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
       INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
       FROM dual;
       
-- 3) 문자열 함수 : REPLACE(찾아서 바꾸기), 원본수정X 화면출력만변경
-- REPLACE('변경하고싶은 단어가 포함된 문장', '변경하고싶은 단어', '변경할 단어')
SELECT REPLACE('이것이 oracle이다', '이것이', 'THIS IS')
FROM dual;
-- 변경할 단어가 없으면 사라진다.
SELECT '010-1234-5678' AS REPLACE_BEFORE,
REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
REPLACE('010-1234-5678', '-') AS REPLACE_2
FROM dual;

--★ 4) 문자열 함수 : CONCAT(문자열 연결)
-- empno, ename을 연결하여 조회
SELECT CONCAT(empno, ename), CONCAT(empno, CONCAT(':', ename))
FROM emp
WHERE ename='SCOTT';

-- 4.1) || : 연결의 의미로 사용됨
SELECT empno || ename, empno || ':' || ename
FROM emp
WHERE ename='SCOTT';

--★ 5) 문자열 함수 : TRIM(공백 제거), LTRIM(왼쪽공백제거), RTRIM(오른쪽공백제거)
--                  사용할때: 웹에서 이름작성시 ' '홍길동일시 공백없애기위해.
SELECT '    이것이     ', TRIM('     이것이        '), LTRIM('     이것이    '), RTRIM('     이것이    ')
FROM dual;

-- 6) 문자열 함수 : REVERSE(거꾸로 출력)
SELECT REVERSE('Oracle') FROM dual;


-- 1) 숫자 함수 : ROUND(반올림), TRUNC(버림), CEIL(입력된 숫자와 가까운 큰 정수)
-- FLOOR(입력된 숫자와 가까운 작은 정수), MOD(나머지)

SELECT ROUND(1324.5678) AS ROUND,
       ROUND(1324.5678, 0) AS ROUND_1,
       ROUND(1324.5678, 1) AS ROUND_2,
       ROUND(1324.5678,-1) AS ROUND_MINUS,
       ROUND(1324.5678,-2) AS ROUND_MINUS2
FROM dual;

SELECT TRUNC(1324.5678) AS TRUNC,
       TRUNC(1324.5678, 0) AS TRUNC_1,
       TRUNC(1324.5678, 1) AS TRUNC_2,
       TRUNC(1324.5678,-1) AS TRUNC_MINUS,
       TRUNC(1324.5678,-2) AS TRUNC_MINUS2
FROM dual;

SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14)
FROM dual;

SELECT MOD(15,6), MOD(10,2), MOD(11,2) FROM dual;

--★ 3) 날짜 함수 1: SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP
-- SYSDATE : 회원가입시 그 날 회원가입한것이라고 기입하며 많이사옹
SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP FROM dual;

--날짜데이터는 연산이 가능함 : EX) 날짜데이터 + 1, -1, 날짜데이터-날짜데이터
-- 날짜데이터 + 날짜데이터는 안됨
SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE +1 AS TOMORROW
FROM dual;

-- 날짜 함수 2: ADD_MONTHS (월 추가)
-- ADD_MONTHS(SYSDATE, 3) SYSDATE에서 3개월을 추가한 날을 출력
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) FROM dual;

-- 입사 10주년이 되는 사원들 조회
SELECT empno, ename, hiredate, ADD_MONTHS(hiredate, 120) FROM emp;

-- 입사 38년 미만인 사원들 조회
SELECT * FROM emp WHERE ADD_MONTHS(hiredate, 456)> SYSDATE;

-- 날짜 함수 3: MONTHS_BETWEEN(두 날짜 사이의 차이 출력)
SELECT * FROM emp WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) < 456;\

SELECT empno, ename, hiredate, SYSDATE, MONTHS_BETWEEN(hiredate, SYSDATE) AS MONTHS1,
MONTHS_BETWEEN(SYSDATE, hiredate) AS MONTHS2, TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) AS TRUNC
FROM emp;

-- 날짜함수 4: NEXT_DAY, LAST_DAY(그 월의 마지막 date)
SELECT SYSDATE, NEXT_DAY(SYSDATE, '월요일'), LAST_DAY(SYSDATE)
FROM dual;

-- ★형변환 함수 : TO_CHAR(날짜, 숫자데이터를 문자로 변환)
--               TO_NUMBER(문자데이터를 숫자로 변환)
--               TO_DATE(문자 데이터를 날짜로 변환)

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS 현재날짜 FROM dual; --2020/11/05
SELECT TO_CHAR(SYSDATE, 'MON') AS 현재날짜 FROM dual; --a월
SELECT TO_CHAR(SYSDATE, 'DD') AS 현재날짜 FROM dual; 
SELECT TO_CHAR(SYSDATE, 'MM') AS 현재날짜 FROM dual; 
SELECT TO_CHAR(SYSDATE, 'DAY') AS 현재날짜 FROM dual; --요일
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') AS 현재날짜 FROM dual; --시:분:초
SELECT TO_CHAR(SYSDATE, 'HH12:MI:SS') AS 현재날짜 FROM dual;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') AS 현재날짜 FROM dual;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS AM') AS 현재날짜 FROM dual;

-- 오늘날짜를 년/월/일 16:51:45표현
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD   HH24:MI:SS') AS 현재날짜시간 FROM dual;

SELECT 1300-TO_NUMBER('1500'), TO_NUMBER('1300')+1500 FROM dual;
SELECT TO_NUMBER('1,300','999,999') - TO_NUMBER('1,500','999,999') FROM dual;

SELECT TO_NUMBER('1,300','999,999') - TO_NUMBER('1,500','999,999') FROM dual;

SELECT TO_DATE ('2020-11-05', 'YYYY/MM/DD') AS TODATE1,
        TO_DATE ('20201105', 'YYYY-MM-DD') AS TODATE2 FROM dual;

-- 1981년6월1일 이후에 입사한 사원정보 조회
SELECT * FROM emp WHERE hiredate > '1981-06-01';
-- 날짜데이터라고 인식시켜주기
SELECT * FROM emp WHERE hiredate > TO_DATE('1981-06-01', 'YYYY//MM/DD');

SELECT TO_DATE('2019-12-20')-TO_DATE('2019-10-20') FROM dual;

-- NULL처리 함수 : NVL, NVL2
SELECT empno, ename, sal, comm, sal+comm FROM emp;
SELECT empno, ename, sal, comm, sal+comm, NVL(COMM,0), SAL+NVL(COMM,0)
FROM emp;

SELECT empno, ename, sal, comm, comm, NVL2(COMM,'O','X'), --NULL이 아니여도 지정
SAL+NVL2(COMM,sal*12+comm, sal*12) AS annsal
FROM emp;

-- DECODE 함수와 CASE문
-- job이 manager, salseman, analyst 경우에 각각의 다른 비율을 적용하고 싶다면?
SELECT empno,ename,job,sal, DECODE(job,
                                    'MANAGER',sal*1.1,
                                    'SALSEMAN',sal*1.05,
                                    'ANALYST',SAL,
                                    SAL*1.03) AS UPSAL 
FROM emp;

SELECT empno,ename,job,sal, CASE JOB
                            WHEN 'MANAGER' THEN SAL*1.1
                            WHEN 'SALSEMAN' THEN SAL*1.05
                            WHEN 'ANALYST' THEN SAL
                            ELSE SAL*1.03
                            END AS UPSAL 
FROM emp;

SELECT empno,ename,job,sal, CASE
                            WHEN COMM IS NULL THEN '해당사항없음'
                            WHEN COMM=0 THEN '수당없음'
                            WHEN COMM>0 THEN '수당 : ' || COMM
                            END AS COMM_TEXT FROM emp;


-- [실습1] : 월평균 근무일수 21.5, DAY_PAY(하루급여) : SAL/21.5,
-- TIME_PAY(시급) : SAL/21.5/8
--SELECT ROUND((sal/21.5),2) ROUND도 사용가능
SELECT empno, ename, sal, TRUNC(sal/21.5, 2) AS DAY_PAY, 
ROUND((sal/21.5/8),1) as TIME_PAY
FROM emp;

-- [실습2]
SELECT empno, ename, hiredate, NEXT_DAY(ADD_MONTHS(hiredate, 3), '월요일') AS R_JOB,
       NVL(TO_CHAR(COMM), 'N/A') AS COMM
FROM emp;

-- [실습3]
-- 다른방법 SELECT SUBSTR(TO_CHAR(mgr),1,2) FROM emp;
SELECT empno, ename, mgr, CASE WHEN MGR IS NULL THEN '0000'
                               WHEN MGR LIKE '75%' THEN '5555'
                               WHEN MGR LIKE '76%' THEN '6666'
                               WHEN MGR LIKE '77%' THEN '7777'
                               WHEN MGR LIKE '78%' THEN '8888'
                               ELSE TO_CHAR(MGR)
                               END AS CHG_MGR
FROM emp;

/* [실습2] */
SELECT job, COUNT(job)
FROM emp
GROUP BY job HAVING COUNT(job) >= 3;