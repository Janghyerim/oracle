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

