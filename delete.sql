CREATE TABLE EMP_TEMP3 AS SELECT * FROM EMP; /* EMP 클론테이블 생성 */
SELECT * FROM EMP_TEMP2; /* 테이블 조회 */

/* JOB이 MANAGER인 데이터 삭제하기 */
DELETE FROM EMP_TEMP3 WHERE JOB = 'MANAGER'; /* DELETE 뒤에 별 안들어감 */
DELETE EMP_TEMP3 /* 테이블 EMP_TEMP2의 모든 행 삭제 */
ROLLBACK;

/* EMP_TEMP2 테이블의 사원 중에서 급여가 5000 이상인 사원 삭제 */
DELETE FROM EMP_TEMP3 WHERE SAL >= 5000;

COMMIT;

--급여 등급 3등급 사이에있는 30번 부서의 사원들만 삭제

DELETE FROM EMP_TEMP2 WHERE EMPNO IN (SELECT E.EMPNO
                                   FROM EMP_TEMP2 E, SALGRADE S
                                   WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                                   AND S.GRADE = 3 AND DEPTNO =30);




