/*
1. hire_date�� 2006�� 1�� 1�� ������ ������ �̸�,��,�̸���

2. lastname�� 'Jones' �� ������ ��� �÷�

3. salary �� 5000 �̻��� ������ �̸�,��,JOB_ID ��ȸ

4. JOB_ID �� ACCOUNT �� ���� ������ �̸�,��,salary ��ȸ

5. �μ�_ID �� 50 ,60, 80,90 �� ������ ����_ID, �̸�,�� ��ȸ

*/


-- 1
SELECT FIRST_NAME , LAST_NAME , EMAIL  FROM EMPLOYEES WHERE HIRE_DATE  < '2006-01-01' ;

--2 

SELECT * FROM EMPLOYEES  WHERE LAST_NAME = 'jones'; -- ���ǽ��� 

--3

SELECT FIRST_NAME , LAST_NAME , JOB_ID  FROM EMPLOYEES WHERE SALARY >= 5000;

--4 

SELECT FIRST_NAME , LAST_NAME , SALARY FROM EMPLOYEES WHERE JOB_ID Like '%ACCOUNT%';

--5 

SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID IN(50,60,80,90);


SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 60;
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = '60';-- �÷� ���Ŀ� ���� number�� 

--����Լ� : count, avg, max, min- ����Լ��� �׷��Լ���� ��
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

-- ���: create tablem, INSERT into, select~where~ �⺻����

--����: ��Ī(alias). �÷� �Ǵ� ���̺� �̸��� �� �� ª�� �ٿ����� �̸�.
SELECT * FROM EMPLOYEES e ; --employees ���̺��� ��Ī e
SELECT * FROM DEPARTMENTS d ; --departments���̺��� ��Ī d



