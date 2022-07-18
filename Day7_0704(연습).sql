
-- 1단계 사용할 그룹함수 실행
SELECT department_id, avg(salary) FROM EMPLOYEES e GROUP BY DEPARTMENT_ID ;

--2단계 조인하기

SELECT * FROM DEPARTMENTS d JOIN (SELECT DEPARTMENT_ID, AVG(Salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
ON d.DEPARTMENT_ID = tavg.department_id;


--3단계 컬럼지정
SELECT d.department_id, d.department_name , round(tavg.cavg,1) "평균급여" FROM DEPARTMENTS d 
JOIN (SELECT DEPARTMENT_ID, AVG(Salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
ON d.DEPARTMENT_ID = tavg.department_id ORDER BY tavg.cavg DESC;

-- 4단계 : 정렬한 결과로 특정 위치 지정: first n은 상위 n개 조회
SELECT d.department_id , d.department_name, round(tavg.cavg,1) FROM DEPARTMENTS d 
JOIN (SELECT DEPARTMENT_ID, AVG(Salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID)tavg
ON d.DEPARTMENT_ID = tavg.DEPARTMENT_ID ORDER BY tavg.cavg DESC FETCH FIRST 1 ROWS ONLY;

-- 다른예시
SELECT d.DEPARTMENT_ID did, d.DEPARTMENT_NAME e.cnt FROM DEPARTMENTS d 
JOIN (SELECT DEPARTMENT_ID, count (*) cnt FROM EMPLOYEES GROUP BY DEPARTMENT_ID ) e
ON d.DEPARTMENT_ID = e.department_id ORDER BY cnt DESC FETCH FIRST 1 ROW ONLY;

-- 오라클의 rownum은 가상의 컬럼으로 조회된 결과에 순차적으로 오라클을 부여하는 값.
-- 가상 컬럼의 사용을 위해 join이 한번 더 필요.

SELECT rownum, tcnt.* FROM (SELECT department_id, count(*) cnt FROM EMPLOYEES GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt
WHERE rownum<5;

SELECT rownum, tcnt.* FROM (SELECT department_id, count(*) cnt FROM EMPLOYEES GROUP BY DEPARTMENT_ID ORDER BY cnt DESC ) tcnt
WHERE rownum=1;

-- ROWNUM 을 사용할 때 결과확인이 안되는 예시: rownum 1부터 시작해서 찾아갈 수 있는 조건식만 가능.
-- where ROWNUM =3;
-- where ROWNUM >5;
-- 그래서 한번 더 ROWNUM 을 포함한 조회결과로 select함. 이때 rownum은 별칭부여.

SELECT * FROM (SELECT rownum rn, tcnt.* FROM (SELECT department_id , count(*) cnt FROM EMPLOYEES
GROUP BY department_id ORDER BY cnt DESC)tcnt) WHERE rn BETWEEN 5 AND 9

-- where rn = 3