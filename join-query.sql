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

