drop table emp09;

create table emp09(
                                empno number(4),
                                ename varchar2(20) constraint emp09_ename_nn not null, --�÷����� : not null�� ������ �÷������� ������Ѵ�.
                                job varchar2(20),
                                deptno number(20),
                                
                                constraint emp09_empno_pk primary key(empno),
                                constraint emp09_empno_uk unique(job),
                                constraint emp09_deptno_fk foreign key(deptno) references dept(deptno)
                                );

insert into emp09
values(3333,'jang','teacher',100);  --���Ἲ ��������(SCOTT.EMP09_DEPTNO_FK)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�
                                                         --dept���̺� �ִ� deptno �� 10,20,30,40�� ���� �ϴµ� �� �̻��� ���� �־�����Ƿ� ������ �Ұ��ϴ�
                                                         --���� �ش� ���ڸ� ���� �ؾ� ������ ����ȴ�.
                                                         
insert into emp09
values(2222,'jang','manager',20);    --���� ������ �����̴�.            


--��ü �� ��������

drop table dept_copy;
drop table emp_copy;

create table dept_copy
as
select * from dept;

create table emp_copy
as
select * from emp;

alter table emp_copy
add constraint emp_copy_deptno_fk foreign key(deptno) references dept(deptno);

select *  from emp_copy;





