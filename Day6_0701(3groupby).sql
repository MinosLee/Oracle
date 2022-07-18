
-- ����: ���� �׷�ȭ�ϰ� �׷��Լ��� ����Ѵ�. ����ϴ� ������ �Ʒ��� ����. []�ȿ� �ִ� ���� �� ���� �ְ� �� �� ���� ����.
-- SELECT ��
-- [WHERE] 
-- GROUP BY 
-- [HAVING]
-- [ORDER BY]
 
SELECT count (*) FROM TBL_BUY tb  GROUP BY PCODE ;

SELECT pcode, COUNT(*), sum(quantity) FROM TBL_BUY tb GROUP BY pcode ORDER BY 2;-- ��ȸ�� �÷��� ��ġ

SELECT pcode , count(*) cnt, sum(quantity) total FROM TBL_BUY tb GROUP BY pcode ORDER BY cnt;-- �׷��Լ� ����� ��Ī

-- �׷�ȭ �Ŀ� �����հ谡 3�̻� ��ȸ
SELECT PCode , count(*) cnt , sum(quantity) total 
	FROM TBL_BUY tb 
	GROUP BY pcode --HAVING total>= 3 -- ������� �÷���Ī ��� ����. ���̺� �÷����� ����� �� ����.
	HAVING sum(QUANTITY) >=3 ORDER BY cnt;

SELECT PCode , count(*) cnt , sum(quantity) total 
	FROM TBL_BUY tb 
	WHERE BUY_DATE  >= '2021-04-01'
	GROUP BY pcode
	ORDER BY cnt;
-- day2 test����
--����Լ� : count, avg, max, min, sum - ����Լ��� �׷��Լ���� ��
	-- �ش� �Լ� ������� ���ϱ� ���� Ư�� �÷� �������� ���� �����͸� �׷�ȭ �� �� ����.

SELECT  count(*) FROM EMPLOYEES e ;-- ���̺� ��ü ������ ����107
SELECT max(SAlary) FROM EMPLOYEES e ;-- salary �÷��� �ִ밪24000
SELECT min(SAlary) FROM EMPLOYEES e ;-- salary �÷��� �ּҰ� 2100
SELECT avg(SAlary) FROM EMPLOYEES e ;-- salary �÷��� ��հ� 6461.83...
SELECT sum(SAlary) FROM EMPLOYEES e ;-- salary �÷��� ��հ� 691416

-- �� 5�� ����Լ��� job_ID = 'it_PROG' ���� ���ǽ����� �Ȱ��� �����ϱ�
SELECT count(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';--5
SELECT max(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';--9000
SELECT min(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';--4200
SELECT avg(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';--5760
SELECT sum(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';--28800

-- ����Լ� ����� �ٸ� �÷����� ���� ��ȸ �Ұ�(�׷��Լ��̱� ����)
SELECT Job_id, count(*) FROM EMPLOYEES e WHERE JOB_ID = 'it_prog';-- ����: ���ϱ׷��� �׷��Լ��� �ƴ�

