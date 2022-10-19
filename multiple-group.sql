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






