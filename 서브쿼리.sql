--단일행 서브쿼리 >,<,>=,<=,같지않음 : !=,^=,<>
--사원이름이 ALLEN 인 사원의 추가수당보다 많이 받는 사원을 출력
select * from emp where comm > (select comm from emp where ename = 'ALLEN');
--사원이름이 WARD 인 사원의 입사일보다 빨리 입사한 사원을 출력
select * from emp where hiredate < (select hiredate from emp where ename = 'WARD');
--20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원을 출력
select * from emp where deptno = 20 and sal > (select avg(sal) from emp);
--20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원의 정보를 출력
--부서명, 지역위치 출력하도록한다.
select * from dept;
select e.empno, e.ename, e.sal, d,deptno, d.dname, d.loc
from emp e, dept d 
????where e.deptno = d.deptno and e.deptno = 20 and sal > (select avg(sal) from emp);
-- 다중행 서브쿼리
-- 서브쿼리의 결과가 2개 이상나오는  경우라면 단일행 서브쿼리 연산자 사용불가
-- 단일행 하위 질의에 2개의 행이 리턴되었습니다.
--select * from emp where sal >=(select max(sal) from emp group by deptno);
select max(sal) from emp group by deptno;
--IN
select * from emp where sal in (select max(sal) from emp group by deptno);
--ANY(some)
--   = any :IN의 수행결과와 같게 나옴. 단,  IN을 더 많이 사용함 
select * from emp where sal = any (select max(sal) from emp group by deptno);
select * from emp where sal = some (select max(sal) from emp group by deptno);
-- 30번 부서사원들의 최대급여보다 적은 급여를 받는 사원을 출력
select * from emp where sal < some (select max(sal) from emp where deptno = 30);

select * from emp where sal < some (select sal from emp where deptno = 30);
select distinct sal from emp where deptno =30;

-- all :서브쿼리의  결과를 모두 만족하는 메인쿼리를 추출할 때
--부서번호가 30번인 사원들의 최소 급여보다  더 적은 급여를 받는 사원 출력
select * from emp where sal < ALL (select sal from emp where deptno = 30);
--exists : in과 비슷한 개념. 단 IN보다 성능이 우수합니다.
-- 서브쿼리의 결과가 존재하면 메인쿼리의 결과도 출력해줌
-- 서브쿼리의 where 문이 중요함
select * from emp where exists (select dname from dept where deptno =20);
select * from emp where not exists (select dname from dept where deptno =20);

select empno, deptno
from emp
where exists (select deptno 
               from dept 
               where deptno in (20,30) and emp.deptno =  dept.deptno);

select empno, deptno
from emp
where exists (select 1 
               from dept 
               where deptno in (20,30) and emp.deptno =  dept.deptno);

select empno, deptno
from emp
where not exists (select 1 
               from dept 
               where deptno in (20,30) and emp.deptno =  dept.deptno);
               
--다중 열 서브쿼리 : 서브쿼리 select 문에 비교할 컬럼이 여러개 나오는 방식

select * from emp where (deptno, sal) in 
               ( select deptno, max(sal) from emp group by deptno);
               
--from 절에 사용하는 서브쿼리(인라인 뷰)
select e.empno, e.ename, d.deptno, d.dname, d.loc
from (select * from emp where deptno =10) e, (select * from dept) d 
where e.deptno = d.deptno;

--select 절에 사용하는 서브쿼리 - 스칼라 서브쿼리