drop user user03 cascade;

create user user03 identified by 1234;  --system과 같은 관리자 계정이기 때문에 계정 생성을 할 수 있다.

--사용자 정의 롤
--관리자 계정에서만 가능
--create role 롤명
--grant 권한 to 롤명
--시스템권한(create .....) 관리자가 부여
--객체 권한   (select ......) 소유주가 부여

--시스템권한(관리자계정에서)
--create role mrole;

drop role mrole;
drop user user04;

create role mrole;                 --내가 만든 롤 (권한을 묶어놓은 그룹)

grant create session , create table , create view  --시스템 권한
to mrole;

create user user04 identified by 1234;    --내가 만든 롤을 user04에 부여

grant mrole,create session
to user04;

alter user user04
quota 2m on users; 

--============================================================
--관리자 권한에서 롤 생성
create role mrole2;

--객체권한은 해당 사용자 계정에서 가능
--scott 접속 emp를 보기위해 scott으로 접속한 것
grant select 
on emp
user mrole2;

--롤 권한은 관리자 계정에서만 가능
grant mrole2
to user04;

--===============================================================
create role mrole3;

grant role mrole3
to user01;

revoke role mrole3
from user01;

--===============================================================
set role all;

create user user05 identified by 1234;

grant connect,resource
to user05;

create role mrole3;

grant mrole3
to user05;

revoke mrole3
from user05;






