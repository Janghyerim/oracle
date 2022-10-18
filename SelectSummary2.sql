-- : �ּ�
--DQL(���Ǿ�) : ������ ��ȸ �� �� ���
--select �÷���
--from ���̺��

--��ü ������ ��ȸ �� �� ���
select empno,ename,job,mgr,hiredate,sal,comm,deptno 
from emp; 

select *
from emp;

--�κ��÷� ������ ��ȸ �� ��
select empno,ename,sal
from emp;

select deptno
from emp;

select DISTINCT(deptno)  --�Ȱ����� �ѹ��� ��µǰԲ� �ߺ� ���� : DISTINCT
from emp;

select DISTINCT(job)
from emp;

-- +,-,*,/ ������ �����ڴ� ����.
-- �÷��� ������� �����Ѵ�. (���̺� ��� X)
-- null���� ������ �Ұ��ϴ�.
-- �÷��� ��Ī�� ����� �� �ִ�.
select ename as �����,sal as ����,sal*12+nvl(comm,0)as ����,comm as ������ --�̸� ���� ���� ������
from emp;

--����������
--select �÷���
--from ���̺��
--order by �÷���(���ı����� �Ǵ� ��) asc/desc
select *
from emp
order by hiredate desc;  
--asc(�������� : ���� �����ϴ�)/desc(��������)
--����(1~10),��¥(���ų�¥~�ֱٳ�¥),����(��������)

--���ǰ˻�
--select �÷���
--from ���̺��
--where ���ǽ�(�÷��� = ��); <,>,=,!=,/,<>,<=,>=,and,or
select *
from emp
where sal>=3000;  --�޿��� 3000�̻��� ���

select *
from emp
where deptno=30; --30�� �μ������� ���ϴ� ���


--and������ �ΰ��� �̻��� ������ ��� ���� ���
select *
from emp
where deptno=30 and job='SALESMAN'and empno=7499;

--���ڸ� �������� ����Ҷ�
--��ҹ��� ���� 
-- ' '
select *
from emp
where ename = 'FORD'; --�ҹ��� ford�� ����.

--��¥�� �������� ����� ��
--���� ���� �ٶ��� ' '�� ����ؾ� �Ѵ�.
--��¥�� ũ�Ⱑ �ִ�.
--80/12/20 -> 1980/12/20 �ð� �� �� ����
select *
from emp
where hiredate < '1982/01/01';

--or �ΰ� �̻��� �����߿� �ϳ� �̻� ���� ���
select *
from emp
where deptno = 10 or sal >= 2000;

--not ������ ����(�������� ������ �� ���)
select *
from emp
where sal != 3000;

select *
from emp
where not sal = 3000;

--and , or ������
--���� ������ ǥ���� �� ���
select *
from emp
where sal >= 1000 and sal <= 3000;

select *
from emp
where sal <= 1000 or sal >=3000;

--between and ������
select *
from emp
where sal between 1000 and 3000; --��������1�� ���� ���̴�.

--in ������
select *
from emp
where sal = 800 or sal = 3000 or sal = 5000;

select *
from emp
where sal in(800,3000,5000);

--like������
--���� �Ϻθ� ������ �����͸� ��ȸ�Ѵ�.
--���ϵ�ī�带 ����Ѵ�.(%,_)
-- % ��� ���ڸ� ��ü�Ѵ�.
-- _ �� ���ڸ� ��ü�Ѵ�.
select *
from emp
where ename like 'F%';

select *
from emp
where ename like '%D';

select *
from emp
where ename like '%O%';

select * 
from emp
where ename like '___D'; -- _���

select *
from emp
where ename like 'S___%'; -- _%���� ���ver.

--null������
--is null / is not null
--null�����ʹ� �� �Ұ��ϴ�.
select *
from emp
where comm is null;

select *
from emp
where comm is not null;

--=================================
--���տ�����
--�ΰ��� select������ ����Ѵ�.
--�÷��� ������ �����ؾ��Ѵ�.
--�÷��� Ÿ���� �����ؾ��Ѵ�.
--�÷��� �̸��� �������.
--������(UNION �ΰ��� ����� ���ļ� ��ȸ),������(INTERSECT),������(MINUS)
select empno,ename,sal,deptno
from emp
where deptno = 10
UNION --������
select empno,ename,sal,deptno
from emp
where deptno = 20;

select empno,ename,sal,deptno
from emp
where deptno = 10
UNION ALL --������
select empno,ename,sal,deptno
from emp
where deptno = 10;  --������� �ߺ��Ǹ� �ѹ��� ��ȸ�ȴ�. ALL�� ���̸� �ߺ��� �� ��ȸ�ȴ�.

select empno,ename,sal,deptno
from emp
MINUS --������
select empno,ename,sal,deptno
from emp
where deptno = 10;

select empno,ename,sal,deptno
from emp
INTERSECT --������
select empno,ename,sal,deptno
from emp
where deptno = 10;

--where
--�񱳿�����, ��������, like, is null/is not null, ���տ�����
--�� : <,>,<=,>=,=,!=
--�� : and,or,not,between and,in
--like( %,_)
--�� : is null,is not null
--���� : UNION,MINUS,INTERSECT

--Q1*
select *
from emp
where ename like '%S';

--Q2**
select empno,ename,job,sal,deptno
from emp
where deptno = 30 
and job = 'SALESMAN';

--Q3*
select empno,ename,job,sal,deptno
from emp
where deptno in(20,30) and sal>2000;

--Q3-2*****
select empno,ename,job,sal,deptno
from emp
where deptno = 20 and sal > 2000
UNION
select empno,ename,job,sal,deptno
from emp
where deptno = 30 and sal > 2000;


--Q4***
select *
from emp
where not sal >= 2000 and sal <= 3000; 
--where sal < 2000 or sal > 3000;

--Q5 *****
select empno,ename,job,sal,deptno
from emp
where deptno = 30 and ename like '%E%' and sal not between 2000 and 3000;

--Q6*****
select *
from emp
where comm is null
and job in('MANAGER','CLERK')
and mgr is not null
and ename not like '_L%';






