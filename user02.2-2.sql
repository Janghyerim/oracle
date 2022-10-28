CREATE TABLE "dept" (
	"deptno"	number(2)		NOT NULL,
	"dname"	varchar2(14)		NULL,
	"loc"	varchar2(13)		NULL
);

drop table "dept";


CREATE TABLE "dept" (
	"deptno"	number(2)		NOT NULL,
	"dname"	varchar2(14)		NULL,
	"loc"	varchar2(13)		NULL
);


drop table "emp";

CREATE TABLE "emp" (
	"empno"	number(4)		NOT NULL,
	"ename"	varchar2(10)		NULL,
	"job"	varchar2(9)		NULL,
	"mgr"	number(4,0)		NULL,
	"hiredate"	date		NULL,
	"sal"	number(7,2)		NULL,
	"comm"	number(7,2)		NULL,
	"deptno"	number(2)		NOT NULL
);


ALTER TABLE "dept" ADD CONSTRAINT "PK_DEPT" PRIMARY KEY (
	"deptno"
);

ALTER TABLE "emp" ADD CONSTRAINT "PK_EMP" PRIMARY KEY (
	"empno"
);

ALTER TABLE "emp" ADD CONSTRAINT "FK_dept_TO_emp_1" FOREIGN KEY (
	"deptno"
)
REFERENCES "dept" (
	"deptno"
);


drop table "members";
drop table "reserve";
drop table "rent";
drop table "books";

CREATE TABLE "members" (
	"user_id"	varchar2(15)		NOT NULL,
	"user_name"	varchar2(10)		NULL
);


CREATE TABLE "reserve" (
	"reserve_no"	number(15)		NOT NULL,
	"reserve_date"	date		NULL,
	"book_no"	number(6)		NOT NULL,
	"user_id"	varchar2(15)		NOT NULL
);


CREATE TABLE "rent" (
	"rent_no"	number(15)		NOT NULL,
	"rent_qty"	number(2)		NULL,
	"rent_date"	date		NULL,
	"return_date"	date		NULL,
	"renewal_hit"	number(1)		NULL,
	"book_no"	number(6)		NOT NULL,
	"user_id2"	varchar2(15)		NOT NULL
);


CREATE TABLE "books" (
	"book_no"	number(6)		NOT NULL,
	"book_name"	varchar2(20)		NULL,
	"writer"	varchar2(10)		NULL,
	"publisher"	varchar2(10)		NULL,
	"publisher_year"	varchar2(14)		NULL,
	"isbn"	varchar2(10)		NULL,
	"stock_qty"	number(5)		NULL
);

ALTER TABLE "members" ADD CONSTRAINT "PK_MEMBERS" PRIMARY KEY (
	"user_id"
);

ALTER TABLE "reserve" ADD CONSTRAINT "PK_RESERVE" PRIMARY KEY (
	"reserve_no"
);

ALTER TABLE "rent" ADD CONSTRAINT "PK_RENT" PRIMARY KEY (
	"rent_no"
);

ALTER TABLE "books" ADD CONSTRAINT "PK_BOOKS" PRIMARY KEY (
	"book_no"
);

ALTER TABLE "reserve" ADD CONSTRAINT "FK_books_TO_reserve_1" FOREIGN KEY (
	"book_no"
)
REFERENCES "books" (
	"book_no"
);

ALTER TABLE "reserve" ADD CONSTRAINT "FK_members_TO_reserve_1" FOREIGN KEY (
	"user_id"
)
REFERENCES "members" (
	"user_id"
);

ALTER TABLE "rent" ADD CONSTRAINT "FK_books_TO_rent_1" FOREIGN KEY (
	"book_no"
)
REFERENCES "books" (
	"book_no"
);

ALTER TABLE "rent" ADD CONSTRAINT "FK_members_TO_rent_1" FOREIGN KEY (
	"user_id2"
)
REFERENCES "members" (
	"user_id"
);
insert into "members"
values('m1000','hong');

insert into "books"
values('1000','The love','tong','hyerimJ','80/12/20','ISBN100',1);

insert into "rent"
values('1000','10',sysdate,sysdate+3,1,6543,'hong');


select * from "books";
select * from "members";
select * from "rent";


--회원아이디,회원명,도서명,대여권수,대출일자,반납일자 출력하기











