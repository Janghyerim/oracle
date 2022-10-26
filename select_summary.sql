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
--case
--            when ���ǽ� then ���๮
--            when ���ǽ� then ���๮
--            when ���ǽ� then ���๮
--            else ���๮
--end as ��Ī

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


-- case-when ����

--������� ���
select date_of_birth,to_char(date_of_birth,'YYYY/MM/DD') as �������
from customers;
--�������
select date_of_birth,to_char(date_of_birth,'YYYY/MM/DD') as �������,
round((sysdate - date_of_birth) / 365) || '��' as ����
from customers;
 
select date_of_birth,to_char(date_of_birth, 'yyyy-mm-dd'),
       round((sysdate - date_of_birth) / 365) || '��' as ����,
       case 
       when round((sysdate - date_of_birth) / 365) between 10 and 19 then '10��'
       when round((sysdate - date_of_birth) / 365) between 20 and 29 then '20��'
       when round((sysdate - date_of_birth) / 365) between 20 and 29 then '30��'
       when round((sysdate - date_of_birth) / 365) between 30 and 39 then '40��'
       when round((sysdate - date_of_birth) / 365) between 40 and 49 then '50��'
       when round((sysdate - date_of_birth) / 365) between 50 and 59 then '60��'
       when round((sysdate - date_of_birth) / 365) between 60 and 69 then '70��'
       else '��Ÿ'
       end as ���ɴ�
       from customers;
       
select  round((sysdate - date_of_birth) / 365),
       case 
       when round((sysdate - date_of_birth) / 365) >= 10 and round((sysdate -date_of_birth) / 365) < 20 then '10��'
       when round((sysdate - date_of_birth) / 365) between 20 and 29 then '20��'
       when round((sysdate - date_of_birth) / 365) between 30 and 39 then '30��'
       when round((sysdate - date_of_birth) / 365) between 40 and 49 then '40��'
       when round((sysdate - date_of_birth) / 365) between 50 and 59 then '50��'
       when round((sysdate - date_of_birth) / 365) between 60 and 69 then '60��'
       when round((sysdate - date_of_birth) / 365) between 70 and 79 then '70��'
       else '��Ÿ'
    end as ���ɴ� 
from customers;
 
show user;  --���� ������ ������ִ� ��ɾ�

--7��


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

--========================================
-- where mod(empno,2) = 1;
-->>>>>>> 1fa4dde7c683476d8b39d02b701f00b45d3b3a9a

-- sql developer




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

--p 266 scott����


--10��
--DML(������ ���۾�) : insert , update , delete
--insert : ���̺� ������ ����
--insert into ���̺��(�÷���1,�÷���2,.....)
--values(��1,��2,.....)
--�÷��� ���� Ÿ�԰� ������ ��ġ�ؾ��Ѵ�(1:1)
--�ۼ� ������� 1:1 ��Ī�ȴ�

create table dept_temp
as
select * from dept;

select * 
from dept_temp;

insert into dept_temp(deptno,dname,loc)
values(50,'DATABASE','SEOUL');

insert into dept_temp(deptno,dname) --������ NULL ������ ����
values(60,'JSP');

insert into dept_temp --�÷�����
values(70,'HTML','SEOUL');

insert into dept_temp --�÷�����, ����� NULL������ ����
values(80,NULL,'SEOUL');


create table emp_temp
as
select * from emp
where 1 != 1;

select *
from emp_temp;

