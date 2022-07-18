

-- �������� ������ create table, alter table���� ��.

--�������� 1 : not null-- �ݵ�� ���� �����ؾ� �Ѵٴ� ��
CREATE TABLE tbl#(
	col1 varchar2(10),
	col2 number(3) NOT NULL 
);

INSERT INTO tbl#(col2) VALUES(98);
INSERT INTO tbl#(col1) VALUES('korean'); --����: col2�÷��� NOT NULL �������� ����
INSERT INTO tbl# VALUES ('korean',78);
INSERT INTO tbl# VALUES ('korean',88);

--Ȯ��
SELECT * FROM tbl#;

--���ο� �������� 2) unique �� ���� col3

ALTER TABLE tbl# ADD col3 varchar2(10) UNIQUE; -- ������ ���̾�� ��.

--���� insert �� ������ �߻��ϴ� ����?

INSERT INTO tbl#(col1) VALUES('english');-- ����
INSERT INTO tbl#(col2) VALUES(77);
INSERT INTO tbl#(col3) VALUES('english');-- ����
INSERT INTO tbl#(col1,col2) VALUES('english',88);
INSERT INTO tbl#(col2,col3) VALUES(88,'science');
INSERT INTO tbl#(col1,col3) VALUES('science',88);-- ����
INSERT INTO tbl#(col1,col2,col3) VALUES('english',89,'science');--���� - science�� col3�� unique������ ������ science�� �����߱⿡ �ٽ� science�� �����ϴ� ���� �Ұ�����.
INSERT INTO tbl#(col1,col2,col3) VALUES('english',89,'math');
-- üũ���� : unique�÷��� null��� ����.

--�������� 3) �⺻Ű(primary key)�� not null�� unique��������.

CREATE TABLE tbl2#(
	tno number(3) PRIMARY KEY,
	tid number(3) UNIQUE
);

INSERT INTO tbl2#(tno) VALUES (123);
SELECT * FROM tbl2#;
--���Ἲ ��������(pk�⺻Ű �÷��� ������ ���̸鼭 not null�Դϴ�. )�� ����˴ϴ�.
INSERT INTO tbl2#(tno) VALUES (123); --UNIQUE
INSERT INTO tbl2#(tid) VALUES (123); -- not null

-- �������� 4) check :�÷����� ������ ���� -> age �÷����� 16~80
ALTER TABLE TBL2# ADD age number(3) CHECK (age BETWEEN 16 AND 80);
INSERT INTO TBL2#(tno, tid, age) VALUES (222, 123, 20);
INSERT INTO TBL2#(tno, tid, age) VALUES (222, 124, 90);	--����: üũ�������� ����

-- ����(gender)�÷� �߰�
ALTER TABLE "TBL2#" ADD gender char(1) CHECK (gender IN ('M','F'));
INSERT INTO "TBL2#"(tno, GENDER) VALUES (224, 'F');
INSERT INTO "TBL2#"(tno, GENDER) VALUES (225, 'M');
INSERT INTO "TBL2#"(tno, GENDER) VALUES (226, 'm'); -- ����: check�������� ���� �ҹ��� m

-- ����(gender)�÷� ����
ALTER TABLE "TBL2#" MODIFY gender char(1) CHECK (gender IN ('M','F','m','f')); -- ���� �����÷��� �������Ǹ� �����ϴ� ��쿣 �̰� �ƴ� �ٸ� ��ɾ� ����ʿ�.
-- ���� Į���� �������� ������ ����(drop) �� �߰�(add)�ؾ� ��.
ALTER TABLE "TBL2#" DROP CONSTRAINTS tbl2_CHK_GENDER;
ALTER TABLE "TBL2#" ADD CONSTRAINTS tbl2_CHK_GENDER2 CHECK (gender IN ('M','F','m','f'));

INSERT INTO "TBL2#"(tno, GENDER) VALUES (226, 'm'); --���� 
INSERT INTO "TBL2#"(tno, GENDER) VALUES (227, 'f');  

