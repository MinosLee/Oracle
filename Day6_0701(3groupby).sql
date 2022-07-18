
-- 주제: 행을 그룹화하고 그룹함수를 사용한다. 사용하는 순서는 아래와 같음. []안에 있는 것은 쓸 수도 있고 안 쓸 수도 있음.
-- SELECT 문
-- [WHERE] 
-- GROUP BY 
-- [HAVING]
-- [ORDER BY]
 
SELECT count (*) FROM TBL_BUY tb  GROUP BY PCODE ;

SELECT pcode, COUNT(*), sum(quantity) FROM TBL_BUY tb GROUP BY pcode ORDER BY 2;-- 조회된 컬럼의 위치

SELECT pcode , count(*) cnt, sum(quantity) total FROM TBL_BUY tb GROUP BY pcode ORDER BY cnt;-- 그룹함수 결과의 별칭

-- 그룹화 후에 수량합계가 3이상만 조회
SELECT PCode , count(*) cnt , sum(quantity) total 
	FROM TBL_BUY tb 
	GROUP BY pcode --HAVING total>= 3 -- 헤빙에는 컬럼별칭 사용 못함. 테이블 컬럼명은 사용할 수 있음.
	HAVING sum(QUANTITY) >=3 ORDER BY cnt;

SELECT PCode , count(*) cnt , sum(quantity) total 
	FROM TBL_BUY tb 
	WHERE BUY_DATE  >= '2021-04-01'
	GROUP BY pcode
	ORDER BY cnt;
-- day2 test참고
--통계함수 : count, avg, max, min, sum - 통계함수는 그룹함수라고도 함
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

