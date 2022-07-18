-- ����. custom_id 'mina012' �� ������ ���� ��ȸ : pcode��ȸ�ϰ� pname�� �� �� ����.
SELECT pcode FROM TBL_BUY tb WHERE CUSTOM_ID = 'mina012';

-- 1. �������� (select �ȿ� select�� ���.)
SELECT pname FROM TBL_PRODUCT tp -- �ܺ�����
WHERE PCODE = 					-- ���ǽ��� = �����̹Ƿ� ����Ŀ���� 1�� �� ������� ��.
(SELECT pcode FROM TBL_BUY tb WHERE custom_id = 'mina012'  --��������
AND buy_date= '2022-02-06');


SELECT  pname FROM TBL_PRODUCT tp 
WHERE pcode IN 				-- ���ǽ��� IN �����̹Ƿ� ���������� ������ �� ����� ����
(SELECT pcode FROM TBL_BUY tb WHERE custom_id = 'mina012');

--���� ���� �׽�Ʈ
SELECT pcode FROM TBL_BUY tb  whrere custom_id= 'mina012'	--��������
								AND BUY_DATE = '2022-02-06';
								
SELECT pcode FROM TBL_BUY tb WHERE CUSTOM_ID = 'mina012';

-- �������� ������ : �ܺ������� ���ǽ��� ��� �࿡ ���� �˻��Ҷ����� ���������� ����ǹǷ� ó���ӵ��� ������ ����.- ���̺��� ���ο��� ������� ȿ������

-- 2. SELECT �� join : �� �̻��� ���̺�(�ַ��������� ���̺�)�� �����Ͽ� �����͸� ��ȸ�ϴ� ���
-- ��������: �� �̻��� ���̺��� ����� �÷��� ���� �� �÷����� '����='�� �̿��Ͽ� join��.
-- ����1 : select~~from ���̺� 1 a , ���̺� 2 b where a �����÷�1=b. �����÷�1;

--������ ���� ��ǰ�߰�
INSERT INTO TBL_PRODUCT VALUES ('GALAXYS22','A1','������S22',555600);

-- joinŰ��3�� ���� ����
SELECT * FROM TBL_PRODUCT tp , TBL_BUY tb WHERE tp.PCODE = tb.PCODE ; --��������

--���� Ű���带 ���� ��ɹ� ���� 2(ansiǥ��)
SELECT * FROM TBL_PRODUCT tp JOIN TBL_BUY tb ON tp.PCODE = tb.PCODE ;-- ��������. �����÷����� = ����� ���.

-- TBL_CUSTOM�� TBL_BUY���̺� ����
SELECT * FROM TBL_CUSTOM tc, TBL_BUY tb WHERE tc.custom_id = tb.CUSTOM_ID ;
SELECT * FROM TBL_CUSTOM tc JOIN TBL_BUY tb ON tc.custom_id = tb.CUSTOM_ID ;

-- ���� �� ������� Ư���÷��� ��ȸ

SELECT tc.CUSTOM_ID, name, REG_DATE , pcode, quantity FROM TBL_CUSTOM tc, TBL_BUY tb WHERE tc.custom_id = tb.CUSTOM_ID AND tc.CUSTOM_ID = 'mina012' ;

-- mina012 �� ������ ��ǳ�� ��ȸ.
SELECT tp.pname FROM TBL_PRODUCT tp , TBL_BUY tb  WHERE tp.PCODE = tp.PCODE  AND custom_id= 'mina012';

SELECT tp.pname FROM TBL_PRODUCT tp JOIN TBL_BUY tb ON tp.PCODE = tb.PCODE AND custom_id= 'mina012';

SELECT tp.pname FROM TBL_PRODUCT tp JOIN TBL_BUY tb ON tp.PCODE = tb.PCODE AND custom_id= 'mina012' AND buy_date = '2022-02-06';

-- mina 012�� ������ ��ǰ��� ������ȸ
SELECT  tp.pname, tp.price FROM TBL_PRODUCT tp , TBL_BUY tb  WHERE tp.PCODE= tb.PCODE AND custom_id= 'mina012';

-- ������ �� �̸��� ���� �÷��� ���̺� ���� �ݵ�� �����ؾ� ��.

-- 3���� ���̺� ������ �����Ѱ�?
SELECT * FROM TBL_PRODUCT tp ,
(SELECT tc.custom_id cusid, name, email, age, reg_date, pcode, quantity, buy_date, buyno 
	FROM TBL_CUSTOM tc , TBL_BUY tb 
	WHERE tc.CUSTOM_ID = tb.CUSTOM_ID ) temp--ù���� ����
	WHERE tp.PCODE = temp.pcode ; --�ι�° ����

SELECT * FROM TBL_BUY tb , TBL_CUSTOM tc , TBL_PRODUCT tp WHERE tc.CUSTOM_ID = tb.CUSTOM_ID AND tp.PCODE  = tb.PCODE ;
	

-- Ư���÷��� ��ȸ
SELECT tb.CUSTOM_ID , tb.PCODE , name, age, pname, QUANTITY, BUY_DATE 
	FROM TBL_BUY tb ,TBL_CUSTOM tc ,TBL_PRODUCT tp 
	WHERE tc.CUSTOM_ID = tb.CUSTOM_ID AND tp.PCODE = tb.PCODE ;

-- 3. �ܺ�����(outer join): ������ ����ϴ� �����̳� ���ʿ� ���� ���� ���ΰ���� ����.

-- joinŰ���� ���� ����
SELECT * FROM TBL_PRODUCT tp , TBL_BUY tb -- ������ ���̺� 2��
		WHERE tp.PCODE = tb.PCODE(+) ; -- �ܺ����� tbl_buy ���̺� ��ġ�ϴ� pcode���� ��� ���Խ�Ű�� ����.
										-- �������� �� null�� �Ǵ� ���̺��� �÷��� (+) ��ȣ

--���� Ű���带 ���� ��ɹ� ���� 2(ansiǥ��)
SELECT * FROM TBL_PRODUCT tp LEFT OUTER JOIN TBL_BUY tb ON tp.PCODE = tb.PCODE ;-- tbl_product�� �������̺��̸� �� ���� ��� �����Ͽ� ����.


SELECT * FROM TBL_BUY tb RIGHT OUTER JOIN TBL_PRODUCT tp ON tb.PCODE = tp.PCODE ;