insert into emp_temp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
values (9999,'ȫ�浿','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
values (3111,'��û��','MANAGER',9999,SYSDATE,4000,1000,10);

--update : �÷��� �����͸� ����(����)
--update ���̺��
--set �÷��� = ��, �÷Ÿ� = ��,...
--where ���ǽ�
--�������� ������� ������ �ش� �÷��� ��� ����ȴ�

create table dept_temp2
as
select * from dept;

select *
from dept_temp2;

update dept_temp2
set loc = 'SEOUL';

drop table dept_temp2;


create table dept_temp2
as
select * from dept;

update dept_temp2
set dname = 'DATABASE', loc = 'SEOUL'
where deptno =40;

--delete(������ ����)
--delete from ���̺��
--where ���ǽ�
--�������� ������� ������ ��� �����Ͱ� �����ȴ�

create table emp_temp2
as
select * from emp;

delete from emp_temp2;

select *
from emp_temp2;

drop table emp_temp2;

create table emp_temp2
as
select * from emp;


delete from emp_temp2
where ename ='SCOTT';

select *
from emp_temp2;

--TCL(�������� ���� ���� �Ǵ� ���)
--Ʈ�����
--commit , rollback, savepoint
--commit : ������ ���� ����(���̺��� ������ �ݿ�)
                    --create ������ ����ؼ� ��ü ������ ��(�ڵ�)
--rollback : ������ ���� ���(���̺��� ������ �̹ݿ�) ���󺹱�
                    --õ������,����,����(�ڵ�)
--savepoint : 

drop table dept01;

create table dept01
as
select * from dept;

select * 
from dept01;

delete from dept01;

--commit;
rollback;

--Ʈ����� ���� ����
drop table dept01;

create table dept01
as
select * from dept;

select * 
from dept01;

delete from dept01;

commit;
rollback;

truncate table dept01;  --commit�̵Ǵ� ��ɾ�
rollback;

select * 
from dept01;


--DDL(������ ���Ǿ�) : table(��簴ü)�� ����,����,�����ϴ� ��ɾ�
--create(����) , alter(����) , drop(����)


--���̺� ���� create
create table ���̺��(   --table(��ü)
        �÷���1 Ÿ��,           --column(�Ӽ�)
        �÷���2 Ÿ��,
        �÷���3 Ÿ��
);

drop table emp_ddl;

create table emp_ddl(  -- ���,�̸�,��å,������,�Ի���,����,������,�μ���ȣ
            empno number(4),
            ename varchar2(10), --byteũ��
            job varchar2(9),
            mgr number(4),
            hiredate date, --��¥�� ���� ������ �������� �ʰ� Ÿ�Ը� �����ϸ� �ȴ�.
            sal number(7,2),
            comm number(7,2),
            deptno varchar2(2)
);

select *
from emp_ddl;

insert into emp_ddl
values(9999,'�̼���','MANAGER',1111,sysdate,1000,null,10);



create table dept_ddl --���̺��� ����
as
select * from dept;

create table dept_30  --30�� �����͸� �����Ѵ�
as
select * from dept
where deptno = 30;

create table dept_m  --m �����͸� �����Ѵ�
as
select dname,loc
from dept;

create table dept_d  --���̺��� ������ �����Ѵ�
as
select * from dept
where 1 != 1;

--���̺� ����(�÷��� ���� ����) alter
--���ο� �÷��߰�, �÷��� �̸�����, �ڷ����� ����, �÷��� ����
--alter

create table emp_alter
as
select * from emp;

select * 
from emp_alter;

alter table emp_alter
add address varchar2(100);

alter table emp_alter
rename column address to addr;

alter table emp_alter
modify empno number(10);

alter table emp_alter
drop column addr;

--���̺� ���� drop
--drop table ���̺��

drop table emp_alter;

--������ ���� : DB�� ���� �����͸� ����

select * 
from emp_alter;

desc user_tables;

select table_name
from user_tables;  --���̺�� ���

select owner, table_name  --���̺� ���ΰ� ���� ���
from all_tables;

--index(�ε���) : �˻� �ӵ��� ����Ű�� ��ü
--create(����) , drop(����)
--select ������ �˻� �ӵ��� ����Ų��
--��ü ���ڵ��� 3% ~ 5% ������ �� 
--index ��ü�� �÷��� �����ؼ� ����Ѵ�

create index �ε�����
on ���̺��(�÷���);
 
drop table emp01;
 
create table emp01
as
select * from emp;

select * 
from emp01;

insert into emp01
select * from emp01;

insert into emp01(empno,ename)
values(1111,'bts');

--index ��ü ���� ��(0.030~0.040)
select empno,ename
from emp01
where ename = 'bts';

--index ��ü ����
create index idx_emp01_ename
on emp01(ename);

--index ��ü ���� ��(0.001~0.002)
select empno,ename
from emp01
where ename = 'bts';

--index ����
drop index idx_emp01_ename;

--���̺� ���� �� ����
show RECYCLEBIN; --���� ���̺� Ȯ��

flashback table EMP_HW
to before drop;   --���̺� ���� / Flashback��(��) �����߽��ϴ�.

purge recyclebin;  --������ ����(�뷮����) / Recyclebin��(��) ��������ϴ�.

 -----------p360
 
 --��������(���Ἲ) : �߸��� ���� �����ͷ� ���Ǵ� ���� ���ϰ� �ϴ� ��
--not null
--unique
--primary key (�⺻Ű)
--foreign key (�ܷ�Ű/����Ű)
-- 1.�θ�� �ڽ��� ���踦 ������ �ڽ� �� ���̺� �����Ѵ�.
--2.�θ� �� ���̺��� �÷��� �ݵ�� primary key �Ǵ� unique �ؾ��Ѵ�.
--3. null �����͸� ����Ѵ�.
--check
--default

--emp,deptȰ��
insert into emp
values(1111,'aaa','MANAGER',9999,sysdate,1000,NULL,50);
--���� ���� -
--ORA-02291: ���Ἲ ��������(SCOTT.FK_DEPTNO)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�

drop table emp02;

create table emp02(     --���������� ��ĭ�� �ߺ����� ��� �����ϴ�.
                                    empno number(4) primary key, --not null + unique, --�ݵ�� null�� �ƴ� �����Ͱ� ���;� �Ѵ�. null�̸� ���� ��ġ�� ����.
                                    ename varchar2(10) not null,
                                    job varchar2(9),
                                    deptno number(2)
                                    );
delete from emp02;

select * from emp02;                            
                                    
insert into emp02
values(1111,'ȫ�浿','MANAGER',30);   

insert into emp02
values(2222,'ȫ�浿','MANAGER',30);   

insert into emp02
values(1111,'�̼���','MANAGER',20);

insert into emp02
values(null,'������','SALESMAN',20);

insert into emp02
values(2222,'������','SALESMAN',10);
                                    
insert into emp02
values(null,null,'MANAGER',30);

select * from emp02;


--�������� �����ϱ�

drop table emp04;

create table emp04(     --���������� ��ĭ�� �ߺ����� ��� �����ϴ�.
                         --�������� ����������� constraint+�������Ǹ�
                                    empno number(4) constraint emp04_empno_pk primary key, --not null + unique, --�ݵ�� null�� �ƴ� �����Ͱ� ���;� �Ѵ�. null�̸� ���� ��ġ�� ����.
                                    ename varchar2(10) constraint emp04_ename_nn not null,
                                    job varchar2(9),
                                    deptno number(2)
                                    );
delete from emp04;

select * from emp04;                            
                                    
insert into emp04
values(1111,'ȫ�浿','MANAGER',30);   

insert into emp04
values(2222,'ȫ�浿','MANAGER',30);   

insert into emp04
values(1111,'�̼���','MANAGER',20);

insert into emp04
values(null,'������','SALESMAN',20);

insert into emp04
values(2222,'������','SALESMAN',10);
                                    
insert into emp04
values(null,null,'MANAGER',30);

select * from emp04;           



create table emp07(
                                    empno number(4) constraint emp07_empno_pk primary key,
                                    ename varchar2(9)  constraint emp07_empno_nn not null,
                                    job varchar2(9),
                                    deptno number(2)  constraint emp07_deptno_fk references dept07(deptno)
                                    );
                                    
create table dept07(
                                    deptno number(2) constraint dept07_deptno_pk primary key,
                                    dname varchar2(20) constraint dept07_dname_nn not null,
                                    loc varchar2(20) constraint dept07_loc_nn not null
                                    );
                                    
--������������ ����� ������ ����

insert into dept07
select * from dept;

insert into emp07
select empno,ename,job,deptno from emp;

select * from emp07;
select * from dept07;

insert into emp07
values (1111,'aaa','MANAGER',50);


create table emp08(
                                    empno number(4) primary key,
                                    ename varchar2(10) not null,
                                    sal number(7) constraint emp08_sal_ck check(sal between 500 and 5000),
                                    gender varchar2(2) constraint emp08_gender_ck check(gender in('M','F'))
                                    );

select * from emp08;                                  

insert into emp08
values(1111,'hong',1000,'M');

insert into emp08
values(2222,'hong',200,'M');

insert into emp08
values(3333,'hong',1000,'A');

create table dept08(
                                    deptno number(2) primary key,
                                    dname varchar2(10) not null,
                                    loc varchar2(15) default 'SEOUL'
                                    );

insert into dept08(deptno,dname)
values(10,'SALES');

insert into dept08(deptno,dname,loc)
values(20,'SALES','BUSAN');

select * from dept08; 

--�������� �������
--�÷� ������ ����(not null�� �÷� ���������� ����)
--���̺� ������ ����(not null�� ������ �� ����)
--1. ���̺� �ȿ��� ���� �ϴ� ���
--2. Alter ��ɾ ��� �ϴ� ���


create table emp09(
                                    empno number(4),
                                    ename varchar2(20) constraint emp09_ename_nn not null,  --�÷�����
                                    job varchar2(20),
                                    deptno number(20),
                                    
                                    constraint emp09_empno_pk primary key(empno),  --���̺���
                                    constraint emp09_empno_uk unique (job),
                                    constraint emp09_deptno_fk foreign key(deptno) references dept(deptno)
                                    );

insert into emp09
values(3333,'HONG','PRESIDENT',80);

--����Ű(�⺻Ű�� �ΰ��� �÷��� ����ϴ� ���)

create table member(
                                        name varchar2(10),
                                        address varchar2(30),
                                        hphone varchar2(10),
                                        
                                        constraint member_name_address_pk primary key(name,address)
                                        );


create table emp10(
                                    empno number(4),
                                    ename varchar2(20),
                                    job varchar2(20),
                                    deptno number(20)
                                    );

alter table emp10
add constraint emp10_empno_pk primary key(empno);

alter table emp10
add constraint emp10_empno_fk foreign key(deptno) references dept(deptno);

--not null�� ������ ����(null -> not null)
alter table emp10
modify job constraint emp10_job_nn not null;

alter table emp10
modify ename constraint emp10_ename_nn not null;

alter table emp10
drop constraint emp10_empno_pk;--�������Ǹ�(constraint) �Ǵ� ��������(primary key)

drop table emp10;

--========================================
 drop table dept11;
 
 create table dept11(
                                    deptno number(2),
                                    dname varchar2(10),
                                    loc varchar2(15)
                                    );        
                                    
alter table dept11
add constraint dept11_deptno_pk primary key(deptno);        


drop table emp11;

create table emp11(
                                    empno number(4),
                                    ename varchar2(20),
                                    job varchar2(20),
                                    deptno number(20)
                                    );
                                    
alter table emp11
add constraint emp11_empno_pk primary key(empno);        

alter table emp11
add constraint emp11_deptno_fk foreign key(deptno) references dept11(deptno);        

insert into dept11
select * from dept;

insert into emp11
select empno,ename,job,deptno
from emp;

delete from dept11
where deptno = 10;
                                    
alter table dept11
disable primary key cascade; --��Ȱ��ȭ ��Ű�� ��

alter table dept11
drop primary key cascade;



--��ü : table, index, view
--create or replace view �����̺��([alias])
--as
--��������(select)
--[with check option]
--[with read only]


drop table dept_copy;
drop table emp_copy;

create table dept_copy  --���� ���̺� �����  / ����Ǵ� ���̺��� ���������� �� �Ѿ�´�.
as
select * from dept;

create table emp_copy
as
select * from emp;

alter table emp_copy
add constraint emp_copy_deptno_fk foreign key(deptno) references dept(deptno);

select * from emp_copy; --14��

create or replace view emp_view30  --�信 ������ �÷��� ��ȸ�� �����ϴ�, ī�Ǵ� ���� ��ȸ
as
select empno,ename,sal,deptno from emp_copy
where deptno = 30;

select * 
from emp_view30;

insert into emp_view30
values(1111,'hong',1000,30); 

insert into emp_view30(empno,ename,sal)
values(2222,'hong',1000);  --deptno�� null�� ����ȴ�.

insert into emp_view30(empno,ename,sal,deptno)
values(2222,'hong',1000,50);  --deptno�� null�̹Ƿ� ������ �ȵȴ�.

select * 
from emp_copy;


create or replace view emp_view(�����ȣ,�����,�޿�,�μ���ȣ)
as
select empno,ename,sal,deptno
from emp_copy;

select * from emp_view;

select * 
from emp_view
where �μ���ȣ = 20;
--where deptno = 20;  --error : ��Ī�� �ѹ� �ְ��� �� �ڷδ� ���� �÷������� ��� �Ұ��ϴ�.

create or replace view emp_dept_view
as
select empno,ename,sal,e.deptno,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno
order by empno desc;

select *
from emp_dept_view;


--���� ��
--�μ��� �ּұ޿��� �ִ�޿�
--dname,min_sal,max_sal
create or replace view sal_view(dname,min_sal,max_sal)
as
select dname,min(sal) min_sal ,max(sal) max_sal
from emp e inner join dept d
on e.deptno = d.deptno
group by d.dname;

select *
from sal_view;

drop view sal_view;

--��� ��ü�� �̸��� �ߺ��� �� ����.
create or replace view sal_view
as
select dname,min(sal) min_sal ,max(sal) max_sal,round(avg(sal),0) as avg_sal
from emp e inner join dept d
on e.deptno = d.deptno
group by d.dname;


--with check option
create or replace view view_chk30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with check option; --option �� ���� : �������� �÷��� �������� ���ϰ� �Ѵ� 

update view_chk30  --���� WITH CHECK OPTION�� ���ǿ� ���� �˴ϴ�
set  deptno = 10;


--with read only
create or replace view view_read30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with read only;   --��� �÷��� ���� C U D �� �Ұ���(��ȸ�� �����ϴ�)

update view_read30  --�б� ���� �信���� DML �۾��� ������ �� �����ϴ�. (insert,update,delete)
set  deptno = 10;

--���� Ȱ��
--TOP - N ��ȸ�ϱ�
--ROWNUM ���� ������ ��ȸ
select * from emp;

--�Ի����� ���� ���� 5���� �����ȸ
select * from emp
order by hiredate asc;

select * from emp
where hiredate <= '81/05/01' ;   

DESC emp;

--���� Ȱ�� ���� 1)                       
select rownum,empno,ename,hiredate
from emp
where rownum <= 5;

