--회원가입, 게시글 등록, 입금..

--기존의 dept 테이블을 복사해서 dept_temp 테이블 생성

create TABLE dept_temp as select * from dept;

--현재데이터 조회
select *
from dept_temp;
--데이터 추가하기 (방법1)
insert into dept_temp(deptno, dname, loc)
values(50,'DATEBASE','SEOUL');
--데이터 추가하기 (방법2)
insert into dept_temp values(60,'NETWORK','BUSAN');
--에러발생
insert into dept_temp(deptno, dname, loc)
values(50,'DATEBASE');

--에러   number(2.0) 두자리만 넣을수있는것을 복사해왔었끼떄문에 남
insert into dept_temp(deptno, dname, loc)
values(500,'DATEBASE','SEOUL');

--null 삽입하기
insert into dept_temp(deptno, dname, loc)
values(70,'DATEBASE',null);

insert into dept_temp(deptno, dname, loc) values(80,'MOBILE','');
--묵시적으로 null 삽입하기

insert into dept_temp(deptno, loc) values(90,'INCHEON');

-- emp 테이블을 emp_temp테이블을 생성하시오

create table emp_temp as select * from emp;
--테이블 삭제
drop  table emp_temp;


-- emp 테이블을 emp_temp테이블을 생성하되 구조만 복사하기

create table emp_temp as select * from emp where 1<>1;

select * from emp_temp;

desc emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(9999,'홍길동','PRESIDENT',null,'2020-11-09',4000,null,10);
insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(8888,'성춘향','MANAGER',null,'2020-10-08',3000,null,10);
--최종반영
commit;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(7777,'유승호','MANAGER',null,to_date('07/01/2010','dd/mm/yyyy'),3000,null,10);
insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(6666,'이순신','MANAGER',null,sysdate,4000,null,20);

--emp 테이블에서 salgrade 테이블을 참조하여 급여 등급이 1등급인 사원만을 emp_TEMP테이블에 추가하고싶다면?
--서브쿼리로 작성하기(데이터가 추가되는 테이블의 열 개수와 서브쿼리의 열 개수가 일치)
INSERT INTo EMP_TEMP(EMPNO, ENAME, JOB, mgr, hiredate, sal, comm, deptno)
SELECT EMPNO, ENAME, JOB, mgr, hiredate, sal, comm, deptno
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE=1;

select * from emp_temp;
commit;