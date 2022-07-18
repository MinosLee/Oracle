-- 조인과 그룹바이 포함해서 select로 검색하는 문제를 10개 만들기
-- group by 결과로도 조인가능. 예: 부서인원이 가장 많은 부서는?
-- SELECT 문
-- [WHERE] 
-- GROUP BY 
-- [HAVING]
-- [ORDER BY]

-- 부서별 연봉 8000이 넘는 사람의 인원수
SELECT d.DEPARTMENT_NAME, count(e.salary)  FROM DEPARTMENTS d JOIN  EMPLOYEES e ON  e.MANAGER_ID = d.MANAGER_ID WHERE e.SALARY >=8000  GROUP BY d.DEPARTMENT_NAME  HAVING count(e.salary) > 0 ; 

-- 부서별 평균연봉은?
SELECT DEPARTMENT_Name , avg(salary)  FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID GROUP BY DEPARTMENT_Name HAVING avg(salary) > 0 ORDER BY AVG(SALARY) DESC ;

-- 부서별 최대연봉자의 연봉
SELECT DEPARTMENT_Name, max(salary)  FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID  GROUP BY DEPARTMENT_Name HAVING MAX(e.salary) > 0;

-- 부서별 인원수는?
SELECT DEPARTMENT_Name , count(EMPLOYEE_ID) cnt  FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID GROUP BY DEPARTMENT_Name ;

-- 부서별 2005년 이전 고용된 사람의 숫자는?
SELECT DEPARTMENT_Name , count(EMPLOYEE_ID) cnt  FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID WHERE e.HIRE_DATE <'2005-01-01' GROUP BY DEPARTMENT_Name ;

-- 부서별 핸드폰 번호에 5가 포함된 인원 수
SELECT DEPARTMENT_Name , count(EMPLOYEE_ID) cnt  FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID WHERE e.PHONE_NUMBER LIKE '%5%' GROUP BY DEPARTMENT_Name ;

-- 부서별 성에 A가 들어간 사람의 인원 수
SELECT DEPARTMENT_Name , count(EMPLOYEE_ID) cnt  FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID WHERE e.LAST_NAME  LIKE '%A%' GROUP BY DEPARTMENT_Name ;


-------------------join 문 응용
-- 고용일이 2006년 1월 이전인 사람들의 부서와 연봉이 고용일을 기준으로 순차적으로 알고싶을 때
SELECT e.HIRE_DATE, d.DEPARTMENT_NAME , e.SALARY  FROM DEPARTMENTS d JOIN EMPLOYEES e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID WHERE e.HIRE_DATE < '2006-01-01' ORDER BY e.HIRE_DATE ASC;


-- 오늘날까지 회사를 나간 사람의 날짜와 이름,핸드폰 번호가 알고 싶을 때.
SELECT jh.END_DATE , e.FIRST_NAME, e.LAST_NAME, e.PHONE_NUMBER FROM JOB_HISTORY jh JOIN EMPLOYEES e ON jh.EMPLOYEE_ID = e.EMPLOYEE_ID  WHERE jh.END_DATE <SYSDATE  ;


-- 대통령으로 일한 사람의 정보
SELECT j.JOB_TITLE, e.FIRST_NAME , e.LAST_NAME , e.PHONE_NUMBER FROM JOBS j JOIN EMPLOYEES e  ON j.JOB_ID = e.JOB_ID WHERE j.JOB_TITLE ='President';