select rownum,empno,ename,hiredate
from emp
order by hiredate asc;  --rownum�� ������� ���ĵ��� �ʴ´�.

--���� Ȱ�� ���� 2)
create or replace view view_hiredate
as
select empno,ename,hiredate
from emp
order by hiredate asc;

select rownum,empno,ename,hiredate 
from view_hiredate
where rownum <= 7;

--2)�� rownum 2~4�� ����ϱ�
select rownum,empno,ename,hiredate
from view_hiredate  --rownum�� �������ĵǰ� �Ի��ϵ� �������ĵȴ�.
where rownum between 2 and 5;  --��� ���� : rownum�� �������� ���� ���� �ݵ�� 1�� �����ϴ� ���ǽ��� ������ �Ѵ�.

create or replace view view_hiredate_rm  --rownum�� ��ȸ������ �������⶧���� ���������� ����ϱ����ؼ��� �����ؾ���
as
select rownum rm ,empno,ename,hiredate  --rownum rm ��Ī�� ����� �ٽ� ���̺� �����Ѵ�
from view_hiredate;

select rm,empno,ename,hiredate
from view_hiredate_rm;

select rm,empno,ename,hiredate
from view_hiredate_rm
where rm >= 2 and rm <= 4;

--�ζ��� �� Ȱ�� ����
select rm, b.*
from  ( 
            select rownum rm, a.*
            from (
                       select empno,ename,hiredate
                       from emp
                       order by hiredate asc
                       )a
           )b           
