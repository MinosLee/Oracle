
-- SELECT �⺻����
-- SELECT �÷�1, �÷�2, .. from ���̺�� WHERE �˻����ǽ� ORDER BY �����÷� DESC ASC 

SELECT * FROM TBL_BUY tb ;
SELECT * FROM TBL_CUSTOM tc ;
SELECT * FROM TBL_CUSTOM tc ORDER BY CUSTOM_ID ;
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID = 'mina012';
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID = 'mina012' ORDER BY BUY_DATE DESC;--WHERE ORDER BY ���� ���Ѿ���.
--��ȸ�� �÷� �����Ҷ� distinct Ű���� : �ߺ����� 1���� ������.
SELECT custom_id FROM TBL_BUY tb ; -- ���Ű� id��ȸ


