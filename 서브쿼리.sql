--������ �������� >,<,>=,<=,�������� : !=,^=,<>
--����̸��� ALLEN �� ����� �߰����纸�� ���� �޴� ����� ���
select * from emp where comm > (select comm from emp where ename = 'ALLEN');
--����̸��� WARD �� ����� �Ի��Ϻ��� ���� �Ի��� ����� ���
select * from emp where hiredate < (select hiredate from emp where ename = 'WARD');
--20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ����� ���
select * from emp where deptno = 20 and sal > (select avg(sal) from emp);
--20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ����� ������ ���
--�μ���, ������ġ ����ϵ����Ѵ�.
select * from dept;
select e.empno, e.ename, e.sal, d,deptno, d.dname, d.loc
from emp e, dept d 
????where e.deptno = d.deptno and e.deptno = 20 and sal > (select avg(sal) from emp);
-- ������ ��������
-- ���������� ����� 2�� �̻󳪿���  ����� ������ �������� ������ ���Ұ�
-- ������ ���� ���ǿ� 2���� ���� ���ϵǾ����ϴ�.
--select * from emp where sal >=(select max(sal) from emp group by deptno);
select max(sal) from emp group by deptno;
--IN
select * from emp where sal in (select max(sal) from emp group by deptno);
--ANY(some)
--   = any :IN�� �������� ���� ����. ��,  IN�� �� ���� ����� 
select * from emp where sal = any (select max(sal) from emp group by deptno);
select * from emp where sal = some (select max(sal) from emp group by deptno);
-- 30�� �μ�������� �ִ�޿����� ���� �޿��� �޴� ����� ���
select * from emp where sal < some (select max(sal) from emp where deptno = 30);

select * from emp where sal < some (select sal from emp where deptno = 30);
select distinct sal from emp where deptno =30;

-- all :����������  ����� ��� �����ϴ� ���������� ������ ��
--�μ���ȣ�� 30���� ������� �ּ� �޿�����  �� ���� �޿��� �޴� ��� ���
select * from emp where sal < ALL (select sal from emp where deptno = 30);
--exists : in�� ����� ����. �� IN���� ������ ����մϴ�.
-- ���������� ����� �����ϸ� ���������� ����� �������
-- ���������� where ���� �߿���
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
               
--���� �� �������� : �������� select ���� ���� �÷��� ������ ������ ���

select * from emp where (deptno, sal) in 
               ( select deptno, max(sal) from emp group by deptno);
               
--from ���� ����ϴ� ��������(�ζ��� ��)
select e.empno, e.ename, d.deptno, d.dname, d.loc
from (select * from emp where deptno =10) e, (select * from dept) d 
where e.deptno = d.deptno;

--select ���� ����ϴ� �������� - ��Į�� ��������