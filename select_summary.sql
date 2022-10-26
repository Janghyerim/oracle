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
--case
--            when 조건식 then 실행문
--            when 조건식 then 실행문
--            when 조건식 then 실행문
--            else 실행문
--end as 별칭

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


-- case-when 예시

--출생연도 출력
select date_of_birth,to_char(date_of_birth,'YYYY/MM/DD') as 출생연도
from customers;
--나이출력
select date_of_birth,to_char(date_of_birth,'YYYY/MM/DD') as 출생연도,
round((sysdate - date_of_birth) / 365) || '살' as 나이
from customers;
 
select date_of_birth,to_char(date_of_birth, 'yyyy-mm-dd'),
       round((sysdate - date_of_birth) / 365) || '살' as 나이,
       case 
       when round((sysdate - date_of_birth) / 365) between 10 and 19 then '10대'
       when round((sysdate - date_of_birth) / 365) between 20 and 29 then '20대'
       when round((sysdate - date_of_birth) / 365) between 20 and 29 then '30대'
       when round((sysdate - date_of_birth) / 365) between 30 and 39 then '40대'
       when round((sysdate - date_of_birth) / 365) between 40 and 49 then '50대'
       when round((sysdate - date_of_birth) / 365) between 50 and 59 then '60대'
       when round((sysdate - date_of_birth) / 365) between 60 and 69 then '70대'
       else '기타'
       end as 연령대
       from customers;
       
select  round((sysdate - date_of_birth) / 365),
       case 
       when round((sysdate - date_of_birth) / 365) >= 10 and round((sysdate -date_of_birth) / 365) < 20 then '10대'
       when round((sysdate - date_of_birth) / 365) between 20 and 29 then '20대'
       when round((sysdate - date_of_birth) / 365) between 30 and 39 then '30대'
       when round((sysdate - date_of_birth) / 365) between 40 and 49 then '40대'
       when round((sysdate - date_of_birth) / 365) between 50 and 59 then '50대'
       when round((sysdate - date_of_birth) / 365) between 60 and 69 then '60대'
       when round((sysdate - date_of_birth) / 365) between 70 and 79 then '70대'
       else '기타'
    end as 연령대 
from customers;
 
show user;  --현재 유저를 출력해주는 명령어

--7강


--다중행 함수와 데이터 그룹화
--sum(),avg(),count(),max(),min()
--일반 컬럼과 같이 사용 불가 : 값의 갯수가 달라서 오류가 난다.
--컬럼의 갯수는 동일해야 한다.
--크기비교가 가능 모두 타입에 사용 가능


--sum 함수 :모든데이터를 숫자로 조회 해주는역할
select sum(sal)  
from emp;

 --평균sal구하기
select avg(sal)
from emp;

--count 함수 : 데이터 개수를 구해주는 역할
select count(*),count(comm)  --null제외한 갯수 구하는 역할
from emp;

--max함수 : 최댓값 구하는 역할
--min함수 : 최솟값 구하는 역할
select max(sal),min(sal)
from emp;

select ename,max(sal)  --불가능
from emp;

select ename  --가능
from emp;

select max(sal)  --가능
from emp;

--입사일 가장 빠른사람,늦은사람 출력
select min(hiredate),max(hiredate)
from emp
where deptno = 20;


--group by 결과값을 원하는 열로 묶어서 출력

--select 컬럼명
--from 테이블명
--where 조건식(그룹함수 사용불가 / group by,having 보다 먼저실행)
--group by 기준 컬럼명
--having 조건식(그룹함수 사용한다)
--order by 컬럼명 정렬방식 -> 맨마지막에 작성

--수기출력
select avg(sal) from emp where deptno = 10
UNION
select avg(sal) from emp where deptno = 20
UNION
select avg(sal) from emp where deptno = 30;

--자동 출력
select deptno,avg(sal)
from emp
group by deptno;