where rm >= 2 and rm <= 4;


--�ζ��� ��� �Ի����� ������� ���5�� �����ϱ�
 select rownum,empno,ename,hiredate
            from( 
                       select empno,ename,hiredate
                       from emp
                       order by hiredate asc
                     )a
where rownum <= 5 ;                                   

--������(sequence)
--�ڵ����� ��ȣ�� ������Ű�� ��� ����
--create , drop
--nextval , currval

--create sequence ��������
--start with ���۰� => 1(�⺻��)
--increment by ����ġ =>1
--maxvalue �ִ� => 10�� 1027
--minvalue �ּڰ�  => 10�� -1027

drop sequence dept_deptno_seq;

create sequence dept_deptno_seq
increment by 10
start with 10;

select dept_deptno_seq.nextval--������ ���� �뵵
from dual;

select dept_deptno_seq.currval --���� ������ Ȯ�� �뵵 =>���� �� �� ����
from dual;

--=========================
drop sequence emp_seq;

create sequence emp_seq
increment by 1
start with 1
maxvalue 1000;

drop table emp01;

create table emp01
as
select empno,ename,hiredate from emp
where 1 != 1;

select * from emp01;

insert into emp01
values(emp_seq.nextval,'hong',sysdate);  --empno = 2�� ��µǴµ� �̴� ����Ŭ �����̰� �ذ�å�� ���� ����.
--�ݺ��Ͽ� ����ϸ� empno�� �ڵ� �����ȴ�.



