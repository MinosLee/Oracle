
CREATE TABLE tbl_member(
	mno NUMBER,
	name nvarchar2(50),
	email varchar2(100),
	JOIN_date DATE	-- ��¥-��-��-��, �ð� : ��:��:��.�и���
);
-- ��� �÷��� �����͸� �����ϴ� ����(�÷��� ����), - ��¥�� date�� �ڵ���ȯ
INSERT INTO tbl_member VALUES (1, '����', 'momo@naver.com', '2022-03-02');
-- �Ϻ� �÷��� �����͸� �����ϴ� ����
INSERT INTO tbl_member(mno,name)-- ������ ����� �÷��� ����
VALUES (2, '�̳���');
-----------------------------------------------------
-- 2. dml SELECT (������ �� row ��ȸ)
-- select ��ȸ�� �÷� ��� from ���̺� �̸�[where ���ǽ�]; ��� �÷��� *�� ��ü
SELECT name FROM TBL_MEMBER;
SELECT name, join_date FROM tbl_member;
SELECT * FROM TBL_MEMBER ;
SELECT * FROM TBL_MEMBER WHERE name= '�ִ���'; -- ���ǽ��� 
SELECT * FROM TBL_MEMBER tm WHERE mno > 2;
SELECT * FROM TBL_MEMBER tm WHERE JOIN_DATE  > '2022-03-03';
SELECT name, EMAIL FROM TBL_MEMBER tm WHERE JOIN_DATE  > '2022-03-03';
--null�� ��ȸ
SELECT * FROM TBL_MEMBER tm WHERE EMAIL IS NULL ; 
SELECT * FROM TBL_MEMBER tm WHERE EMAIL IS NOT NULL ; 
-- ���ڿ��� �κа˻�: like����
SELECT * FROM TBL_MEMBER WHERE name LIKE '%����';
SELECT * FROM TBL_MEMBER WHERE name LIKE '����%';
SELECT * FROM TBL_MEMBER WHERE name LIKE '%����%';

--or ���� : mno���� 1�Ǵ� 2�Ǵ� 4
SELECT * FROM TBL_MEMBER tm WHERE mno = 1 OR mno= 2 OR mno= 4;

-- ����Ŭ�� or ��ü ������ : in*���ϰɷ��� ���� ���ǽ��� ��
SELECT * FROM TBL_MEMBER tm WHERE mno in(1,2,4);
SELECT * FROM TBL_MEMBER tm WHERE mno NOT in(1,2,4);
SELECT * FROM TBL_MEMBER tm WHERE name in('����','�ִ���');


----------------------------------------------------
-- ó�� ���� ���̺� ���� �� mno�÷��� ���е� 5�� ��Һ����� ���Ѵٸ�
-- mno�÷��� ���� �������

INSERT INTO TBL_MEMBER VALUES (3, '�ִ���', 'dahy@naver.com', '2022-03-04 16:47'); --����

-- ����Ŭ�� to_date �Լ��� ���ڿ��� ��¥�������� ��ȯ(�ι�° ���ڴ� ����)
INSERT INTO TBL_MEMBER VALUES (3, '�ִ���', 'dahy@naver.com', to_date('2022-03-04 16:47','yyyy-mm-dd hh24:mi'));

-- to_char �Լ�: ��¥���Ŀ��� ���ڿ��� �����մϴ�. �ι�° ���ڴ� ����-> �⵵ �Ǵ� �Ϻ� ���� ���⿡ Ȱ��.
SELECT to_char(JOIN_date, 'yyyy') FROM TBL_MEMBER;

--���� �ý����� ��¥�� �ð�: sysdate�Լ�
INSERT INTO TBL_MEMBER VALUES (4, '����', 'aaa@naver.com', sysdate);

SELECT * FROM tbl_member;