-- view : ���� ���̺�(���������� �������� �ʰ� ���������� ������� ���̺�)
--          �� �������� ���̺��� �̿��ؼ� �����մϴ�.
--			�� �����(������)�� ���̺�ó�� select �� ��ȸ�� �Ҽ� �ִ� ���̺�
--			�� grant resource,connect to idev;   -> resource �� view ������ �����Դϴ�.


CREATE VIEW v_dept
AS SELECT d.DEPARTMENT_ID , DEPARTMENT_NAME , e.EMPLOYEE_ID , e.FIRST_NAME , e.HIRE_DATE , e.JOB_ID 
FROM DEPARTMENTS d , EMPLOYEES e 
WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID ;

SELECT * FROM v_dept WHERE job_id = 'ST_CLERK';
