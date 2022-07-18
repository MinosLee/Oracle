-- ���ΰ� �׷���� �����ؼ� select�� �˻��ϴ� ������ 10�� �����
-- group by ����ε� ���ΰ���. ��: �μ��ο��� ���� ���� �μ���?
-- SELECT ��
-- [WHERE] 
-- GROUP BY 
-- [HAVING]
-- [ORDER BY]

-- �μ��� ���� 8000�� �Ѵ� ����� �ο���
SELECT d.DEPARTMENT_NAME, count(e.salary)  FROM DEPARTMENTS d JOIN  EMPLOYEES e ON  e.MANAGER_ID = d.MANAGER_ID WHERE e.SALARY >=8000  GROUP BY d.DEPARTMENT_NAME  HAVING count(e.salary) > 0 ; 

-- �μ��� ��տ�����?
SELECT DEPARTMENT_Name , avg(salary)  FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID GROUP BY DEPARTMENT_Name HAVING avg(salary) > 0 ORDER BY AVG(SALARY) DESC ;

-- �μ��� �ִ뿬������ ����
SELECT DEPARTMENT_Name, max(salary)  FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID  GROUP BY DEPARTMENT_Name HAVING MAX(e.salary) > 0;

-- �μ��� �ο�����?
SELECT DEPARTMENT_Name , count(EMPLOYEE_ID) cnt  FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID GROUP BY DEPARTMENT_Name ;

-- �μ��� 2005�� ���� ���� ����� ���ڴ�?
SELECT DEPARTMENT_Name , count(EMPLOYEE_ID) cnt  FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID WHERE e.HIRE_DATE <'2005-01-01' GROUP BY DEPARTMENT_Name ;

-- �μ��� �ڵ��� ��ȣ�� 5�� ���Ե� �ο� ��
SELECT DEPARTMENT_Name , count(EMPLOYEE_ID) cnt  FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID WHERE e.PHONE_NUMBER LIKE '%5%' GROUP BY DEPARTMENT_Name ;

-- �μ��� ���� A�� �� ����� �ο� ��
SELECT DEPARTMENT_Name , count(EMPLOYEE_ID) cnt  FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID WHERE e.LAST_NAME  LIKE '%A%' GROUP BY DEPARTMENT_Name ;


-------------------join �� ����
-- ������� 2006�� 1�� ������ ������� �μ��� ������ ������� �������� ���������� �˰���� ��
SELECT e.HIRE_DATE, d.DEPARTMENT_NAME , e.SALARY  FROM DEPARTMENTS d JOIN EMPLOYEES e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID WHERE e.HIRE_DATE < '2006-01-01' ORDER BY e.HIRE_DATE ASC;


-- ���ó����� ȸ�縦 ���� ����� ��¥�� �̸�,�ڵ��� ��ȣ�� �˰� ���� ��.
SELECT jh.END_DATE , e.FIRST_NAME, e.LAST_NAME, e.PHONE_NUMBER FROM JOB_HISTORY jh JOIN EMPLOYEES e ON jh.EMPLOYEE_ID = e.EMPLOYEE_ID  WHERE jh.END_DATE <SYSDATE  ;


-- ��������� ���� ����� ����
SELECT j.JOB_TITLE, e.FIRST_NAME , e.LAST_NAME , e.PHONE_NUMBER FROM JOBS j JOIN EMPLOYEES e  ON j.JOB_ID = e.JOB_ID WHERE j.JOB_TITLE ='President';
