--user01 테이블에 scott - emp 객체 권한주기

--grant 객체권한 종류
--on 객체명
--to 계정명

grant select  --다른 테이블에 객체 권한 부여
on emp
to user01;

revoke select  --다른 테이블에 객체 권한 회수
on emp
from user01;

--==================================================

--user04 테이블에 scott - emp 객체 권한주기

grant select
on emp
to user04;

revoke select  --다른 테이블에 객체 권한 회수
on emp
from user04;

--=====================================================
grant select
on emp
to mrole3;