drop table  product;

create table product(
                                        pid varchar2(10),
                                        pname varchar2(10),
                                        price number(5),
                                        
                                        constraint product_pid_pk primary key(pid)
                                     );
create sequence idx_product_id
start with 1000;

insert into product
values('pid'|| idx_product_id.nextval,'ġ��',1000); -- || �������ִ� ������

select * from product;

drop sequence idx_product_id;

--p392 end

--PL/SQL���� p419
--PL/SQL(Ȯ��Ǿ��� SQL���)
--����,���ǹ�,�ݺ��� �� �߰��� ����ؼ� SQL�� �����ϰ� ǳ���ϰ� ����� �� ����.

--�⺻���� PL/SQL ����
-- declare 
--     ������ ����
-- begin -> �ʼ�����!!
--     SQL���� �ۼ�
--     ��±��� �ۼ�  --> �������� �������� �ݵ�� ����Լ��� ���ؼ� Ȯ���ؾ� �Ѵ�.
-- exception
--     ���� ó�� ����
-- end; -> �ʼ�����!!
-- /  --�������� ������ �������� �ʼ��� �־���� �Ѵ�.

--��������ȸ===============================================================

--PL/SQL �ʱ⼼��

set serveroutput on;  --�⺻������ �ʱ� ���� �س��´�.

begin
          dbms_output.put_line('Hello World'); --����Լ� (�ڹ��� sysout������ ����.)
end;
/
--=======================================================================
--�⺻���� PL/SQL ���� ���� Ȱ��� ���� �� �ʱ�ȭ 

declare
--            vempno number(4);  --������ ����
--            vename varchar2(10);

                vempno constant number(4) := 7777;      --������ ����� �ʱ�ȭ ���ÿ� �ϴ� ���    /constant�� ���� ����� ��ȯ�ȴ�.
                vename varchar2(10) not null  := 'SCOTT';  --not null�� ���̸� null���� ������ ������ ����� �� ����.
begin
--            vempno := 7777;       --������ �ʱ�ȭ / := �ݷд� �� ���� �ٿ��� ����ؾ� �Ѵ�.
--            vename := 'SCOTT';
            
            dbms_output.put_line('��� / �̸�');
            dbms_output.put_line(vempno || ' ' || vename);
