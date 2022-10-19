-- : 주석
--DQL(질의어) : 데이터 조회 할 때 사용
--select 컬럼명
--from 테이블명

--전체 데이터 조회 할 때 사용
select empno,ename,job,mgr,hiredate,sal,comm,deptno 
from emp; 

select *
from emp;

--부분컬럼 데이터 조회 할 때
select empno,ename,sal
from emp;

select deptno
from emp;

select DISTINCT(deptno)  --똑같으면 한번만 출력되게끔 중복 제외 : DISTINCT
from emp;

select DISTINCT(job)
from emp;

-- +,-,*,/ 나머지 연산자는 없다.
-- 컬럼을 대상으로 연산한다. (테이블 대상 X)
-- null값은 연산이 불가하다.
-- 컬럼에 별칭을 사용할 수 있다.
select ename as 사원명,sal as 월급,sal*12+nvl(comm,0)as 연봉,comm as 성과급 --이름 월급 연봉 성과급
from emp;

--데이터정렬
--select 컬럼명
--from 테이블명
--order by 컬럼명(정렬기준이 되는 값) asc/desc
select *
from emp
order by hiredate desc;  
--asc(오름차순 : 생략 가능하다)/desc(내림차순)
--숫자(1~10),날짜(과거날짜~최근날짜),문자(사전순서)

--조건검색
--select 컬럼명
--from 테이블명
--where 조건식(컬럼명 = 값); <,>,=,!=,/,<>,<=,>=,and,or

select *
from emp
order by sal asc;  --오름차순 정렬

select *
from emp
where sal>=3000;  --급여가 3000이상인 사원

select *
from emp
where deptno=30; --30번 부서에서만 일하는 사람


--and연산자 두가지 이상의 조건이 모두 참인 경우
select *
from emp
where deptno=30 and job='SALESMAN'and empno=7499;

--문자를 조건절에 사용할때
--대소문자 유의 
-- ' '
select *
from emp
where ename = 'FORD'; --소문자 ford는 없다.

--날짜를 조건절에 사용할 때
--직접 값을 줄때는 ' '를 사용해야 한다.
--날짜도 크기가 있다.
--80/12/20 -> 1980/12/20 시간 분 초 요일
select *
from emp
where hiredate < '1982/01/01';

--or 두개 이상의 조건중에 하나 이상 참인 경우
select *
from emp
where deptno = 10 or sal >= 2000;

--not 논리부정 연산(현재조건 부정할 때 사용)
select *
from emp
where sal != 3000;

select *
from emp
where not sal = 3000;

--and , or 연산자
--범위 조건을 표현할 때 사용
select *
from emp
where sal >= 1000 and sal <= 3000;

select *
from emp
where sal <= 1000 or sal >=3000;

--between and 연산자
select *
from emp
where sal between 1000 and 3000; --범위조건1과 같은 값이다.

--in 연산자
select *
from emp
where sal = 800 or sal = 3000 or sal = 5000;

select *
from emp
where sal in(800,3000,5000);

--like연산자
--값의 일부만 가지고 데이터를 조회한다.
--와일드카드를 사용한다.(%,_)
-- % 모든 문자를 대체한다.
-- _ 한 문자를 대체한다.
select *
from emp
where ename like 'F%';

select *
from emp
where ename like '%D';

select *
from emp
where ename like '%O%';

select * 
from emp
where ename like '___D'; -- _사용

select *
from emp
where ename like 'S___%'; -- _%같이 사용ver.

--null연산자
--is null / is not null
--null데이터는 비교 불가하다.
select *
from emp
where comm is null;

select *
from emp
where comm is not null;

--=================================
--집합연산자
--두개의 select구문을 사용한다.
--컬럼의 갯수가 동일해야한다.
--컬럼의 타입이 동일해야한다.
--컬럼의 이름은 상관없다.
--합집합(UNION 두개의 결과를 합쳐서 조회),교집합(INTERSECT),차집합(MINUS)
select empno,ename,sal,deptno
from emp
where deptno = 10
UNION --합집합
select empno,ename,sal,deptno
from emp
where deptno = 20;

