
CREATE TABLE students (
	std1 char(7) PRIMARY KEY,
	nam varchar(10) NOT NULL,
	age NUMBER(2),
	adr varchar(10)
);

INSERT INTO students VALUES ('2021001','����',16,'���ʱ�');
INSERT INTO students VALUES ('2019019','������',18,'������');


CREATE TABLE scores (
	std1 char(7) ,
	sbj varchar(6) ,
	sco NUMBER(3) NOT NULL,
	tch varchar(10) NOT NULL,
	ssn char(6) NOT NULL,
	PRIMARY key(std1, sbj),
	FOREIGN KEY (std1) REFERENCES students
	-- �ܷ�Ű ���� REFERENCES(����) Ű���� �ڿ� ���� ���̺�(�����÷�)
	-- (�����÷�) �̸��� ���� ���̺�� �ܷ����̺� �� ��� ���� ��� (�����÷�)��������.
	-- �ܷ�Ű �÷��� FOREIGN KEY Ű���� �ڿ� ()�ȿ� �ۼ�.
	-- �����÷��� ����- �⺻Ű �Ǵ� unique �������� �÷��� ����
);

CREATE TABLE scores (
	std1 char(7) ,
	sbj varchar(6) ,
	sco NUMBER(3) NOT NULL,
	tch varchar(10) NOT NULL,
	ssn char(6) NOT NULL,
);

--alter table ~add constraint
ALTER TABLE scores ADD CONSTRAINT pk_scores PRIMARY KEY (std1,sbj);
ALTER TABLE scores ADD CONSTRAINT fk_scores FOREIGN KEY (std1) REFERENCES students(std1);
	

INSERT INTO scores VALUES (2021001,'����',89,'�̳���','2022_1');
INSERT INTO scores VALUES (2021001,'����',78,'��浿','2022_1');
INSERT INTO scores VALUES (2021001,'����',67,'�ڼ���','2021_2');
INSERT INTO scores VALUES (2019019,'����',92,'�̳���','2019_2');
INSERT INTO scores VALUES (2019019,'����',85,'������','2019_2');
INSERT INTO scores VALUES (2019019,'����',88,'�ڼ���','2020_1');
SELECT * FROM scores;