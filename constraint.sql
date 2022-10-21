--��������(���Ἲ) : �߸��� ���� �����ͷ� ���Ǵ� ���� ���ϰ� �ϴ� ��
--not null
--unique
--primary key
--foreign key
--check

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
create table emp02(     --���������� ��ĭ�� �ߺ����� ��� �����ϴ�.
                         --�������� ����������� constraint+�������Ǹ�
                                    empno number(4) constraint emp04_empno_pk primary key, --not null + unique, --�ݵ�� null�� �ƴ� �����Ͱ� ���;� �Ѵ�. null�̸� ���� ��ġ�� ����.
                                    ename varchar2(10) constraint emp04_ename_nn not null,
                                    job varchar2(9),
                                    deptno number(2)
                                    );
                                    
                                    