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