select deptno,avg(sal)
from emp
group by deptno
order by deptno;  --순서대로 정렬 하는 역할

--+각 부서별로 직군종류와 평균연봉 구하기
select deptno,job , avg(sal)
from emp
group by deptno,job
order by deptno,job desc;

--having : group by절에 조건을 줄 때 사용
--조건식을 작성할 때 그룹함수를 사용한다.
select deptno,job,avg(sal)
from emp
group by deptno,job
having avg(sal) > 2000  --group by에 조건을 줄 때
order by deptno,job;

select deptno,job,avg(sal)
from emp
group by deptno,job
having avg(sal) >=2000
order by deptno, job;

select deptno,job,avg(sal)
from emp
where deptno != 10
group by deptno,job
having avg(sal) >=2000
order by deptno, job;

--========================================
-- where mod(empno,2) = 1;
-->>>>>>> 1fa4dde7c683476d8b39d02b701f00b45d3b3a9a

-- sql developer




--조인(join) 
--두개 이상의 테이블을 연결하여 하나의 테이블처럼 출력하는 방식
--from절에 두개 이상의 테이블을 작성한다.
--where절에 조인 조건을 무조건 작성해야 한다.
--cross join  잘안씀(where절 없이 조인)
--equi join 제일 많이 사용(where 등가연산자 : =)
--non equi join(where 범위연산자 : and,or)
--self join(where 하나의 테이블을 사용한다)
--out join(where에 누락되는 데이터를 같이 조회하기 위해 : (+))
--select문에서 이름이 같으면 테이블을 지정하여 써줘야 오류가 없다.

--equi join 
select emp.ename,emp.job,emp.deptno,dept.dname,dept.loc
from emp,dept
where emp.deptno = dept.deptno;

select ename,job,emp.deptno,dname,loc
from emp,dept
where emp.deptno = dept.deptno;

--non equi join
select ename,job,e.deptno,dname,loc
from emp e,dept d --테이블 별칭 주는 방법
where e.deptno = d.deptno
and sal >= 3000;

select ename,sal,grade
from emp e,salgrade s
where e.sal between s.losal and s.hisal;
--where e.sal >= s.losal and e.sal <= s.hisal;

--사번,이름,급여,부서번호,부서명,급여등급
--emp                   dept                       salgrade
select empno,ename,sal,d.deptno,dname,grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal;

select  e.empno,e.ename,e.mgr,m.ename
from emp e,emp m  --반드시 별칭부여
where e.mgr = m.empno;

select ename,deptno
from emp
where deptno = 20;

--self join
--scott과 같은 부서에 근무하는 사원
--ename         ename
--scott             smith
--scott             jones
--scott             adams
--scott             ford
select work.ename, friend.ename
from emp work, emp friend
where work.deptno  =  friend.deptno
and work.ename = 'SCOTT'
and friend.ename != 'SCOTT';

--out join(외부조인) : 등가시 누락되는 데이터를 같이 조회하기위해 사용한다
select e.empno,e.ename,e.mgr,m.ename
from emp e, emp m
where e.mgr = m.empno(+); --데이터가 없는 테이블쪽에 (+)를 붙인다

select ename,sal,d.deptno,d.dname
from emp e, dept d
where e.deptno(+) = d.deptno;

--ANSI-join(표준조인 방식)
--cross join
--inner join(equi, non equi, self join)  --주 사용
--outer join( (+) ) // [left , right , full] outer join --주 사용
--natural join

select ename,sal,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno; 

select ename,sal,dname,loc
from emp e inner join dept d
using(deptno)  --양쪽테이블의 컬럼명이 동일한 경우에만 가능하다
where ename = 'SCOTT';

select e.empno,e.ename,e.mgr,m.ename
from emp e inner join emp m
on e.mgr = m.empno;

select empno,ename,sal,grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

select e.empno,e.ename,e.mgr,m.ename
from emp e left outer join emp m --데이터가 있는 쪽을 지정한다.[left , right , full]
on e.mgr = m.empno;  --king(null) 출력

