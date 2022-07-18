-- �����ͺ��̽� Ʈ���� : insert update delete �� �� �����ϴ� ���ν���
-- Ư�� ���̺� �����ִ� ��ü

CREATE OR REPLACE TRIGGER secure_custom
BEFORE UPDATE OR DELETE ON tbl_custom --Ʈ���� �����ϴ� ���̺�, sql�� ����
BEGIN 
	IF to_char(sysdate, 'hh24:mi') BETWEEN  '13:00' AND '15:00' THEN 
	raise_application_error(-20000,'���� ���� 1��~3�ô� �۾��� �� �����ϴ�');
	end IF;
END;

DELETE FROM tbl_custom WHERE CUSTOM_ID = 'momo';

-- Ʈ���ſ� �ʿ��� ���̺� ������ ����.
CREATE TABLE TBL_TEMP AS SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID = '0';

-- Ʈ���� ��Ȱ��ȭ
ALTER TRIGGER secure_custom enable;-- Ȱ��ȭ�� enable�� disable�� ����.

-- Ʈ���� ����(����)
CREATE OR REPLACE TRIGGER cancel_buy
AFTER DELETE ON tbl_buy
FOR EACH ROW -- ����(����)�ϴ� ���� �������� �� ������ �࿡ ���� �϶�� ��, OLD UPDATE �Ǵ� DELETE �ϱ� �� �� : NEW �� INSERT �� ��.
BEGIN 
	-- ���� ��� (tbl_buy���̺��� ����) �� ������ tbl_temp �ӽ� ���̺� insert : ���� �࿡ ���� �۾� (��Ʈ����)
	INSERT INTO TBL_TEMP 
	VALUES
	(:OLD.custom_id,:OLD.pcode,:OLD.quantity,:OLD.buy_date,:OLD.buyno);
	
END;
-- Ʈ���� ���� �׽�Ʈ
DELETE FROM TBL_BUY tb WHERE CUSTOM_ID = 'wonder';
SELECT * FROM tbl_temp;


-- �߰� �� ���� ����
-- grant resource connect to C##idev -> ���⿡�� ����� ���� ����
-- grant create view to c##idev; ����� ���� ���� ��������� �߰����� �ο�

CREATE VIEW v_buy
AS SELECT tb.CUSTOM_ID , tb.PCODE , tc.NAME , tc.EMAIL , tb.QUANTITY 
FROM tbl_buy tb, tbl_custom tc WHERE tb.CUSTOM_ID = tc.CUSTOM_ID ;