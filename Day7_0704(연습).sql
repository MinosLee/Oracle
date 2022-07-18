
-- 1�ܰ� ����� �׷��Լ� ����
SELECT department_id, avg(salary) FROM EMPLOYEES e GROUP BY DEPARTMENT_ID ;

--2�ܰ� �����ϱ�

SELECT * FROM DEPARTMENTS d JOIN (SELECT DEPARTMENT_ID, AVG(Salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
ON d.DEPARTMENT_ID = tavg.department_id;


--3�ܰ� �÷�����
SELECT d.department_id, d.department_name , round(tavg.cavg,1) "��ձ޿�" FROM DEPARTMENTS d 
JOIN (SELECT DEPARTMENT_ID, AVG(Salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
ON d.DEPARTMENT_ID = tavg.department_id ORDER BY tavg.cavg DESC;

-- 4�ܰ� : ������ ����� Ư�� ��ġ ����: first n�� ���� n�� ��ȸ
SELECT d.department_id , d.department_name, round(tavg.cavg,1) FROM DEPARTMENTS d 
JOIN (SELECT DEPARTMENT_ID, AVG(Salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID)tavg
ON d.DEPARTMENT_ID = tavg.DEPARTMENT_ID ORDER BY tavg.cavg DESC FETCH FIRST 1 ROWS ONLY;

-- �ٸ�����
SELECT d.DEPARTMENT_ID did, d.DEPARTMENT_NAME e.cnt FROM DEPARTMENTS d 
JOIN (SELECT DEPARTMENT_ID, count (*) cnt FROM EMPLOYEES GROUP BY DEPARTMENT_ID ) e
ON d.DEPARTMENT_ID = e.department_id ORDER BY cnt DESC FETCH FIRST 1 ROW ONLY;

-- ����Ŭ�� rownum�� ������ �÷����� ��ȸ�� ����� ���������� ����Ŭ�� �ο��ϴ� ��.
-- ���� �÷��� ����� ���� join�� �ѹ� �� �ʿ�.

SELECT rownum, tcnt.* FROM (SELECT department_id, count(*) cnt FROM EMPLOYEES GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt
WHERE rownum<5;

SELECT rownum, tcnt.* FROM (SELECT department_id, count(*) cnt FROM EMPLOYEES GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt
WHERE rownum=1;

-- ROWNUM �� ����� �� ���Ȯ���� �ȵǴ� ����: rownum 1���� �����ؼ� ã�ư� �� �ִ� ���ǽĸ� ����.
-- where ROWNUM =3;
-- where ROWNUM >5;
-- �׷��� �ѹ� �� ROWNUM �� ������ ��ȸ����� select��. �̶� rownum�� ��Ī�ο�.

SELECT * FROM (SELECT rownum rn, tcnt.* FROM (SELECT department_id , count(*) cnt FROM EMPLOYEES
GROUP BY department_id ORDER BY cnt DESC)tcnt) WHERE rn BETWEEN 5 AND 9

-- where rn = 3