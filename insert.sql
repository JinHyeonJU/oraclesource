--ȸ������, �Խñ� ���, �Ա�..

--������ dept ���̺��� �����ؼ� dept_temp ���̺� ����

create TABLE dept_temp as select * from dept;

--���絥���� ��ȸ
select *
from dept_temp;
--������ �߰��ϱ� (���1)
insert into dept_temp(deptno, dname, loc)
values(50,'DATEBASE','SEOUL');
--������ �߰��ϱ� (���2)
insert into dept_temp values(60,'NETWORK','BUSAN');
--�����߻�
insert into dept_temp(deptno, dname, loc)
values(50,'DATEBASE');

--����   number(2.0) ���ڸ��� �������ִ°��� �����ؿԾ��������� ��
insert into dept_temp(deptno, dname, loc)
values(500,'DATEBASE','SEOUL');

--null �����ϱ�
insert into dept_temp(deptno, dname, loc)
values(70,'DATEBASE',null);

insert into dept_temp(deptno, dname, loc) values(80,'MOBILE','');
--���������� null �����ϱ�

insert into dept_temp(deptno, loc) values(90,'INCHEON');

-- emp ���̺��� emp_temp���̺��� �����Ͻÿ�

create table emp_temp as select * from emp;
--���̺� ����
drop  table emp_temp;


-- emp ���̺��� emp_temp���̺��� �����ϵ� ������ �����ϱ�

create table emp_temp as select * from emp where 1<>1;

select * from emp_temp;

desc emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(9999,'ȫ�浿','PRESIDENT',null,'2020-11-09',4000,null,10);
insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(8888,'������','MANAGER',null,'2020-10-08',3000,null,10);
--�����ݿ�
commit;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(7777,'����ȣ','MANAGER',null,to_date('07/01/2010','dd/mm/yyyy'),3000,null,10);
insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(6666,'�̼���','MANAGER',null,sysdate,4000,null,20);

--emp ���̺��� salgrade ���̺��� �����Ͽ� �޿� ����� 1����� ������� emp_TEMP���̺� �߰��ϰ�ʹٸ�?
--���������� �ۼ��ϱ�(�����Ͱ� �߰��Ǵ� ���̺��� �� ������ ���������� �� ������ ��ġ)
INSERT INTo EMP_TEMP(EMPNO, ENAME, JOB, mgr, hiredate, sal, comm, deptno)
SELECT EMPNO, ENAME, JOB, mgr, hiredate, sal, comm, deptno
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE=1;

select * from emp_temp;
commit;