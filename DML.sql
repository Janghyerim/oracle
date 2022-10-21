--10강
--DML(데이터 조작어) : insert , update , delete
--insert : 테이블에 데이터 삽입
--insert into 테이블명(컬럼명1,컬럼명2,.....)
--values(값1,값2,.....)
--컬럼의 값이 타입과 갯수가 일치해야한다(1:1)
--작성 순서대로 1:1 매칭된다

create table dept_temp
as
select * from dept;

select * 
from dept_temp;

insert into dept_temp(deptno,dname,loc)
values(50,'DATABASE','SEOUL');

insert into dept_temp(deptno,dname) --묵시적 NULL 데이터 삽입
values(60,'JSP');

insert into dept_temp --컬럼생략
values(70,'HTML','SEOUL');

insert into dept_temp --컬럼생략, 명시적 NULL데이터 삽입
values(80,NULL,'SEOUL');


create table emp_temp
as
select * from emp
where 1 != 1;

select *
from emp_temp;

insert into emp_temp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
values (9999,'홍길동','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
values (3111,'심청이','MANAGER',9999,SYSDATE,4000,1000,10);

--update : 컬럼의 데이터를 변경(수정)
--update 테이블명
--set 컬럼명 = 값, 컬렴명 = 값,...
--where 조건식
--조건절을 사용하지 않으면 해당 컬럼이 모두 변경된다

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

--delete(데이터 삭제)
--delete from 테이블명
--where 조건식
--조건절을 사용하지 않으면 모든 데이터가 삭제된다

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

--TCL(데이터의 영구 저장 또는 취소)
--트랜잭션
--commit , rollback, savepoint
--commit : 데이터 영구 저장(테이블이 데이터 반영)
                    --create 구문을 사용해서 객체 생성할 때(자동)
--rollback : 데이터 변경 취소(테이블이 데이터 미반영) 원상복귀
                    --천재지변,전기,전쟁(자동)
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

--트랜잭션 적용 유무
drop table dept01;

create table dept01
as
select * from dept;

select * 
from dept01;

delete from dept01;

commit;
rollback;

truncate table dept01;  --commit이되는 명령어
rollback;

select * 
from dept01;


--DDL(데이터 정의어) : table(모든객체)를 생성,삭제,변경하는 명령어
--create(생성) , alter(변경) , drop(삭제)


--테이블 생성 create
create table 테이블명(   --table(객체)
        컬럼명1 타입,           --column(속성)
        컬럼명2 타입,
        컬럼명3 타입
);

drop table emp_ddl;

create table emp_ddl(  -- 사번,이름,직책,관리자,입사일,급일,성과급,부서번호
            empno number(4),
            ename varchar2(10), --byte크기
            job varchar2(9),
            mgr number(4),
            hiredate date, --날짜는 수기 데이터 지정하지 않고 타입만 지정하면 된다.
            sal number(7,2),
            comm number(7,2),
            deptno varchar2(2)
);

select *
from emp_ddl;

insert into emp_ddl
values(9999,'이순신','MANAGER',1111,sysdate,1000,null,10);



create table dept_ddl --테이블의 복사
as
select * from dept;

create table dept_30  --30번 데이터만 추출한다
as
select * from dept
where deptno = 30;

create table dept_m  --m 데이터만 추출한다
as
select dname,loc
from dept;

create table dept_d  --테이블의 구조만 복사한다
as
select * from dept
where 1 != 1;

--테이블 변경(컬럼의 정보 수정) alter
--새로운 컬럼추가, 컬럼의 이름변경, 자료형의 변경, 컬럼을 삭제
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

--테이블 삭제 drop
--drop table 테이블명

drop table emp_alter;

--데이터 사전 : DB를 위한 데이터를 저장

select * 
from emp_alter;

desc user_tables;

select table_name
from user_tables;  --테이블들 출력

select owner, table_name  --테이블 주인과 같이 출력
from all_tables;

--index(인덱스) : 검색 속도를 향상시키는 객체
--create(생성) , drop(삭제)
--select 구문의 검색 속도를 향상시킨다
--전체 레코드의 3% ~ 5% 정도일 때 
--index 객체를 컬럼에 생성해서 사용한다

create index 인덱스명
on 테이블명(컬럼명);
 
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

--index 객체 생성 전(0.030~0.040)
select empno,ename
from emp01
where ename = 'bts';

--index 객체 생성
create index idx_emp01_ename
on emp01(ename);

--index 객체 생성 후(0.001~0.002)
select empno,ename
from emp01
where ename = 'bts';

--index 삭제
drop index idx_emp01_ename;

--테이블 삭제 후 원복
show RECYCLEBIN; --버린 테이블 확인

flashback table EMP_HW
to before drop;   --테이블 원복 / Flashback을(를) 성공했습니다.

purge recyclebin;  --휴지통 비우기(용량관리) / Recyclebin이(가) 비워졌습니다.


