--user01 ���̺� scott - emp ��ü �����ֱ�

--grant ��ü���� ����
--on ��ü��
--to ������

grant select  --�ٸ� ���̺� ��ü ���� �ο�
on emp
to user01;

revoke select  --�ٸ� ���̺� ��ü ���� ȸ��
on emp
from user01;

--==================================================

--user04 ���̺� scott - emp ��ü �����ֱ�

grant select
on emp
to user04;

revoke select  --�ٸ� ���̺� ��ü ���� ȸ��
on emp
from user04;

--=====================================================
grant select
on emp
to mrole3;