end;
/
--========================================================================
--��Ŭ���� 2���� ���

declare 
            --��Į�� ���
            --vempno number(4);
            --���۷��� ��� (�� ���� ����)
            vempno emp.empno%type := 7777 ;  --���� ���̺��� �÷��� Ÿ���� �����Ѵ�. / % : �����ϴ� 
 begin 
            --vempno := 7777;
            dbms_output.put_line(vempno);
 end; 
 /
--=========================================================================
--���۷��� ��� Ȱ�� / ������ ũ�� PL/SQL ������ �ִ� ������ ����.

declare 
            --���۷��� ��� (�� ���� ����)
            vempno emp.empno%type;  
            vename emp.ename%type;
begin            --try ����   

           select empno,ename 
           into vempno,vename  --empno,ename �� vempno,vename�� �־��ش�.
           from emp;
           --where empno = 7788; --�ʼ�
           --select������ PL/SQL ������ ������ into ���� where���� �ʼ��� �ݵ�� ���;� �Ѵ�.
           
           dbms_output.put_line('��� / �̸�');
           dbms_output.put_line(vempno || ' ' || vename);
           
exception      --catch ����       --where���� ���� ���,  / when-then ������ ����.
           
           when TOO_MANY_ROWS then dbms_output.put_line('���� ���� ���� �� �Դϴ�.');
           when OTHERS then dbms_output.put_line('��� ���ܿ� ���� ó��');
end; 
 /
--=========================================================================
--emp ���̺� �ִ� ����� �̸��� ���� �����ϱ�

declare
            --���̺� type (����� ���� ���� Ÿ�� )
            --�迭�� ���İ� ����
            --vename varchar2(10)
            
            TYPE empno_table_type IS TABLE OF emp.empno%type
            INDEX BY BINARY_INTEGER;
            
            TYPE ename_table_type IS TABLE OF emp.ename%type
            INDEX BY BINARY_INTEGER;
            
            TYPE job_table_type IS TABLE OF emp.job%type
            INDEX BY BINARY_INTEGER;
            
            TYPE mgr_table_type IS TABLE OF emp.mgr%type
            INDEX BY BINARY_INTEGER;
            
            TYPE hiredate_table_type IS TABLE OF emp.hiredate%type
            INDEX BY BINARY_INTEGER;
            
            TYPE sal_table_type IS TABLE OF emp.sal%type
            INDEX BY BINARY_INTEGER;
            
            TYPE comm_table_type IS TABLE OF emp.comm%type
            INDEX BY BINARY_INTEGER;
            
            TYPE deptno_table_type IS TABLE OF emp.deptno%type
            INDEX BY BINARY_INTEGER;
            
            empnoArr empno_table_type;
            enameArr ename_table_type;  --�迭 ������ ���� ����
            jobArr job_table_type;              --�迭 ������ ���� ����
            mgrArr mgr_table_type;
            hiredateArr hiredate_table_type;
            salArr sal_table_type;
            commArr comm_table_type;
            deptnoArr deptno_table_type;
            
            
            i BINARY_INTEGER := 0;  --���� i ����

begin  --�ݺ��� ���
            for k in (select * from emp) loop
                        i := i + 1;  --index��ȣ�� �ڹ� 0�� ���۰� �޸� 1������ ���ȴ�.
                        empnoArr(i) := k.empno;
                        enameArr(i) := k.ename;  --select�������� ��ȸ�� k.ename , k.job
                        jobArr(i) := k.job;
                        mgrArr(i) := k.mgr;
                        hiredateArr(i) := k.hiredate;
                        salArr(i) := k.sal;
                        commArr(i) := k.comm;
                        deptnoArr(i) := k.deptno;
                        
            end loop;
            
            for j in 1..i loop 
                        dbms_output.put_line(empnoArr(j) || ' / ' || enameArr(j) || ' / ' || jobArr(j) || ' / ' || mgrArr(j) || ' / ' || hiredateArr(j) || ' / ' || salArr(j) || ' / ' || commArr(j) || ' / ' || deptnoArr(j));
            end loop;

end;
/
--==========================================================================
declare
            
            --���̺� type (����� ���� ���� Ÿ�� )
            --�迭�� ���İ� ����
            --vename varchar2(10)
            
             TYPE emp_record_type IS RECORD(
                        v_empno emp.empno%type,
                        v_ename emp.ename%type,
                        v_job emp.job%type,
                        v_deptno emp.deptno%type               
             );
             
             emp_record emp_record_type; --���ڵ� Ÿ���� ���� ����;
