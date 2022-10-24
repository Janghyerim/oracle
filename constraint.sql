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

create or replace view emp_view30
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
























          
                                    
