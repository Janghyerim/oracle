
--아이디,이름, 이름의 성, 부서 이름

--employees , departments

--조인 방식
select employee_id, e.first_name, e.last_name, d.department_name
from employees e inner join departments d
on e.department_id = d.department_id
where e.department_id = 100;

select count(*) from employees;  --107명 출력

select * from employees
where department_id is null;


--서브쿼리 방식
select employee_id, first_name,last_name, e.department_id,
            (
            select department_name
            from departments d
            where e.department_id = d.department_id
            )as dep_names
from employees e
where e.department_id = 100;


--저장함수 방식
--함수 선언
create or replace function get_dept_name(dept_id number)  
            --리턴할 값 데이터타입 정하기
            return varchar2
is
            --지역변수 선언, 임시로 department_name(부서이름) 저장하는 역할
            sDepName varchar2(30);
begin
            
            select department_name
           --2.테이블의 department_name(부서이름) 컬럼을 조회한다
            into sDepName
            --4.해당컬럼의 데이터를 임시로 이 변수에 저장한다
            from departments
            --1.departments 테이블을 호출
            where department_id = dept_id;
            --3.매개변수로 받은 dep_id(임의의 숫자)가 department_id와 비교했을때 같으면
            return sDepName;
            --5.저장한 변수의 데이터를 반환할 준비를 한다
end;
/

variable var_deptname varchar2(30); 
--타입에 맞는 임시변수를 만든다

exec :var_deptname := get_dep_name(90);
--get_dep_name();함수가 반환 값을 var_deptname 변수에 저장한다

print var_deptname;
--get_dep_name();함수에서 받은 값을 출력한다

select e.employee_id, e.first_name, e.last_name, get_dept_name(department_id) as department_id
from employees e
where e.department_id = 90;



--문제 *****
--employees , jobs
--사원id, 이름, 성, job타이틀 조회
--조인방식, 서브쿼리방식, 함수방식 : get_job_title()

--조인방식
select employee_id , first_name , last_name, job_title
from employees e inner join jobs j
on e.job_id = j.job_id
where e.job_id = 'ST_MAN';

--서브쿼리방식 (select구문에서 서브쿼리 짤때는 끝에 , 붙이고 (서브쿼리) 작성한다.
select employee_id , first_name , last_name, 
            (
            select job_title
            from jobs j
            where e.job_id = j.job_id
            ) as job_titles  --별칭부여
from employees e
where e.job_id = 'ST_MAN';

--함수방식 : get_job_title()
1.생성
create or replace function get_job_title(j_id varchar2)
            return varchar2
is
            sJobTitle varchar2(50);
begin 
            select job_title
            into sJobTitle
            from jobs
            where job_id = j_id;
            
            return sJobTitle;
end;
/

2.실행
select employee_id , first_name , last_name , get_job_title(job_id)
from employees e
where e.job_id = 'ST_MAN';