begin
            --���ڵ� type(�������� ������ ��� ����Ѵ�) => ����� ���� ���� Ÿ��
            --Ŭ������ �����ϴ�.
            select empno,ename,job,deptno
            into emp_record
            from emp
            where empno = 7788;
            
            dbms_output.put_line(emp_record.v_empno || ' ' || emp_record.v_ename || ' ' || emp_record.v_job || ' ' || emp_record.v_deptno);
            
end;
/
--============================================================================



--������ ���� �� ����=============================================================
create table dept_record
as
select * from dept;

declare
            TYPE rec_dept IS RECORD(
                    v_deptno dept_record.deptno%type,
                    v_dname dept_record.dname%type,
                    v_loc dept_record.loc%type
            );
            
            dept_rec rec_dept;  --������ ���̺���� ������ ������.
begin
            dept_rec.v_deptno := 50;
            dept_rec.v_dname := 'DEV';
            dept_rec.v_loc := 'BUSAN';
            
            insert into dept_record
            values dept_rec;  --values�� (��ȣ)�� ���ڵ幮������ �Ƚ�� �Ѵ�.
end;
/
select * from dept_record;


--���� ���� ���̺� ���� ������Ʈ����====================================================

declare
            TYPE rec_dept IS RECORD(
                    v_deptno dept_record.deptno%type not null  := 99,
                    v_dname dept_record.dname%type,
                    v_loc dept_record.loc%type
            );
            
            dept_rec rec_dept;
         
begin
            dept_rec.v_deptno := 50;
            dept_rec.v_dname := 'INSA';
            dept_rec.v_loc := 'SEOUL';
            
            update dept_record
              -- �ٲٰ� ���� �÷��� = 50,'SEOUL'
            set dname = dept_rec.v_dname , loc = dept_rec.v_loc
            where deptno = dept_rec.v_deptno;
            
end;
/
select * from dept_record;

--���̺� ����===========================================================================
declare
           v_deptno dept_record.deptno%type := 50;
begin
          delete from dept_record
          where deptno = v_deptno;     
end;
/

--���ǹ�===============================================================================

declare 
            vempno number(4);
            vename varchar2(10);
            vdeptno varchar2(10);
            vdname varchar2(10) := null ;

begin
            select empno,ename,deptno
            into vempno,vename,vdeptno
            from emp
            where empno = 7788;
            --oracle������ if�� Ư��
--            if( ���ǽ� ) then     
--                        ���๮
--            end if ;
             if( vdeptno = 10 ) then    
                         vdname := 'AAA';
            end if ;
            
            if( vdeptno = 20 ) then     
                         vdname := 'BBB';
            end if ;
            
            if( vdeptno = 30 ) then     
                         vdname := 'CCC';
            end if ;
            
            if( vdeptno= 40 ) then    
                         vdname := 'DDD';
            end if ;
            
            dbms_output.put_line('�μ��� : ' || vdname);

end;
/
--%ROWTYPE===========================================================================

declare
            --%ROWTYPE : ���̺��� ��� �÷��� �̸��� ������ �����ϰڴ�.
            --�÷����� ���������� ���ǰ� �÷��� Ÿ���� ������ Ÿ������ ����Ѵ�.
            
            vemp emp%rowtype;         --emp���̺��� 8���� �÷��� ������ ���Ǵ� �� 
            
begin
            select *
            into vemp  --%rowtype���� ���ǵ� Ÿ��
            from emp
            where empno = 7788;
            
            dbms_output.put_line(vemp.empno);  --empno : 7788�� ���� ��� ���� ��ȸ
            dbms_output.put_line(vemp.ename); 
            dbms_output.put_line(vemp.job);
            dbms_output.put_line(vemp.mgr);
            dbms_output.put_line(vemp.hiredate);
            dbms_output.put_line(vemp.sal);
            dbms_output.put_line(vemp.comm);  --null�����ʹ� �������� ��µȴ�. / null�� ��µǴ°� ���� ��ɸ��� �ٸ�.
            dbms_output.put_line(vemp.deptno);
            
end;
/

--======================================================================================
--���� 

--��Į�� ���
--���۷��� ���
--    1. emp.empno%type
--    2. emp%rowtype

--����� ���� ���� Ÿ��
--    1. ���̺� type
--                   -TYPE empno_table_type IS TABLE OF emp.empno%type
--                   -INDEX BY BINARY_INTEGER;
--    2. ���ڵ� type
--                   -TYPE rec_dept IS RECORD(
--                   -v_deptno dept_record.deptno%type not null  := 99,
--                   -v_dname dept_record.dname%type,
--                   -v_loc dept_record.loc%type
--                   - );

--=======================================================================================

--���� 1-1 if-then / end if ��

declare
            --%ROWTYPE : ���̺��� ��� �÷��� �̸��� ������ �����ϰڴ�.
            --�÷����� ���������� ���ǰ� �÷��� Ÿ���� ������ Ÿ������ ����Ѵ�.
            vemp emp%rowtype;
            annsal number(7,2);

