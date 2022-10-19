--������ �Լ��� ������ �׷�ȭ
--sum(),avg(),count(),max(),min()
--�Ϲ� �÷��� ���� ��� �Ұ� : ���� ������ �޶� ������ ����.
--�÷��� ������ �����ؾ� �Ѵ�.
--ũ��񱳰� ���� ��� Ÿ�Կ� ��� ����


--sum �Լ� :��絥���͸� ���ڷ� ��ȸ ���ִ¿���
select sum(sal)  
from emp;

 --���sal���ϱ�
select avg(sal)
from emp;

--count �Լ� : ������ ������ �����ִ� ����
select count(*),count(comm)  --null������ ���� ���ϴ� ����
from emp;

--max�Լ� : �ִ� ���ϴ� ����
--min�Լ� : �ּڰ� ���ϴ� ����
select max(sal),min(sal)
from emp;

select ename,max(sal)  --�Ұ���
from emp;

select ename  --����
from emp;

select max(sal)  --����
from emp;

--�Ի��� ���� �������,������� ���
select min(hiredate),max(hiredate)
from emp
where deptno = 20;


--group by ������� ���ϴ� ���� ��� ���

--select �÷���
--from ���̺��
--where ���ǽ�(�׷��Լ� ���Ұ� / group by,having ���� ��������)
--group by ���� �÷���
--having ���ǽ�(�׷��Լ� ����Ѵ�)
--order by �÷��� ���Ĺ�� -> �Ǹ������� �ۼ�

--�������
select avg(sal) from emp where deptno = 10
UNION
select avg(sal) from emp where deptno = 20
UNION
select avg(sal) from emp where deptno = 30;

--�ڵ� ���
select deptno,avg(sal)
from emp
group by deptno;

select deptno,avg(sal)
from emp
group by deptno
order by deptno;  --������� ���� �ϴ� ����

--+�� �μ����� ���������� ��տ��� ���ϱ�
select deptno,job , avg(sal)
from emp
group by deptno,job
order by deptno,job desc;

--having : group by���� ������ �� �� ���
--���ǽ��� �ۼ��� �� �׷��Լ��� ����Ѵ�.
select deptno,job,avg(sal)
from emp
group by deptno,job
having avg(sal) > 2000  --group by�� ������ �� ��
order by deptno,job;

select deptno,job,avg(sal)
from emp
group by deptno,job
having avg(sal) >=2000
order by deptno, job;

select deptno,job,avg(sal)
from emp
where deptno != 10
group by deptno,job
having avg(sal) >=2000
order by deptno, job;






