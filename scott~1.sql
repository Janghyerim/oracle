drop table emp09;

create table emp09(
                                empno number(4),
                                ename varchar2(20) constraint emp09_ename_nn not null, --컬럼레벨 : not null은 무조건 컬럼레벨에 써줘야한다.
                                job varchar2(20),
                                deptno number(20),
                                
                                constraint emp09_empno_pk primary key(empno),
                                constraint emp09_empno_uk unique(job),
                                constraint emp09_deptno_fk foreign key(deptno) references dept(deptno)
                                );

insert into emp09
values(3333,'jang','teacher',100);  --무결성 제약조건(SCOTT.EMP09_DEPTNO_FK)이 위배되었습니다- 부모 키가 없습니다
                                                         --dept테이블에 있는 deptno 는 10,20,30,40만 존재 하는데 그 이상의 수를 넣어버리므로 삽입이 불가하다
                                                         --따라서 해당 숫자를 삽입 해야 조건이 성사된다.
                                                         
insert into emp09
values(2222,'jang','manager',20);    --삽입 가능한 문장이다.            


--객체 및 서브쿼리

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





