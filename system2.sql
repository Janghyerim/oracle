--사용자 관리 
--create , drop
--create user 계정명 identified by 패스워드   //사용자 계정 만드는방법

create user user01 identified by 1234;  --테이블 생성 1

--DCL(제어어)
--grant(권한부여), revoke(권한회수)
grant CREATE SESSION
to user01;

alter user user01 identified by tiger;  --테이블 변경 2

drop user user01 CASCADE;   --테이블 삭제 3

--============================================================================

--user01테이블 권한주기
grant create table    --사용자 계정에서 user01 테이블 권한 주는 것
to user01;

revoke create table  --권환 회수
from user01;


--user01테이블 용량 할당 주기
alter user user01
quota 2m on users;