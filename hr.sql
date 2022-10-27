
--아이디,이름, 이름의 성, 부서 이름

--employees , departments

select employee_id, first_name, last_name, department_name
from employees e inner join departments d
on e.department_id = d.department_id;

select count(*) from employees;  --107명 출력

select * from employees
where department_id is null;