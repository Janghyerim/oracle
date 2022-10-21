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