select empno,ename,sal,d.deptno,dname,grade
from emp e inner join dept d
on e.deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and s.hisal;

select ename,sal,d.deptno,dname
from emp e right outer join dept d
on  e.deptno = d.deptno;

select ename,sal,d.deptno,dname
from emp e full outer join dept d
on e.deptno = d.deptno;

--서브쿼리
--필요한 데이터를 추가로 조회하기위해 쿼리문안에 쿼리를 짜는 것
--where절에 select문을 중첩해서 사용한다

--가장많은 월급을 받는 직원구하기
select ename,max(sal)
from emp;

--서브쿼리활용 답
select ename,sal
from emp
where sal = (
                        select max(sal)
                        from emp
                        );

--스콧의 부서이름 구하기
select deptno
from emp
where  ename = 'SCOTT';

select dname
from dept
where deptno = 20;

--서브쿼리활용 답
select dname
from dept
where deptno = (
                                select deptno
                                from emp
                                where ename = 'SCOTT'
                              );

--달라스에 근무하는 사원들의 이름, 부서 번호 구하기
select ename,deptno
from emp
where deptno = (
                                select deptno
                                from dept
                                where loc = 'DALLAS'
                                );

--자신의 직속상관인 king인 사원의 이름과 급여를 조회하세요(서브쿼리)
select ename,sal
from emp
where mgr = (
                        select empno
                        from emp
                        where ename = 'KING'
                        );
--단일행 서브쿼리

--다중행 서브쿼리
-- in : 결과중에 하나만 만족하면 된다.
-- >any : 결과중에 가장 작은값 보다 크면 된다.
-- >all : 결과중에 가장 큰 값 보다 크면 된다.


--in 연산자
--부서 번호 별 가장높은 급여받는 직원추출
select *
from emp
where sal in(5000,3000,2850);

select *
from emp
where sal in(
                        select max(sal)  --다중행 서브쿼리
                        from emp
                        group by deptno
                        );


--부서번호 별로 최대 급여를 받는 사원 정보 추출
select *
from emp
where (deptno,sal) in(
                                        select deptno,max(sal)
                                        from emp
                                        group by deptno
                                        );


--(=)any 연산자
select *
from emp
where sal > any(      --등가비교 연산자가 꼭 있어야 실행이 된다. ex) =,<,>,<=,>= ...
                        select max(sal)  --다중행 서브쿼리
                        from emp
                        group by deptno
                        );
                        
--30번 부서사원들의 최대급여보다 적은 급여를 받는 사원 정보 추출
select *
from emp
where sal<any(
                            select sal
                            from emp
                            where deptno = 30
                            )
order by sal,empno;                            
                        
                        
--some 연산자
select *
from emp
where sal > some(      --등가비교 연산자가 꼭 있어야 실행이 된다. ex) =
                        select max(sal)  --다중행 서브쿼리
                        from emp
                        group by deptno
                        );
                  
                          
--all 연산자
--30번 부서사원들의 최대 급여보다 큰 급여를 받는 직원들 추출
select ename,sal,deptno
from emp
where sal > all(
                            select sal
                            from emp
                            where deptno = 30
                            );

select *
from emp
where (deptno,sal) in(
                                        select deptno,max(sal)
                                        from emp
                                        group by deptno
                                        );

--p 266 scott연결


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

 -----------p360
 
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

create or replace view emp_view30  --뷰에 셀렉된 컬럼만 조회가 가능하다, 카피는 전부 조회
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

drop view sal_view;

--모든 객체의 이름은 중복될 수 없다.
create or replace view sal_view
as
select dname,min(sal) min_sal ,max(sal) max_sal,round(avg(sal),0) as avg_sal
from emp e inner join dept d
on e.deptno = d.deptno
group by d.dname;


--with check option
create or replace view view_chk30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with check option; --option 의 역할 : 조건절의 컬럼을 수정하지 못하게 한다 