select empno,ename,sal,deptno
from emp
where deptno = 10
UNION ALL --합집합
select empno,ename,sal,deptno
from emp
where deptno = 10;  --결과값이 중복되면 한번만 조회된다. ALL을 붙이면 중복도 다 조회된다.

select empno,ename,sal,deptno
from emp
MINUS --차집합
select empno,ename,sal,deptno
from emp
where deptno = 10;

select empno,ename,sal,deptno
from emp
INTERSECT --교집합
select empno,ename,sal,deptno
from emp
where deptno = 10;

--where
--비교연산자, 논리연산자, like, is null/is not null, 집합연산자
--비교 : <,>,<=,>=,=,!=
--비교 : and,or,not,between and,in
--like( %,_)
--논리 : is null,is not null
--집합 : UNION,MINUS,INTERSECT


--함수
--문자함수 : upper,lower,initcap,substr,instr,replace,lpad,rpad,concat
--숫자함수
--날짜함수

--문자함수
--upper,lower,initcap함수 : 대소문자를 바꿔주는 것 
select 'Welcome',upper('Welcome') --upper : 데이터를 모두 대문자로 변환
from dual;

select lower(ename),upper(ename) --lower : 데이터를 모두 소문자로 변환
from emp;

select initcap(ename)
from emp;

select * 
from emp
where ename = 'FORD';

--**********중요*******
select * 
from emp
where lower(ename) = 'scott';

--,length 함수 : 문자열 길이를 구하는 것
select ename,length(ename)
from emp;

--substr 함수 : 문자열 일부를 추출하는 것
--시작위치,갯수
select 'Welcome to Oracle',substr('Welcome to Oracle',2,3),substr('Welcome to Oracle',10)
from dual;  --Wel 추출

-- 1        17
--17        1
select 'Welcome to Oracle',substr('Welcome to Oracle',-3,3),substr('Welcome to Oracle',-17)
from dual;

--instr 함수 : 특정문자 위치찾기
select instr('Welcome to Oracle','o')
from dual; --5

select instr('Welcome to Oracle','o',6)
from dual; --10

select instr('Welcome to Oracle','e',3,2)
from dual; --17

--replace함수 : 특정문자 다른문자로 변환
select 'Welcome to Oracle',replace('Welcome to Oracle','to','of')
from dual; -- to -> of 변환

--lpad,rpad함수 : 빈공간 메꾸기
select 'Oracle',lpad('oracle',10,'#'),rpad('oracle',10,'*'),lpad('oracle',10)
from dual;

select rpad('990103-',14,'*')
from dual; --990103-*******

--concat함수 : 두 문자열 데이터를 합치는 것
select concat(empno,ename), empno||''||ename
from emp;

--trim,ltrim,rtrim함수 : 특정문자를 지우는 것

--============================================
--숫자 함수
--round함수 : 특정위치에서 반올림  (소수부분 많이 사용)
select 
           round(1234.5678),
           round(1234.5678,0),
           round(1234.5678,1),
           round(1234.5678,2),
           round(1234.5678,-1)  --1230 4에서 반올림이니까 0
from dual;

--trunk함수 : 특정위치에서 버림
select
           trunc(1234.5678),
           trunc(1234.5678,0),
           trunc(1234.5678,1),
           trunc(1234.5678,2),
           trunc(1234.5678,-1) --4가 버려지는 것임.
from dual; 

--ceil,floor함수 : 지정한 숫자와 가까운 정수를 찾음
select
           ceil(3.14),  --자신보다 큰 가장 가까운 정수 4
           floor(3.14), --자신보다 작은 가장 가까운 정수 3
           ceil(-3.14), -- -3
           floor(-3.14) -- -4
from dual;

--mod함수 : 숫자를 나눈 나머지 값 구하기
select
          mod(15,6),  --3
          mod(10,2),  --0
          mod(11,2)   --1
from dual;

