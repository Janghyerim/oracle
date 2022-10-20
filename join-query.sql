--����(join) 
--�ΰ� �̻��� ���̺��� �����Ͽ� �ϳ��� ���̺�ó�� ����ϴ� ���
--from���� �ΰ� �̻��� ���̺��� �ۼ��Ѵ�.
--where���� ���� ������ ������ �ۼ��ؾ� �Ѵ�.
--cross join  �߾Ⱦ�(where�� ���� ����)
--equi join ���� ���� ���(where ������� : =)
--non equi join(where ���������� : and,or)
--self join(where �ϳ��� ���̺��� ����Ѵ�)
--out join(where�� �����Ǵ� �����͸� ���� ��ȸ�ϱ� ���� : (+))
--select������ �̸��� ������ ���̺��� �����Ͽ� ����� ������ ����.

--equi join 
select emp.ename,emp.job,emp.deptno,dept.dname,dept.loc
from emp,dept
where emp.deptno = dept.deptno;

select ename,job,emp.deptno,dname,loc
from emp,dept
where emp.deptno = dept.deptno;

--non equi join
select ename,job,e.deptno,dname,loc
from emp e,dept d --���̺� ��Ī �ִ� ���
where e.deptno = d.deptno
and sal >= 3000;

select ename,sal,grade
from emp e,salgrade s
where e.sal between s.losal and s.hisal;
--where e.sal >= s.losal and e.sal <= s.hisal;

--���,�̸�,�޿�,�μ���ȣ,�μ���,�޿����
--emp                   dept                       salgrade
select empno,ename,sal,d.deptno,dname,grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal;

select  e.empno,e.ename,e.mgr,m.ename
from emp e,emp m  --�ݵ�� ��Ī�ο�
where e.mgr = m.empno;

select ename,deptno
from emp
where deptno = 20;

--self join
--scott�� ���� �μ��� �ٹ��ϴ� ���
--ename         ename
--scott             smith
--scott             jones
--scott             adams
--scott             ford
select work.ename, friend.ename
from emp work, emp friend
where work.deptno  =  friend.deptno
and work.ename = 'SCOTT'
and friend.ename != 'SCOTT';

--out join(�ܺ�����) : ��� �����Ǵ� �����͸� ���� ��ȸ�ϱ����� ����Ѵ�
select e.empno,e.ename,e.mgr,m.ename
from emp e, emp m
where e.mgr = m.empno(+); --�����Ͱ� ���� ���̺��ʿ� (+)�� ���δ�

select ename,sal,d.deptno,d.dname
from emp e, dept d
where e.deptno(+) = d.deptno;

--ANSI-join(ǥ������ ���)
--cross join
--inner join(equi, non equi, self join)  --�� ���
--outer join( (+) ) // [left , right , full] outer join --�� ���
--natural join

select ename,sal,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno; 

select ename,sal,dname,loc
from emp e inner join dept d
using(deptno)  --�������̺��� �÷����� ������ ��쿡�� �����ϴ�
where ename = 'SCOTT';

select e.empno,e.ename,e.mgr,m.ename
from emp e inner join emp m
on e.mgr = m.empno;

select empno,ename,sal,grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

select e.empno,e.ename,e.mgr,m.ename
from emp e left outer join emp m --�����Ͱ� �ִ� ���� �����Ѵ�.[left , right , full]
on e.mgr = m.empno;  --king(null) ���

select empno,ename,sal,d.deptno,dname,grade
from emp e inner join dept d
on e.deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and s.hisal;

select ename,sal,d.deptno,dname
from emp e right outer join dept d
on  e.deptno = d.deptno;

select ename,sal,d.deptno,dname
from emp e full outer join dept d
on e.deptno = d.deptno;

--��������
--�ʿ��� �����͸� �߰��� ��ȸ�ϱ����� �������ȿ� ������ ¥�� ��
--where���� select���� ��ø�ؼ� ����Ѵ�

--���帹�� ������ �޴� �������ϱ�
select ename,max(sal)
from emp;

--��������Ȱ�� ��
select ename,sal
from emp
where sal = (
                        select max(sal)
                        from emp
                        );

--������ �μ��̸� ���ϱ�
select deptno
from emp
where  ename = 'SCOTT';

select dname
from dept
where deptno = 20;

--��������Ȱ�� ��
select dname
from dept
where deptno = (
                                select deptno
                                from emp
                                where ename = 'SCOTT'
                              );

--�޶󽺿� �ٹ��ϴ� ������� �̸�, �μ� ��ȣ ���ϱ�
select ename,deptno
from emp
where deptno = (
                                select deptno
                                from dept
                                where loc = 'DALLAS'
                                );

--�ڽ��� ���ӻ���� king�� ����� �̸��� �޿��� ��ȸ�ϼ���(��������)
select ename,sal
from emp
where mgr = (
                        select empno
                        from emp
                        where ename = 'KING'
                        );
--������ ��������

--������ ��������
-- in : ����߿� �ϳ��� �����ϸ� �ȴ�.
-- >any : ����߿� ���� ������ ���� ũ�� �ȴ�.
-- >all : ����߿� ���� ū �� ���� ũ�� �ȴ�.


--in ������
--�μ� ��ȣ �� ������� �޿��޴� ��������
select *
from emp
where sal in(5000,3000,2850);

select *
from emp
where sal in(
                        select max(sal)  --������ ��������
                        from emp
                        group by deptno
                        );


--�μ���ȣ ���� �ִ� �޿��� �޴� ��� ���� ����
select *
from emp
where (deptno,sal) in(
                                        select deptno,max(sal)
                                        from emp
                                        group by deptno
                                        );


--(=)any ������
select *
from emp
where sal > any(      --��� �����ڰ� �� �־�� ������ �ȴ�. ex) =,<,>,<=,>= ...
                        select max(sal)  --������ ��������
                        from emp
                        group by deptno
                        );
                        
--30�� �μ�������� �ִ�޿����� ���� �޿��� �޴� ��� ���� ����
select *
from emp
where sal<any(
                            select sal
                            from emp
                            where deptno = 30
                            )
order by sal,empno;                            
                        
                        
--some ������
select *
from emp
where sal > some(      --��� �����ڰ� �� �־�� ������ �ȴ�. ex) =
                        select max(sal)  --������ ��������
                        from emp
                        group by deptno
                        );
                  
                          
--all ������
--30�� �μ�������� �ִ� �޿����� ū �޿��� �޴� ������ ����
select ename,sal,deptno
from emp
where sal > all(
                            select sal
                            from emp
                            where deptno = 30
                            );

select *
from emp
where (deptno,sal) in(
                                        select deptno,max(sal)
                                        from emp
                                        group by deptno
                                        );

