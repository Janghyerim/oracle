--Q1* 125p
select *
from emp
where ename like '%S';

--Q2**125p
select empno,ename,job,sal,deptno
from emp
where deptno = 30 
and job = 'SALESMAN';

--Q3*125p
select empno,ename,job,sal,deptno
from emp
where deptno in(20,30) and sal>2000;

--Q3-2*****125p
select empno,ename,job,sal,deptno
from emp
where deptno = 20 and sal > 2000
UNION
select empno,ename,job,sal,deptno
from emp
where deptno = 30 and sal > 2000;


--Q4***126p
select *
from emp
where not sal >= 2000 and sal <= 3000; 
--where sal < 2000 or sal > 3000;

--Q5 *****126p
select empno,ename,job,sal,deptno
from emp
where deptno = 30 and ename like '%E%' and sal not between 2000 and 3000;

--Q6*****126p
select *
from emp
where comm is null
and job in('MANAGER','CLERK')
and mgr is not null
and ename not like '_L%';

--Q1 근속연수 구하기
select trunc((sysdate-hiredate)/365 )근속연수
from emp;

 --Q1 174p
select empno,rpad(substr(empno,1,2),4,'*')as MASKING_EMPNO,ename,rpad(substr(ename,1,1), length(ename),'*')as MASKING_ENAME
from emp
where  length(ename) >= 5 and length(ename)<6;

 --Q2 174p
select empno,ename,sal,trunc(sal / 21.5,2) as DAY_PAY, round(sal / 21.5 / 8,1)as TIME_PAY
from emp;

--Q4 175p*****
select empno,ename,mgr,
            case
                       when substr(mgr,1,2) ='75' then '5555'
                       when substr(mgr,1,2) ='76' then '6666'
                       when substr(mgr,1,2) ='77' then '7777'
                       when substr(mgr,1,2) ='78' then '8888'
                       when  mgr is null then '0000'
                       else to_char(mgr)
           end as CHG_MGR
from emp;

 --Q8-1  239p
 select d.deptno,d.dname,e.empno,e.ename,e.sal
 from emp e inner join dept d
--using(deptno)
--where e.sal > 2000;
on e.deptno = d.deptno and e.sal>2000
order by deptno asc;

--Q8-2 239p
select d.deptno,d.dname,trunc(avg(sal),0) AVG_SAL,max(sal) MAX_SAL,min(sal) MIN_SAL,count(*) CNT
from emp e inner join dept d
--using(deptno) 별칭 사용 시 적용이 제한된다.
--group by d.deptno;
on e.deptno = d.deptno --on사용
group by d.deptno,dname;

--Q8-3 239p
select d.deptno,d.dname,e.empno,e.ename,e.job,e.sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by d.deptno,e.ename;

--Q8-4 240p *****
select d.deptno,d.dname, e.empno,e.ename, e.mgr,e.sal,
            e.deptno as DEPTNO_1,
            s.losal as LOSAL,
            s.hisal as HISAL,
            s.grade,m.empno as MGR_EMPNO,
            m.ename as MGR_ENAME
from emp e right outer join dept d
on e.deptno = d.deptno
        full outer join salgrade s
on e.sal between s.losal and s.hisal
        left outer join emp m
on e.mgr = m.empno
order by d.deptno,e.empno;











