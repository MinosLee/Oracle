-- ���ڿ� Ÿ��
-- CHAR(����) : �������� , ������ ����Ʈ 
-- VARCHAR(����) : ����Ŭ���� ���������� ������� �ʴ� �����ڷ���.
-- VARCHAR2(����) : ���������� ���� ����Ʈ, ���̴� �ִ�����̰� ������ �޸𸮴� ������ũ�⸸ŭ ����մϴ�.
--				�ִ� 2000����Ʈ�Դϴ�. UTF-8 ���ڵ����� �ѱ��� 3����Ʈ, ����/����/��ȣ�� 1����Ʈ

CREATE TABLE tbl_string(
	acol char(10),		-- 10����Ʈ ��������
	bcol varchar2(10),	-- 10����Ʈ ��������
	ccol nchar(10),		--10������ ��������
	dcol nvarchar2(10)	-- 10������ ��������
);

-- charŸ�� 
INSERT INTO tbl_string(acol) values('abcdefghij');
INSERT INTO tbl_string(acol) values('abcdef'); -- acol�� �������� Ÿ��:�����߰�)
INSERT INTO tbl_string(acol) values('abcdefghijklm');-- ����:�����ʰ�
--INSERTȮ��
SELECT * FROM TBL_STRING;
-- �ѱ�Ȯ��
INSERT INTO tbl_String(acol) values('������');
INSERT INTO tbl_String(acol) values('�����ٶ�');--���� ���� ���� �ʹ� ŭ(����: 12, �ִ밪: 10)
INSERT INTO tbl_String(acol) values('����');

--varchar2 Ÿ��: bcol�� �������� 10����Ʈ
INSERT INTO tbl_string(bcol) values('abcdefghij');
INSERT INTO tbl_string(bcol) values('abcdef'); -- bcol�� ��������. �����߰� ����
INSERT INTO tbl_string(bcol) values('abcdefghijklm');-- ����:�����ʰ�
--INSERTȮ��
SELECT * FROM TBL_STRING;
-- �ѱ�Ȯ��
INSERT INTO tbl_String(bcol) values('������'); -- �����߰� ����
INSERT INTO tbl_String(bcol) values('�����ٶ�');--���� ���� ���� �ʹ� ŭ(����: 12, �ִ밪: 10)
INSERT INTO tbl_String(bcol) values('����'); -- �����߰�����

--char�� varchar2�� ����Ʈ����. nchar�� nvarchar2 �� ���ڰ��� ����(�ٱ��� ���ڰ� ���� ���ԵǴ� �÷��� ������)
--ncharŸ��
INSERT INTO tbl_String(ccol) values('������'); -- �����߰� ����
INSERT INTO tbl_String(ccol) values('�����ٶ�');--���� ���� ���� �ʹ� ŭ(����: 12, �ִ밪: 10)
INSERT INTO tbl_String(ccol) values('����'); -- �����߰�����
SELECT * FROM TBL_STRING; 
--nvarcharŸ��
INSERT INTO tbl_String(dcol) values('������'); -- �����߰� ����
INSERT INTO tbl_String(dcol) values('�����ٶ�');--���� ���� ���� �ʹ� ŭ(����: 12, �ִ밪: 10)
INSERT INTO tbl_String(dcol) values('����'); -- �����߰�����
INSERT INTO tbl_String(dcol) values('�����ٶ󸶹ٻ������ī'); -- ����: �����ʰ�



