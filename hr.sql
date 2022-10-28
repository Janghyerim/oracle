
--���̵�,�̸�, �̸��� ��, �μ� �̸�

--employees , departments

--���� ���
select employee_id, e.first_name, e.last_name, d.department_name
from employees e inner join departments d
on e.department_id = d.department_id
where e.department_id = 100;

select count(*) from employees;  --107�� ���

select * from employees
where department_id is null;


--�������� ���
select employee_id, first_name,last_name, e.department_id,
            (
            select department_name
            from departments d
            where e.department_id = d.department_id
            )as dep_names
from employees e
where e.department_id = 100;


--�����Լ� ���
--�Լ� ����
create or replace function get_dept_name(dept_id number)  
            --������ �� ������Ÿ�� ���ϱ�
            return varchar2
is
            --�������� ����, �ӽ÷� department_name(�μ��̸�) �����ϴ� ����
            sDepName varchar2(30);
begin
            
            select department_name
           --2.���̺��� department_name(�μ��̸�) �÷��� ��ȸ�Ѵ�
            into sDepName
            --4.�ش��÷��� �����͸� �ӽ÷� �� ������ �����Ѵ�
            from departments
            --1.departments ���̺��� ȣ��
            where department_id = dept_id;
            --3.�Ű������� ���� dep_id(������ ����)�� department_id�� �������� ������
            return sDepName;
            --5.������ ������ �����͸� ��ȯ�� �غ� �Ѵ�
end;
/

variable var_deptname varchar2(30); 
--Ÿ�Կ� �´� �ӽú����� �����

exec :var_deptname := get_dep_name(90);
--get_dep_name();�Լ��� ��ȯ ���� var_deptname ������ �����Ѵ�

print var_deptname;
--get_dep_name();�Լ����� ���� ���� ����Ѵ�

select e.employee_id, e.first_name, e.last_name, get_dept_name(department_id) as department_id
from employees e
where e.department_id = 90;



--���� *****
--employees , jobs
--���id, �̸�, ��, jobŸ��Ʋ ��ȸ
--���ι��, �����������, �Լ���� : get_job_title()

--���ι��
select employee_id , first_name , last_name, job_title
from employees e inner join jobs j
on e.job_id = j.job_id
where e.job_id = 'ST_MAN';

--����������� (select�������� �������� ©���� ���� , ���̰� (��������) �ۼ��Ѵ�.
select employee_id , first_name , last_name, 
            (
            select job_title
            from jobs j
            where e.job_id = j.job_id
            ) as job_titles  --��Ī�ο�
from employees e
where e.job_id = 'ST_MAN';

--�Լ���� : get_job_title()
1.����
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

2.����
select employee_id , first_name , last_name , get_job_title(job_id)
from employees e
where e.job_id = 'ST_MAN';






