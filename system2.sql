--����� ���� 
--create , drop
--create user ������ identified by �н�����   //����� ���� ����¹��

create user user01 identified by 1234;  --���̺� ���� 1

--DCL(�����)
--grant(���Ѻο�), revoke(����ȸ��)
grant CREATE SESSION
to user01;

alter user user01 identified by tiger;  --���̺� ���� 2

drop user user01 CASCADE;   --���̺� ���� 3

--============================================================================

--user01���̺� �����ֱ�
grant create table    --����� �������� user01 ���̺� ���� �ִ� ��
to user01;

revoke create table  --��ȯ ȸ��
from user01;


--user01���̺� �뷮 �Ҵ� �ֱ�
alter user user01
quota 2m on users;