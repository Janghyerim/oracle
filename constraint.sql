--제약조건(무결성) : 잘못된 값이 데이터로 사용되는 것을 못하게 하는 것
--not null
--unique
--primary key
--foreign key
--check

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
create table emp02(     --제약조건은 한칸띄어서 중복으로 사용 가능하다.
                         --제약조건 수기생성가능 constraint+제약조건명
                                    empno number(4) constraint emp04_empno_pk primary key, --not null + unique, --반드시 null이 아닌 데이터가 들어와야 한다. null이면 정보 가치가 없다.
                                    ename varchar2(10) constraint emp04_ename_nn not null,
                                    job varchar2(9),
                                    deptno number(2)
                                    );
                                    
                                    