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
order by sal asc;  --�������� ����

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


--�Լ�
--�����Լ� : upper,lower,initcap,substr,instr,replace,lpad,rpad,concat
--�����Լ�
--��¥�Լ�

--�����Լ�
--upper,lower,initcap�Լ� : ��ҹ��ڸ� �ٲ��ִ� �� 
select 'Welcome',upper('Welcome') --upper : �����͸� ��� �빮�ڷ� ��ȯ
from dual;

select lower(ename),upper(ename) --lower : �����͸� ��� �ҹ��ڷ� ��ȯ
from emp;

select initcap(ename)
from emp;

select * 
from emp
where ename = 'FORD';

--**********�߿�*******
select * 
from emp
where lower(ename) = 'scott';

--,length �Լ� : ���ڿ� ���̸� ���ϴ� ��
select ename,length(ename)
from emp;

--substr �Լ� : ���ڿ� �Ϻθ� �����ϴ� ��
--������ġ,����
select 'Welcome to Oracle',substr('Welcome to Oracle',2,3),substr('Welcome to Oracle',10)
from dual;  --Wel ����

-- 1        17
--17        1
select 'Welcome to Oracle',substr('Welcome to Oracle',-3,3),substr('Welcome to Oracle',-17)
from dual;

--instr �Լ� : Ư������ ��ġã��
select instr('Welcome to Oracle','o')
from dual; --5

select instr('Welcome to Oracle','o',6)
from dual; --10

select instr('Welcome to Oracle','e',3,2)
from dual; --17

--replace�Լ� : Ư������ �ٸ����ڷ� ��ȯ
select 'Welcome to Oracle',replace('Welcome to Oracle','to','of')
from dual; -- to -> of ��ȯ

--lpad,rpad�Լ� : ����� �޲ٱ�
select 'Oracle',lpad('oracle',10,'#'),rpad('oracle',10,'*'),lpad('oracle',10)
from dual;

select rpad('990103-',14,'*')
from dual; --990103-*******

--concat�Լ� : �� ���ڿ� �����͸� ��ġ�� ��
select concat(empno,ename), empno||''||ename
from emp;

--trim,ltrim,rtrim�Լ� : Ư�����ڸ� ����� ��

--============================================
--���� �Լ�
--round�Լ� : Ư����ġ���� �ݿø�  (�Ҽ��κ� ���� ���)
select 
           round(1234.5678),
           round(1234.5678,0),
           round(1234.5678,1),
           round(1234.5678,2),
           round(1234.5678,-1)  --1230 4���� �ݿø��̴ϱ� 0
from dual;

--trunk�Լ� : Ư����ġ���� ����
select
           trunc(1234.5678),
           trunc(1234.5678,0),
           trunc(1234.5678,1),
           trunc(1234.5678,2),
           trunc(1234.5678,-1) --4�� �������� ����.
from dual; 

--ceil,floor�Լ� : ������ ���ڿ� ����� ������ ã��
select
           ceil(3.14),  --�ڽź��� ū ���� ����� ���� 4
           floor(3.14), --�ڽź��� ���� ���� ����� ���� 3
           ceil(-3.14), -- -3
           floor(-3.14) -- -4
from dual;

--mod�Լ� : ���ڸ� ���� ������ �� ���ϱ�
select
          mod(15,6),  --3
          mod(10,2),  --0
          mod(11,2)   --1
from dual;

--mod�Լ� Ȱ�� )Ȧ���� ��� ��ȸ
select *
from emp
where mod(empno,2) = 1;

--============================================
--��¥ �Լ�
--sysdate�Լ� : ���� ��¥ ���
select sysdate
from dual;

select sysdate-1 ����, sysdate ����,sysdate+1 ����
from dual;

select sysdate - hiredate  as �ٹ��ϼ� --���̰� �ϼ� ��ȯ ��ĥ �ٹ� �ߴ��� ���
from emp;

--add_months�Լ� : ��� ���� ��¥�� ���ϴ� ����









--round �Լ� ����
select sysdate,
            round(sysdate,'cc')as FORMAT_CC,
            round(sysdate,'yyyy')as FORMAT_YYYY,
            round(sysdate,'q')as FORMAT_Q,
            round(sysdate,'ddd')as FORMAT_DDD,
            round(syadate,'hh')as FORMAT_HH
from dual;            

--trunc �Լ� ����
select sysdate,
            trunc(sysdate,'cc')as FORMAT_CC,
            trunc(sysdate,'yyyy')as FORMAT_YYYY,
            trunc(sysdate,'q')as FORMAT_Q,
            trunc(sysdate,'ddd')as FORMAT_DDD,
            trunc(sysdate,'hh')as FORMAT_HH
from dual;    

--�ڷ��� ��ȯ �Լ�
--to_char()
--to_number()
--to_date()

--to_char() : ��¥�� ����
select sysdate , to_char(sysdate,'YYYY-MM-DD  HH24 : MI : SS')as ����ð�
from dual;

select hiredate,to_char(hiredate,'YYYY-MM-DD  HH24 : MI : SS DAY')as �Ի�����
from emp;

--to_char() : ���ڸ� ����
select to_char(123456,'L999,999')
from dual;

select sal,
            to_char(sal,'$999,999')as sal_$,
            to_char(sal,'L999,999')as sal_L,
            to_char(sal,'999,999,00')as sal_1,
            to_char(sal,'000,999,999.00')as sal_2,
            to_char(sal,'000999,999.99')as sal_3,
            to_char(sal,'999,999,00')as sal_4
from emp;

--to_number() : ���ڸ� ����
select '20000'-'5000'  --�ڵ� ����ȯ
from dual;

select '20,000'-'5,000'  --to_number()����ȯ�� �ؾ���. ���� : �޸��� ���� ������ ����.
from dual;

select to_number( '20,000' , '999,999') -to_number('5,000' , '999,999')
from dual;

--to_date() : ���ڸ� ��¥
select to_date('20221019','YYYY/MM/DD')
from dual;

select  * 
from emp
where hiredate < to_date('19820101' , 'YYYY-MM-DD');

--null������ ó��
--nvl(null,�ٲٰ� ���� ������)
--nvl�� null�������� Ÿ�԰� ���� Ÿ���� �����ؾ��Ѵ�.
--nvl(����,����) , nvl(����,����)
select ename �����,sal, sal*12+nvl(comm,0) as ����,comm
from emp;

--����) mgr�� null  ->  ceo
select ename,job,mgr
from emp
where mgr is null;

select ename,job,nvl(to_char(mgr,'9999'),'CEO')as mgr
from emp
where mgr is null ;

select comm, nvl2(comm,'O','X')
from emp;

--���ǹ� ǥ���ϴ� �Լ�
--decode() -> switch
--case  -> if

--decode()
select ename,job,deptno,
            decode(deptno,10,'AAA',20,'BBB',30,'CCC','��Ÿ')as �μ���
from emp;

--case : ������ �������� ������ �� �ִ�.
case
            when ���ǽ� then ���๮
            when ���ǽ� then ���๮
            when ���ǽ� then ���๮
            else ���๮
end as ��Ī

select ename,job,deptno,
case
            when deptno =10 then 'AAA'
            when deptno =20 then 'BBB'
            when deptno =30 then 'CCC'
            else '��Ÿ'
end as �μ���
from emp;

select ename,job,sal,
case 
         when sal between 3000 and 5000 then '�ӿ�'
         when sal >= 2000 and sal < 3000 then '������'
         when sal >= 500 and sal < 2000 then '���'
         else '��Ÿ'
end as ����
from emp;

show user;