begin 
            dbms_output.put_line('��� / �̸� / ����');
            dbms_output.put_line('------------- ');
            
            select *
            into vemp 
            from emp
            where empno = 7788;
            
            --Q1.
            --�ش� ����� ������ ����϶�. ��, Ŀ�̼��� null�� ��� 0���� ����϶�.
            --���� ������ ���� annsal�� �־ ����϶�.
            
             if( vemp.comm is null ) then     
                         vemp.comm := 0;
            end if ;
            
            annsal := vemp.sal*12 + vemp.comm;
          
            dbms_output.put_line('��� : ' || vemp.empno ||' '|| '�̸� : ' ||vemp.ename ||' '||'���� : ' || annsal ||'����');     
end;
/
--==========================================================================================

--���� 1-2  if-then / else if ��  
declare
            --%ROWTYPE : ���̺��� ��� �÷��� �̸��� ������ �����ϰڴ�.
            --�÷����� ���������� ���ǰ� �÷��� Ÿ���� ������ Ÿ������ ����Ѵ�.
            vemp emp%rowtype;
            annsal number(7,2);

begin 
            dbms_output.put_line('��� / �̸� / ����');
            dbms_output.put_line('------------- ');
            
            select *
            into vemp 
            from emp
            where empno = 7788;
            
             if( vemp.comm is null ) then     
                        annsal := vemp.sal*12;
            else
                        annsal := vemp.sal * 12 + vemp.comm;
            end if ;
          
            dbms_output.put_line('��� : ' || vemp.empno ||' '|| '�̸� : ' ||vemp.ename ||' '||'���� : ' || annsal ||'����');     
end;
/
--���� if�� ===================================================================================

declare
            vemp emp %rowtype;
            vdname varchar2(10);
begin
            select *
            into vemp
            from emp
            where empno = 7788;
            
            if(vemp.deptno = 10) then
                    vdname := 'AAA';
            elsif (vemp.deptno = 20) then  --elsif =else if �� ����Ŭ Ư��
                    vdname := 'BBB';
            elsif (vemp.deptno = 30) then  
                    vdname := 'CCC';
            elsif (vemp.deptno = 40) then  
                    vdname := 'DDD';
            end if;
            
            dbms_output.put_line(vdname);        
end;
/
--==========================================================================================

--[���ǹ�]
--if then end if;
--if then else end if;
--if then elsif then end if;


--[�ݺ���]
--loop end loop;
--for in loop end loop;  --����
--for in reverse loop end loop; --����
--while loop end loop;

--==========================================================================================

--�ݺ���=====================================================================================
--loop (Ȱ�� �󵵰� ����)
--        ���๮( ���� �ݺ��� )
--        ���� �ݺ����� ����
--        1. EXIT WHEN ���ǽ�;
--        2. IF THEN END IF;
--end loop;

declare
            n number := 1;
begin
            loop 
                    dbms_output.put_line(n);
                    n := n +1;  --���� ���������ڴ� �������� �����Ƿ� ���� ������� �Ѵ�.
                    exit when n > 10;  --�ݺ����� ���߱� ���� ����
            end loop;
end;
/

--for (Ȱ�� �󵵰� ����)
declare
            --���� ���� ���� �ʿ� ����
begin
            --in ���� �ڿ� �ۼ��Ǵ� ���� �ݺ��� Ƚ���� �����Ѵ�.
            --in : ����
            for n in 1..10 loop  --in �ڿ��ִ� ���� ���۰�..���� 1�� ����  / 1~10���� 10ȸ �ݺ��ϴ� ��.
            dbms_output.put_line(n);
            end loop;
end;
/

declare
            --���� ���� ���� �ʿ� ����
begin
            --in ���� �ڿ� �ۼ��Ǵ� ���� �ݺ��� Ƚ���� �����Ѵ�.
            --in reverse : ����
            for n in reverse 1..10 loop  --in �ڿ��ִ� ���� ���۰�..���� 1�� ����  / 1~10���� 10ȸ �ݺ��ϴ� ��.
            dbms_output.put_line(n);
            end loop;
end;
/


declare
            vdept dept %rowtype;
begin
            for n in 1..4 loop
                    select *
                    into vdept
                    from dept
                    where deptno = 10 * n ;  --where���� ������ ������ �Ǵ��Ѵ�.
            dbms_output.put_line(vdept.deptno || '/ ' || vdept.dname || '/ ' || vdept.loc);
            
            end loop;
end;
/

--while (Ȱ�� ��)
--declare
--            n number := 1;
--begin
--            while (���ǽ�) loop
--            
--            end loop;
--end;
--/

declare
            n number := 1;
begin
            while (n <= 10) loop
            dbms_output.put_line(n);
            n := n + 1;
            end loop;
end;
/