update view_chk30  --뷰의 WITH CHECK OPTION의 조건에 위배 됩니다
set  deptno = 10;


--with read only
create or replace view view_read30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with read only;   --모든 컬럼에 대한 C U D 가 불가능(조회만 가능하다)

update view_read30  --읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다. (insert,update,delete)
set  deptno = 10;

--뷰의 활용
--TOP - N 조회하기
--ROWNUM 낮은 순부터 조회
select * from emp;

--입사일이 가장 빠른 5명의 사원조회
select * from emp
order by hiredate asc;

select * from emp
where hiredate <= '81/05/01' ;   

DESC emp;

--뷰의 활용 예시 1)                       
select rownum,empno,ename,hiredate
from emp
where rownum <= 5;

select rownum,empno,ename,hiredate
from emp
order by hiredate asc;  --rownum이 순서대로 정렬되지 않는다.

--뷰의 활용 예시 2)
create or replace view view_hiredate
as
select empno,ename,hiredate
from emp
order by hiredate asc;

select rownum,empno,ename,hiredate 
from view_hiredate
where rownum <= 7;

--2)의 rownum 2~4만 출력하기
select rownum,empno,ename,hiredate
from view_hiredate  --rownum도 순서정렬되고 입사일도 순서정렬된다.
where rownum between 2 and 5;  --출력 실패 : rownum을 조건절에 직접 사용시 반드시 1을 포함하는 조건식을 만들어야 한다.

create or replace view view_hiredate_rm  --rownum은 일회용으로 쓰여지기때문에 고정값으로 사용하기위해서는 생성해야함
as
select rownum rm ,empno,ename,hiredate  --rownum rm 별칭을 만들어 다시 테이블 생성한다
from view_hiredate;

select rm,empno,ename,hiredate
from view_hiredate_rm;

select rm,empno,ename,hiredate
from view_hiredate_rm
where rm >= 2 and rm <= 4;

--인라인 뷰 활용 예시
select rm, b.*
from  ( 
            select rownum rm, a.*
            from (
                       select empno,ename,hiredate
                       from emp
                       order by hiredate asc
                       )a
           )b           
where rm >= 2 and rm <= 4;


--인라인 뷰로 입사일이 가장빠른 사원5명 추출하기
 select rownum,empno,ename,hiredate
            from( 
                       select empno,ename,hiredate
                       from emp
                       order by hiredate asc
                     )a
where rownum <= 5 ;                                   

--시퀀스(sequence)
--자동으로 번호를 증가시키는 기능 수행
--create , drop
--nextval , currval

--create sequence 시퀀스명
--start with 시작값 => 1(기본값)
--increment by 증가치 =>1
--maxvalue 최댓값 => 10의 1027
--minvalue 최솟값  => 10의 -1027

drop sequence dept_deptno_seq;

create sequence dept_deptno_seq
increment by 10
start with 10;

select dept_deptno_seq.nextval--데이터 증가 용도
from dual;

select dept_deptno_seq.currval --현재 데이터 확인 용도 =>거의 쓸 일 없음
from dual;

--=========================
drop sequence emp_seq;

create sequence emp_seq
increment by 1
start with 1
maxvalue 1000;

drop table emp01;

create table emp01
as
select empno,ename,hiredate from emp
where 1 != 1;

select * from emp01;

insert into emp01
values(emp_seq.nextval,'hong',sysdate);  --empno = 2가 출력되는데 이는 오라클 버그이고 해결책은 따로 없다.
--반복하여 출력하면 empno만 자동 증가된다.



drop table  product;

create table product(
                                        pid varchar2(10),
                                        pname varchar2(10),
                                        price number(5),
                                        
                                        constraint product_pid_pk primary key(pid)
                                     );
create sequence idx_product_id
start with 1000;

insert into product
values('pid'|| idx_product_id.nextval,'치즈',1000); -- || 연결해주는 연산자

