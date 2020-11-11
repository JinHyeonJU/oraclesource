--새로운 사용자 생성( = 새로운 스키마 생성)
CREATE USER TEST IDENTIFIED BY 12345;

-- scott 계정 암호 지정/계정 해제

alter user scott identified by tiger account unlock;

-- hr 계정 암호 지정/계정 해제

alter user hr identified by 12345 account unlock;

--데이터 사전
-- dba_ : system, sys 만 볼 수있음 (db관리를 위한 정보)
SELECT * FROM dba_tables;

-- scott에게 create view 권한 부여
-- dcl 
grant create view to scott;
grant create SYNONYM to scott;
grant create PUBLIC SYNONYM to scott;
--여러 작업의 권한을 가지고 있는 를 부여
grant CONNECT, RESOURCE TO TEST;
--TEST2 사용자 생성(아무권한 이 없는 사용자 생성)
CREATE USER TEST2 IDENTIFIED BY 12345;
--권한 부여
GRANT CREATE SESSION TO TEST2;
GRANT CREATE TABLE TO TEST2;
GRANT CONNECT, RESOURCE SESSION TO TEST2;
--권한 취소
REVOKE CREATE TABLE FROM TEST2;
-- 비밀번호 변경
ALTER USER TEST2 IDENTIFIED BY 54321;
--사용자 삭제
DROP USER TEST2; -- 사용자가 가진 객체가 아무것도없을때)

DROP USER TEST2 cascade; --사용자와 객체(table,index,view등등) 모두삭제

--수업에서 사용할 사용자 생성

CREATE USER HYEONJU IDENTIFIED BY 12345;

GRANT CONNECT, RESOURCE TO HYEONJU;