--mod함수 활용 )홀수인 사번 조회
select *
from emp
where mod(empno,2) = 1;

--============================================
--날짜 함수
--sysdate함수 : 현재 날짜 출력
select sysdate
from dual;

select sysdate-1 어제, sysdate 오늘,sysdate+1 내일
from dual;

select sysdate - hiredate  as 근무일수 --차이가 일수 반환 며칠 근무 했는지 계산
from emp;

--add_months함수 : 몇개월 이후 날짜를 구하는 역할









--round 함수 예제
select sysdate,
            round(sysdate,'cc')as FORMAT_CC,
            round(sysdate,'yyyy')as FORMAT_YYYY,
            round(sysdate,'q')as FORMAT_Q,
            round(sysdate,'ddd')as FORMAT_DDD,
            round(syadate,'hh')as FORMAT_HH
from dual;            

--trunc 함수 예제
select sysdate,
            trunc(sysdate,'cc')as FORMAT_CC,
            trunc(sysdate,'yyyy')as FORMAT_YYYY,
            trunc(sysdate,'q')as FORMAT_Q,
            trunc(sysdate,'ddd')as FORMAT_DDD,
            trunc(sysdate,'hh')as FORMAT_HH
from dual;    

--자료형 변환 함수
--to_char()
--to_number()
--to_date()

--to_char() : 날짜를 문자
select sysdate , to_char(sysdate,'YYYY-MM-DD  HH24 : MI : SS')as 현재시간
from dual;

select hiredate,to_char(hiredate,'YYYY-MM-DD  HH24 : MI : SS DAY')as 입사일자
from emp;

--to_char() : 숫자를 문자
select to_char(123456,'L999,999')
from dual;

select sal,
            to_char(sal,'$999,999')as sal_$,
            to_char(sal,'L999,999')as sal_L,
            to_char(sal,'999,999,00')as sal_1,
            to_char(sal,'000,999,999.00')as sal_2,
            to_char(sal,'000999,999.99')as sal_3,
            to_char(sal,'999,999,00')as sal_4
from emp;

--to_number() : 문자를 숫자
select '20000'-'5000'  --자동 형변환
from dual;

select '20,000'-'5,000'  --to_number()형변환을 해야함. 사유 : 콤마가 들어가면 오류가 난다.
from dual;

select to_number( '20,000' , '999,999') -to_number('5,000' , '999,999')
from dual;

--to_date() : 문자를 날짜
select to_date('20221019','YYYY/MM/DD')
from dual;

select  * 
from emp
where hiredate < to_date('19820101' , 'YYYY-MM-DD');

--null데이터 처리
--nvl(null,바꾸고 싶은 데이터)
--nvl은 null데이터의 타입과 같은 타입을 변경해야한다.
--nvl(숫자,숫자) , nvl(문자,문자)
select ename 사원명,sal, sal*12+nvl(comm,0) as 연봉,comm
from emp;

--예시) mgr의 null  ->  ceo
select ename,job,mgr
from emp
where mgr is null;

select ename,job,nvl(to_char(mgr,'9999'),'CEO')as mgr
from emp
where mgr is null ;

select comm, nvl2(comm,'O','X')
from emp;

--조건문 표현하는 함수
--decode() -> switch
--case  -> if

--decode()
select ename,job,deptno,
            decode(deptno,10,'AAA',20,'BBB',30,'CCC','기타')as 부서명
from emp;

--case : 범위를 조건으로 설정할 수 있다.
case
            when 조건식 then 실행문
            when 조건식 then 실행문
            when 조건식 then 실행문
            else 실행문
end as 별칭

select ename,job,deptno,
case
            when deptno =10 then 'AAA'
            when deptno =20 then 'BBB'
            when deptno =30 then 'CCC'
            else '기타'
end as 부서명
from emp;

select ename,job,sal,
case 
         when sal between 3000 and 5000 then '임원'
         when sal >= 2000 and sal < 3000 then '관리자'
         when sal >= 500 and sal < 2000 then '사원'
         else '기타'
end as 직무
from emp;

show user;