select * from product;

drop sequence idx_product_id;

--p392 end

--PL/SQL기초 p419
--PL/SQL(확장되어진 SQL언어)
--변수,조건문,반복문 을 추가로 사용해서 SQL을 유연하고 풍성하게 사용할 수 있음.

--기본적인 PL/SQL 구문
-- declare 
--     변수를 정의
-- begin -> 필수구문!!
--     SQL구문 작성
--     출력구문 작성  --> 쿼리문의 수행결과를 반드시 출력함수를 통해서 확인해야 한다.
-- exception
--     예외 처리 구문
-- end; -> 필수구문!!
-- /  --슬래쉬는 무조건 마지막에 필수로 넣어줘야 한다.

--데이터조회===============================================================

--PL/SQL 초기세팅

set serveroutput on;  --기본적으로 초기 세팅 해놓는다.

begin
          dbms_output.put_line('Hello World'); --출력함수 (자바의 sysout구문과 같음.)
end;
/
--=======================================================================
--기본적인 PL/SQL 구문 변수 활용과 선언 및 초기화 

declare
--            vempno number(4);  --변수의 선언
--            vename varchar2(10);

                vempno constant number(4) := 7777;      --변수의 선언과 초기화 동시에 하는 방식    /constant를 쓰면 상수로 변환된다.
                vename varchar2(10) not null  := 'SCOTT';  --not null을 붙이면 null값을 변수의 값으로 사용할 수 없다.
begin
--            vempno := 7777;       --변수의 초기화 / := 콜론는 은 같이 붙여서 사용해야 한다.
--            vename := 'SCOTT';
            
            dbms_output.put_line('사원 / 이름');
            dbms_output.put_line(vempno || ' ' || vename);
end;
/
--========================================================================
--디클레어 2가지 방식

declare 
            --스칼라 방식
            --vempno number(4);
            --레퍼런스 방식 (더 많이 쓰임)
            vempno emp.empno%type := 7777 ;  --기존 테이블의 컬럼의 타입을 참조한다. / % : 참조하다 
 begin 
            --vempno := 7777;
            dbms_output.put_line(vempno);
 end; 
 /
--=========================================================================
--레퍼런스 방식 활용 / 제약이 크나 PL/SQL 구문이 주는 장점이 있음.

declare 
            --레퍼런스 방식 (더 많이 쓰임)
            vempno emp.empno%type;  
            vename emp.ename%type;
begin            --try 영역   

           select empno,ename 
           into vempno,vename  --empno,ename 을 vempno,vename에 넣어준다.
           from emp;
           --where empno = 7788; --필수
           --select구문을 PL/SQL 구문에 쓸때는 into 절과 where절이 필수로 반드시 들어와야 한다.
           
           dbms_output.put_line('사번 / 이름');
           dbms_output.put_line(vempno || ' ' || vename);
           
exception      --catch 영역       --where절이 없을 경우,  / when-then 구문을 쓴다.
           
           when TOO_MANY_ROWS then dbms_output.put_line('행의 수가 여러 개 입니다.');
           when OTHERS then dbms_output.put_line('모든 예외에 대한 처리');
end; 
 /
--=========================================================================
--emp 테이블에 있는 사원의 이름과 직업 추출하기

