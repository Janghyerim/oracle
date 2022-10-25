create table test
(
    id varchar2(10)
);                               --권한이 불충분 합니다.

select * from test;

insert into test
values('aaa');  --테이블스페이스 'USERS'에 대한 권한이 없습니다.  : 용량 할당을 따로 하지 않았기 때문에
                            --시스템 계정에서 용량 할당 후 'aaa'출력됨.
                            

                            
