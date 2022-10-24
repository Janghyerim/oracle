--제약조건(무결성) : 잘못된 값이 데이터로 사용되는 것을 못하게 하는 것
--not null
--unique
--primary key (기본키)
--foreign key (외래키/참조키)
-- 1.부모와 자식의 관계를 가지는 자식 쪽 테이블에 설정한다.
--2.부모 쪽 테이블의 컬럼은 반드시 primary key 또는 unique 해야한다.
--3. null 데이터를 허용한다.
--check
--default

--emp,dept활용
insert into emp
values(1111,'aaa','MANAGER',9999,sysdate,1000,NULL,50);
--오류 보고 -
--ORA-02291: 무결성 제약조건(SCOTT.FK_DEPTNO)이 위배되었습니다- 부모 키가 없습니다

drop table emp02;

create table emp02(     --제약조건은 한칸띄어서 중복으로 사용 가능하다.
                                    empno number(4) primary key, --not null + unique, --반드시 null이 아닌 데이터가 들어와야 한다. null이면 정보 가치가 없다.
                                    ename varchar2(10) not null,
                                    job varchar2(9),
                                    deptno number(2)
                                    );
delete from emp02;

select * from emp02;                            
                                    
insert into emp02
values(1111,'홍길동','MANAGER',30);   

insert into emp02
values(2222,'홍길동','MANAGER',30);   

insert into emp02
values(1111,'이순신','MANAGER',20);

insert into emp02
values(null,'김유신','SALESMAN',20);

insert into emp02
values(2222,'옥동자','SALESMAN',10);
                                    
insert into emp02
values(null,null,'MANAGER',30);

select * from emp02;


--제약조건 생성하기

drop table emp04;

create table emp04(     --제약조건은 한칸띄어서 중복으로 사용 가능하다.
                         --제약조건 수기생성가능 constraint+제약조건명
                                    empno number(4) constraint emp04_empno_pk primary key, --not null + unique, --반드시 null이 아닌 데이터가 들어와야 한다. null이면 정보 가치가 없다.
                                    ename varchar2(10) constraint emp04_ename_nn not null,
                                    job varchar2(9),
                                    deptno number(2)
                                    );
delete from emp04;

select * from emp04;                            
                                    
insert into emp04
values(1111,'홍길동','MANAGER',30);   

insert into emp04
values(2222,'홍길동','MANAGER',30);   

insert into emp04
values(1111,'이순신','MANAGER',20);

insert into emp04
values(null,'김유신','SALESMAN',20);

insert into emp04
values(2222,'옥동자','SALESMAN',10);
                                    
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
                                    
--서브쿼리문을 사용한 데이터 삽입

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

--제약조건 설정방식
--컬럼 레벨의 설정(not null은 컬럼 레벨에서만 가능)
--테이블 레벨의 설정(not null을 적용할 수 없다)
--1. 테이블 안에서 정의 하는 방식
--2. Alter 명령어를 사용 하는 방식


create table emp09(
                                    empno number(4),
                                    ename varchar2(20) constraint emp09_ename_nn not null,  --컬럼레벨
                                    job varchar2(20),
                                    deptno number(20),
                                    
                                    constraint emp09_empno_pk primary key(empno),  --테이블레벨
                                    constraint emp09_empno_uk unique (job),
                                    constraint emp09_deptno_fk foreign key(deptno) references dept(deptno)
                                    );

insert into emp09
values(3333,'HONG','PRESIDENT',80);

--복합키(기본키를 두개의 컬럼을 사용하는 경우)

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

--not null은 변경의 개념(null -> not null)
alter table emp10
modify job constraint emp10_job_nn not null;

alter table emp10
modify ename constraint emp10_ename_nn not null;

alter table emp10
drop constraint emp10_empno_pk;--제약조건명(constraint) 또는 제약조건(primary key)

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
disable primary key cascade; --비활성화 시키는 것

alter table dept11
drop primary key cascade;



--객체 : table, index, view
--create or replace view 뷰테이블명([alias])
--as
--서브쿼리(select)
--[with check option]
--[with read only]


drop table dept_copy;
drop table emp_copy;

create table dept_copy  --원본 테이블 만들기  / 복사되는 테이블은 제약조건이 안 넘어온다.
as
select * from dept;

create table emp_copy
as
select * from emp;

alter table emp_copy
add constraint emp_copy_deptno_fk foreign key(deptno) references dept(deptno);

select * from emp_copy; --14행

create or replace view emp_view30
as
select empno,ename,sal,deptno from emp_copy
where deptno = 30;

select * 
from emp_view30;

insert into emp_view30
values(1111,'hong',1000,30); 

insert into emp_view30(empno,ename,sal)
values(2222,'hong',1000);  --deptno가 null로 추출된다.

insert into emp_view30(empno,ename,sal,deptno)
values(2222,'hong',1000,50);  --deptno가 null이므로 추출이 안된다.

select * 
from emp_copy;


create or replace view emp_view(사원번호,사원명,급여,부서번호)
as
select empno,ename,sal,deptno
from emp_copy;

select * from emp_view;

select * 
from emp_view
where 부서번호 = 20;
--where deptno = 20;  --error : 별칭을 한번 주고나면 그 뒤로는 원래 컬럼명으로 사용 불가하다.

create or replace view emp_dept_view
as
select empno,ename,sal,e.deptno,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno
order by empno desc;

select *
from emp_dept_view;


--복합 뷰
--부서별 최소급여와 최대급여
--dname,min_sal,max_sal
create or replace view sal_view(dname,min_sal,max_sal)
as
select dname,min(sal) min_sal ,max(sal) max_sal
from emp e inner join dept d
on e.deptno = d.deptno
group by d.dname;

select *
from sal_view;
























          
                                    