declare
            --테이블 type (사용자 정의 변수 타입 )
            --배열의 형식과 같다
            --vename varchar2(10)
            
            TYPE empno_table_type IS TABLE OF emp.empno%type
            INDEX BY BINARY_INTEGER;
            
            TYPE ename_table_type IS TABLE OF emp.ename%type
            INDEX BY BINARY_INTEGER;
            
            TYPE job_table_type IS TABLE OF emp.job%type
            INDEX BY BINARY_INTEGER;
            
            TYPE mgr_table_type IS TABLE OF emp.mgr%type
            INDEX BY BINARY_INTEGER;
            
            TYPE hiredate_table_type IS TABLE OF emp.hiredate%type
            INDEX BY BINARY_INTEGER;
            
            TYPE sal_table_type IS TABLE OF emp.sal%type
            INDEX BY BINARY_INTEGER;
            
            TYPE comm_table_type IS TABLE OF emp.comm%type
            INDEX BY BINARY_INTEGER;
            
            TYPE deptno_table_type IS TABLE OF emp.deptno%type
            INDEX BY BINARY_INTEGER;
            
            empnoArr empno_table_type;
            enameArr ename_table_type;  --배열 형식의 변수 선언
            jobArr job_table_type;              --배열 형식의 변수 선언
            mgrArr mgr_table_type;
            hiredateArr hiredate_table_type;
            salArr sal_table_type;
            commArr comm_table_type;
            deptnoArr deptno_table_type;
            
            
            i BINARY_INTEGER := 0;  --변수 i 선언

begin  --반복문 사용
            for k in (select * from emp) loop
                        i := i + 1;  --index번호는 자바 0번 시작과 달리 1번부터 사용된다.
                        empnoArr(i) := k.empno;
                        enameArr(i) := k.ename;  --select구문에서 조회된 k.ename , k.job
                        jobArr(i) := k.job;
                        mgrArr(i) := k.mgr;
                        hiredateArr(i) := k.hiredate;
                        salArr(i) := k.sal;
                        commArr(i) := k.comm;
                        deptnoArr(i) := k.deptno;
                        
            end loop;
            
            for j in 1..i loop 
                        dbms_output.put_line(empnoArr(j) || ' / ' || enameArr(j) || ' / ' || jobArr(j) || ' / ' || mgrArr(j) || ' / ' || hiredateArr(j) || ' / ' || salArr(j) || ' / ' || commArr(j) || ' / ' || deptnoArr(j));
            end loop;

end;
/
--==========================================================================
declare
            
            --테이블 type (사용자 정의 변수 타입 )
            --배열의 형식과 같다
            --vename varchar2(10)
            
             TYPE emp_record_type IS RECORD(
                        v_empno emp.empno%type,
                        v_ename emp.ename%type,
                        v_job emp.job%type,
                        v_deptno emp.deptno%type               
             );
             
             emp_record emp_record_type; --레코드 타입의 변수 선언;
begin
            --레코드 type(여러개의 변수를 묶어서 사용한다) => 사용자 정의 변수 타입
            --클래스랑 유사하다.
            select empno,ename,job,deptno
            into emp_record
            from emp
            where empno = 7788;
            
            dbms_output.put_line(emp_record.v_empno || ' ' || emp_record.v_ename || ' ' || emp_record.v_job || ' ' || emp_record.v_deptno);
            
end;
/
--============================================================================



--데이터 생성 및 삽입=============================================================
create table dept_record
as
select * from dept;

declare
            TYPE rec_dept IS RECORD(
                    v_deptno dept_record.deptno%type,
                    v_dname dept_record.dname%type,
                    v_loc dept_record.loc%type
            );
            
            dept_rec rec_dept;  --변수와 테이블명이 같으면 오류남.
begin
            dept_rec.v_deptno := 50;
            dept_rec.v_dname := 'DEV';
            dept_rec.v_loc := 'BUSAN';
            
            insert into dept_record
            values dept_rec;  --values에 (괄호)는 레코드문에서는 안써야 한다.
end;
/
select * from dept_record;


--내가 만든 테이블 정보 업데이트구문====================================================

declare
            TYPE rec_dept IS RECORD(
                    v_deptno dept_record.deptno%type not null  := 99,
                    v_dname dept_record.dname%type,
                    v_loc dept_record.loc%type
            );
            
            dept_rec rec_dept;
         
