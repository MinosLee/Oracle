INSERT INTO tbl_buy(custom_id,PCODE, QUANTITY, BUYNO)
VALUES ('sana97','GALAXYS22',1,tblbuy_seq.nextval);

SELECT * FROM TBL_BUY tb ;

--commit�� rollback�׽�Ʈ--
--ȸ���� ���ų��� ����
DELETE FROM TBL_BUY tb WHERE CUSTOM_ID = 'twice';
DELETE FROM TBL_CUSTOM tc  WHERE CUSTOM_ID = 'twice';

SELECT *FROM TBL_CUSTOM tc ;
SELECT * FROM TBL_BUY tb ;
ROLLBACK;


-- select * from TBL_CUSTOM tc;