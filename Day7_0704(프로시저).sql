-- PL/SQL : Procedure(����,����) , ������ �ܼ��� SQL�� Ȯ��� ���(SQL�� ����� ���α׷�)
--			����,���(if,�ݺ���)�� ����Ͽ� ���α׷��־��� ���� sql ������ �帧�� ����

--���� : ������ ���ν����� ����� ����� ����(������� ���Ѵٸ� sql developer ���)
DECLARE   -- ���������  
--	vcustomid varchar2(20);
--	vage number(3,0);
 	vname tbl_custom.name %TYPE; -- ������ ���̺��� �÷��� ���������� ����
 	vage tbl_custom.age %TYPE;


BEGIN		--���ν��� ����
-- ���ν��� ���ο��� �ַ� DML ��ɹ����� �ۼ�.(�Բ� �����ؾ��� ���� SQL : Ʈ�����)
	SELECT name,age
	INTO vname , vage	-- ���ν��� ����: �˻������ ������ ����
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID ='hongGD';		-- 1�� �ุ ��� ��ȸ�Ǵ� ����
	
-- �������� �ֿܼ� ���(���ν��� ���)
	DBMS_OUTPUT.PUT_LINE('���̸� : ' || vname);
	DBMS_OUTPUT.PUT_LINE('������ : ' || vage);
	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   -- exception�̸� - ���� �̸��� �پ��մϴ�. ���� no_data_found
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');
END;

-- ����Ŭ ��ü ���ν��� ����: �˻��� ���� �Ű������� ����
-- ���ν��� ����.
CREATE OR REPLACE PROCEDURE  search_custom( -- ���ν��� �̸�����
	c_id IN tbl_custom.CUSTOM_ID %TYPE	--�Ű����� IN 
											--���ϰ� OUT
)

IS -- IS �ڿ� �Ϲݺ��� ����
	vname tbl_custom.name %TYPE; -- ������ ���̺��� �÷��� ���������� ����
 	vage tbl_custom.age %TYPE;
	
BEGIN 
	SELECT name,age
	INTO vname , vage	
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID =c_id;	-- 1�� �ุ ��� ��ȸ�Ǵ� ����
	
-- �������� �ֿܼ� ���(���ν��� ���)
	DBMS_OUTPUT.PUT_LINE('���̸� : ' || vname);
	DBMS_OUTPUT.PUT_LINE('������ : ' || vage);
	EXCEPTION	
	WHEN no_data_found THEN 
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');

	
END ;


-- ���ν��� ����- begin end�� �ʼ��� ��.

BEGIN 
	search_custom('mina012');
END;



----------------------------------------------------------------
CREATE OR REPLACE PROCEDURE  search_custom2( -- ���ν��� �̸�����
	c_id IN tbl_custom.CUSTOM_ID %TYPE,	--�Ű����� IN 
	c_name OUT tbl_custom.NAME %TYPE										--���ϰ� OUT
)
IS -- IS �ڿ� �Ϲݺ��� ����
--	vname tbl_custom.name %TYPE; -- ������ ���̺��� �÷��� ���������� ����
-- 	vage tbl_custom.age %TYPE;
	
BEGIN 
	SELECT name
	INTO c_name
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID =c_id;	-- 1�� �ุ ��� ��ȸ�Ǵ� ����
	
-- �������� �ֿܼ� ���(���ν��� ���)
	DBMS_OUTPUT.PUT_LINE('���̸� : ' || c_name);
	EXCEPTION	
	WHEN no_data_found THEN 
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');
		c_name := 'no match'; -- ���Թ� := ��ȣ

END ;


--���(���ϰ�) �� �ִ� ���ν��� ����: ��°� ������ ���� ���� �ʿ�.

DECLARE
	vname tbl_custom.name %TYPE;
	
BEGIN
	search_custom2('m2',vname); -- vname �� ���ν��� ���Ǹ� �� �� OUT���� ����
	-- vname:=search_custom2('mina012'); �� ��������
	dbms_output.put_line('���̸� : '|| vname);
END;

-- BEGIN ~END���� �ϳ��� Ʈ������� �����ϴ� DML(INSERT, UPDATE, DELETE ����) ��ɵ�� ����
-- ������ ����� EXCEPTION ���� ROLLBACK; ������ �������� COMMIT�� ����.

-- ���ν����� �� �� �ִ� ��� SQL
-- ������ ������ ���� ���̺� �����
CREATE TABLE TBL_TEMP
AS
SELECT * FROM TBL_CUSTOM tc WHERE CUSTOM_ID = '0';

-- SELECT �� ��� INSERT �ϱ�
INSERT INTO TBL_TEMP (SELECT * FROM TBL_CUSTOM tc WHERE CUSTOM_ID = 'wonder');

SELECT  * FROM TBL_TEMP tt ;