begin
            dept_rec.v_deptno := 50;
            dept_rec.v_dname := 'INSA';
            dept_rec.v_loc := 'SEOUL';
            
            update dept_record
              -- 바꾸고 싶은 컬럼명 = 50,'SEOUL'
            set dname = dept_rec.v_dname , loc = dept_rec.v_loc
            where deptno = dept_rec.v_deptno;
            
end;
/
select * from dept_record;

--테이블 삭제===========================================================================
declare
           v_deptno dept_record.deptno%type := 50;
begin
          delete from dept_record
          where deptno = v_deptno;     
end;
/

--조건문===============================================================================

declare 
            vempno number(4);
            vename varchar2(10);
            vdeptno varchar2(10);
            vdname varchar2(10) := null ;

begin
            select empno,ename,deptno
            into vempno,vename,vdeptno
            from emp
            where empno = 7788;
            --oracle에서의 if문 특성
--            if( 조건식 ) then     
--                        실행문
--            end if ;
             if( vdeptno = 10 ) then    
                         vdname := 'AAA';
            end if ;
            
            if( vdeptno = 20 ) then     
                         vdname := 'BBB';
            end if ;
            
            if( vdeptno = 30 ) then     
                         vdname := 'CCC';
            end if ;
            
            if( vdeptno= 40 ) then    
                         vdname := 'DDD';
            end if ;
            
            dbms_output.put_line('부서명 : ' || vdname);

end;
/
--%ROWTYPE===========================================================================

declare
            --%ROWTYPE : 테이블의 모든 컬럼의 이름과 변수를 참조하겠다.
            --컬럼명이 변수명으로 사용되고 컬럼의 타입을 변수의 타입으로 사용한다.
            
            vemp emp%rowtype;         --emp테이블의 8개의 컬럼이 변수로 사용되는 것 
            
begin
            select *
            into vemp  --%rowtype으로 정의된 타입
            from emp
            where empno = 7788;
            
            dbms_output.put_line(vemp.empno);  --empno : 7788을 가진 사번 정보 조회
            dbms_output.put_line(vemp.ename); 
            dbms_output.put_line(vemp.job);
            dbms_output.put_line(vemp.mgr);
            dbms_output.put_line(vemp.hiredate);
            dbms_output.put_line(vemp.sal);
            dbms_output.put_line(vemp.comm);  --null데이터는 공백으로 출력된다. / null로 출력되는건 툴의 기능마다 다름.
            dbms_output.put_line(vemp.deptno);
            
end;
/

--======================================================================================
--정리 

--스칼라 방식
--레퍼런스 방식
--    1. emp.empno%type
--    2. emp%rowtype

--사용자 정의 변수 타입
--    1. 테이블 type
--                   -TYPE empno_table_type IS TABLE OF emp.empno%type
--                   -INDEX BY BINARY_INTEGER;
--    2. 레코드 type
--                   -TYPE rec_dept IS RECORD(
--                   -v_deptno dept_record.deptno%type not null  := 99,
--                   -v_dname dept_record.dname%type,
--                   -v_loc dept_record.loc%type
--                   - );

--=======================================================================================

--문제 1-1 if-then / end if 문

declare
            --%ROWTYPE : 테이블의 모든 컬럼의 이름과 변수를 참조하겠다.
            --컬럼명이 변수명으로 사용되고 컬럼의 타입을 변수의 타입으로 사용한다.
            vemp emp%rowtype;
            annsal number(7,2);

begin 
            dbms_output.put_line('사번 / 이름 / 연봉');
            dbms_output.put_line('------------- ');
            
            select *
            into vemp 
            from emp
            where empno = 7788;
            
            --Q1.
            --해당 사원의 연봉을 출력하라. 단, 커미션이 null인 경우 0으로 출력하라.
            --계산된 연봉을 변수 annsal에 넣어서 출력하라.
            
             if( vemp.comm is null ) then     
                         vemp.comm := 0;
            end if ;
            
            annsal := vemp.sal*12 + vemp.comm;
          
            dbms_output.put_line('사번 : ' || vemp.empno ||' '|| '이름 : ' ||vemp.ename ||' '||'연봉 : ' || annsal ||'만원');     
end;
/
--==========================================================================================

--문제 1-2  if-then / else if 문  
declare
            --%ROWTYPE : 테이블의 모든 컬럼의 이름과 변수를 참조하겠다.
            --컬럼명이 변수명으로 사용되고 컬럼의 타입을 변수의 타입으로 사용한다.
            vemp emp%rowtype;
            annsal number(7,2);

begin 
            dbms_output.put_line('사번 / 이름 / 연봉');
            dbms_output.put_line('------------- ');
            
            select *
            into vemp 
            from emp
            where empno = 7788;
            
             if( vemp.comm is null ) then     
                        annsal := vemp.sal*12;
            else
                        annsal := vemp.sal * 12 + vemp.comm;
            end if ;
          
            dbms_output.put_line('사번 : ' || vemp.empno ||' '|| '이름 : ' ||vemp.ename ||' '||'연봉 : ' || annsal ||'만원');     
end;
/
--다중 if문 ===================================================================================

declare
            vemp emp %rowtype;
            vdname varchar2(10);
begin
            select *
            into vemp
            from emp
            where empno = 7788;
            
            if(vemp.deptno = 10) then
                    vdname := 'AAA';
            elsif (vemp.deptno = 20) then  --elsif =else if 의 오라클 특성
                    vdname := 'BBB';
            elsif (vemp.deptno = 30) then  
                    vdname := 'CCC';
            elsif (vemp.deptno = 40) then  
                    vdname := 'DDD';
            end if;
            
            dbms_output.put_line(vdname);        
end;
/
--==========================================================================================

--[조건문]
--if then end if;
--if then else end if;
--if then elsif then end if;


--[반복문]
--loop end loop;
--for in loop end loop;  --증가
--for in reverse loop end loop; --감소
--while loop end loop;

--==========================================================================================

--반복문=====================================================================================
--loop (활용 빈도가 낮음)
--        실행문( 무한 반복문 )
--        무한 반복문의 제어
--        1. EXIT WHEN 조건식;
--        2. IF THEN END IF;
--end loop;

declare
            n number := 1;
begin
            loop 
                    dbms_output.put_line(n);
                    n := n +1;  --따로 증감연산자는 존재하지 않으므로 직접 더해줘야 한다.
                    exit when n > 10;  --반복문을 멈추기 위한 조건
            end loop;
end;
/

--for (활용 빈도가 높음)
declare
            --변수 선언 딱히 필요 없음
begin
            --in 구문 뒤에 작성되는 값이 반복의 횟수를 결정한다.
            --in : 증가
            for n in 1..10 loop  --in 뒤에있는 값은 시작값..끝값 1씩 증가  / 1~10까지 10회 반복하는 것.
            dbms_output.put_line(n);
            end loop;
end;
/

declare
            --변수 선언 딱히 필요 없음
begin
            --in 구문 뒤에 작성되는 값이 반복의 횟수를 결정한다.
            --in reverse : 감소
            for n in reverse 1..10 loop  --in 뒤에있는 값은 시작값..끝값 1씩 감소  / 1~10까지 10회 반복하는 것.
            dbms_output.put_line(n);
            end loop;
end;
/


declare
            vdept dept %rowtype;
begin
            for n in 1..4 loop
                    select *
                    into vdept
                    from dept
                    where deptno = 10 * n ;  --where절이 없으면 오류로 판단한다.
            dbms_output.put_line(vdept.deptno || '/ ' || vdept.dname || '/ ' || vdept.loc);
            
            end loop;
end;
/

--while (활용 빈도)
--declare
--            n number := 1;
--begin
--            while (조건식) loop
--            
--            end loop;
--end;
--/

declare
            n number := 1;
begin
            while (n <= 10) loop
            dbms_output.put_line(n);
            n := n + 1;
            end loop;
end;
/






