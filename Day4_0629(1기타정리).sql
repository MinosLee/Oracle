-- DDL: create, alter, drop, TRUNCATE 
-- ����� user table sequence view .. �� truncate �� ���̺� ���
-- DML : insert update delete

DROP TABLE students; -- �긦 ���� ��������ϸ� �ȵ�.  
						-- �ܷ� Ű�� ���� �����Ǵ� ����/�⺻ Ű�� ���̺� �ֽ��ϴ�.
DROP TABLE scores;

--UPDATE ���̺�� SET �÷��� = ��,�÷��� = ��,�÷��� = ��,�÷��� = ��,...WHERE �����÷������ 
-- delete from ���̺�� where �����÷������
-- ������ �� UPDATE �� delete�� where���� ����ϸ� ������.
-- truncate�� ������ ���(rollback)�� �� ���� ������ DDL�� ����

SELECT * FROM STUDENTS s ;
-- UPDATE delete select ���� where�� �÷��� �⺻�� �÷��̸� ����Ǵ� ���� ��ϱ��? �ִ� 1��
-- �⺻Ű�� ������ ���̺��� ���� ���� �����ϴ� ����(�ĺ�)
UPDATE STUDENTS SET AGE = 17 WHERE std1 = 2021001;

--rollback�׽�Ʈ (�����ͺ��̽� �޴����� Ʈ������ ��带 manual�� ����)
UPDATE STUDENTS SET ADR  = '���ϱ�', AGE = 16 WHERE STD1 = 2021001;
ROLLBACK; -- ���� ������Ʈ ������ �����
UPDATE STUDENTS SET ADR  = '���ϱ�', AGE = 16 WHERE STD1 = 2021001;
COMMIT;
ROLLBACK;--�̹� Ŀ�Ե� ��ɾ�� �ѹ� �Ұ�.
-----------------------------------------
--Ʈ����� ���� ��� : rollback, commit
DELETE FROM SCORES s ;
SELECT * FROM SCORES s ;
ROLLBACK;
SELECT * FROM SCORES s ;
DELETE FROM SCORES s WHERE STD1 = 2019019;
SELECT *FROM SCORES s ;
-- �� ������� Ʈ����� ��������̰� ���� â���� SELECT ��� 2019019�� ����.
-- �ٸ� ������� �ٸ� Ŭ���̾�Ʈ�̹Ƿ� ��������(����Ŀ���� ����)�� ������.
ROLLBACK;
SELECT * FROM SCORES s ;

--------------
TRUNCATE TABLE SCORES ; --��� �����͸� ����. rollback���� Ȯ��?
						--�ѹ� �Ұ�.
-- ��� �����͸� ������� Ȯ���ϸ� �ٸ��͵�� ���� �ѹ���� �ʰ� Ȯ���� TRUNCATE �ϸ� ����.
-------------------------------------

/*
INSERT 
DELETE 
COMMIT
UPDATE
DELETE
ROLLBACK
INSERT
INSERT
ROLLBACK
INSERT
UPDATE
COMMIT
*/