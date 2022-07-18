/*
1. hire_date가 2006년 1월 1일 이전인 직원의 이름,성,이메일

2. lastname이 'Jones' 인 직원의 모든 컬럼

3. salary 가 5000 이상인 직원의 이름,성,JOB_ID 조회

4. JOB_ID 에 ACCOUNT 가 들어가는 직원의 이름,성,salary 조회

5. 부서_ID 가 50 ,60, 80,90 인 직원의 직원_ID, 이름,성 조회

*/


-- 1
SELECT FIRST_NAME , LAST_NAME , EMAIL  FROM EMPLOYEES WHERE HIRE_DATE  < '2006-01-01' ;

--2 

SELECT * FROM EMPLOYEES  WHERE LAST_NAME = 'jones'; -- 조건식은 

--3

SELECT FIRST_NAME , LAST_NAME , JOB_ID  FROM EMPLOYEES WHERE SALARY >= 5000;

--4 

SELECT FIRST_NAME , LAST_NAME , SALARY FROM EMPLOYEES WHERE JOB_ID Like '%ACCOUNT%';

--5 

SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID IN(50,60,80,90);


SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 60;
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = '60';-- 컬럼 형식에 따라 number로 

--통계함수 : count, avg, max, min- 통계함수는 그룹함수라고도 함
	-- 해당 함수 결과값을 구하기 위해 특정 컬럼 사용햐ㅐ서 여러 데이터를 그룹화 한 후 실행.

SELECT  count(*) FROM EMPLOYEES e ;-- 테이블 전체 데이터 갯수107
SELECT max(SAlary) FROM EMPLOYEES e ;-- salary 컬럼의 최대값24000
SELECT min(SAlary) FROM EMPLOYEES e ;-- salary 컬럼의 최소값 2100
SELECT avg(SAlary) FROM EMPLOYEES e ;-- salary 컬럼의 평균값 6461.83...
SELECT sum(SAlary) FROM EMPLOYEES e ;-- salary 컬럼의 평균값 691416

-- 위 5개 통계함수를 job_ID = 'it_PROG' 값을 조건식으로 똑같이 실행하기
SELECT count(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';--5
SELECT max(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';--9000
SELECT min(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';--4200
SELECT avg(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';--5760
SELECT sum(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';--28800

-- 통계함수 결과는 다른 컬럼값과 같이 조회 불가(그룹함수이기 때문)
SELECT Job_id, count(*) FROM EMPLOYEES e WHERE JOB_ID = 'it_prog';-- 오류: 단일그룹의 그룹함수가 아님

-- 요약: create tablem, INSERT into, select~where~ 기본형식

--참고: 별칭(alias). 컬럼 또는 테이블 이름이 길 때 짧게 줄여쓰는 이름.
SELECT * FROM EMPLOYEES e ; --employees 테이블의 별칭 e
SELECT * FROM DEPARTMENTS d ; --departments테이블의 별칭 d



