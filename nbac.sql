drop user user03 cascade;

create user user03 identified by 1234;  --system�� ���� ������ �����̱� ������ ���� ������ �� �� �ִ�.

--����� ���� ��
--������ ���������� ����
--create role �Ѹ�
--grant ���� to �Ѹ�
--�ý��۱���(create .....) �����ڰ� �ο�
--��ü ����   (select ......) �����ְ� �ο�

--�ý��۱���(�����ڰ�������)
--create role mrole;

drop role mrole;
drop user user04;

create role mrole;                 --���� ���� �� (������ ������� �׷�)

grant create session , create table , create view  --�ý��� ����
to mrole;

create user user04 identified by 1234;    --���� ���� ���� user04�� �ο�

grant mrole,create session
to user04;

alter user user04
quota 2m on users; 

--============================================================
--������ ���ѿ��� �� ����
create role mrole2;

--��ü������ �ش� ����� �������� ����
--scott ���� emp�� �������� scott���� ������ ��
grant select 
on emp
user mrole2;

--�� ������ ������ ���������� ����
grant mrole2
to user04;

--===============================================================
create role mrole3;

grant role mrole3
to user01;

revoke role mrole3
from user01;

--===============================================================
set role all;

create user user05 identified by 1234;

grant connect,resource
to user05;

create role mrole3;

grant mrole3
to user05;

revoke mrole3
from user05;






