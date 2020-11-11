--���ο� ����� ����( = ���ο� ��Ű�� ����)
CREATE USER TEST IDENTIFIED BY 12345;

-- scott ���� ��ȣ ����/���� ����

alter user scott identified by tiger account unlock;

-- hr ���� ��ȣ ����/���� ����

alter user hr identified by 12345 account unlock;

--������ ����
-- dba_ : system, sys �� �� ������ (db������ ���� ����)
SELECT * FROM dba_tables;

-- scott���� create view ���� �ο�
-- dcl 
grant create view to scott;
grant create SYNONYM to scott;
grant create PUBLIC SYNONYM to scott;
--���� �۾��� ������ ������ �ִ� �� �ο�
grant CONNECT, RESOURCE TO TEST;
--TEST2 ����� ����(�ƹ����� �� ���� ����� ����)
CREATE USER TEST2 IDENTIFIED BY 12345;
--���� �ο�
GRANT CREATE SESSION TO TEST2;
GRANT CREATE TABLE TO TEST2;
GRANT CONNECT, RESOURCE SESSION TO TEST2;
--���� ���
REVOKE CREATE TABLE FROM TEST2;
-- ��й�ȣ ����
ALTER USER TEST2 IDENTIFIED BY 54321;
--����� ����
DROP USER TEST2; -- ����ڰ� ���� ��ü�� �ƹ��͵�������)

DROP USER TEST2 cascade; --����ڿ� ��ü(table,index,view���) ��λ���

--�������� ����� ����� ����

CREATE USER HYEONJU IDENTIFIED BY 12345;

GRANT CONNECT, RESOURCE TO HYEONJU;