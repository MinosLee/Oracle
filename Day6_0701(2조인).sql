-- 예제. custom_id 'mina012' 이 구매한 내용 조회 : pcode조회하고 pname은 알 수 없음.
SELECT pcode FROM TBL_BUY tb WHERE CUSTOM_ID = 'mina012';

-- 1. 서브쿼리 (select 안에 select를 사용.)
SELECT pname FROM TBL_PRODUCT tp -- 외부쿼리
WHERE PCODE = 					-- 조건식이 = 연산이므로 내부커리는 1개 행 결과여야 함.
(SELECT pcode FROM TBL_BUY tb WHERE custom_id = 'mina012'  --내부쿼리
AND buy_date= '2022-02-06');


SELECT  pname FROM TBL_PRODUCT tp 
WHERE pcode IN 				-- 조건식이 IN 연산이므로 내부쿼리는 여러개 행 결과가 가능
(SELECT pcode FROM TBL_BUY tb WHERE custom_id = 'mina012');

--내부 쿼리 테스트
SELECT pcode FROM TBL_BUY tb  whrere custom_id= 'mina012'	--내부쿼리
								AND BUY_DATE = '2022-02-06';
								
SELECT pcode FROM TBL_BUY tb WHERE CUSTOM_ID = 'mina012';

-- 서브쿼리 문제점 : 외부쿼리가 조건식을 모든 행에 대해 검사할때마다 내부쿼리가 실행되므로 처리속도에 문제가 생김.- 테이블의 조인연산 사용으로 효율증가

-- 2. SELECT 의 join : 둘 이상의 테이블(주로참조관계 테이블)을 연결하여 데이터를 조회하는 명령
-- 동등조인: 둘 이상의 테이블은 공통된 컬럼을 갖고 이 컬럼값이 '같다='를 이용하여 join함.
-- 형식1 : select~~from 테이블 1 a , 테이블 2 b where a 공통컬럼1=b. 공통컬럼1;

--예제를 위한 상품추가
INSERT INTO TBL_PRODUCT VALUES ('GALAXYS22','A1','갤럭시S22',555600);

-- join키워3드 없는 형식
SELECT * FROM TBL_PRODUCT tp , TBL_BUY tb WHERE tp.PCODE = tb.PCODE ; --동등조인

--조인 키워드를 쓰는 명령문 형식 2(ansi표준)
SELECT * FROM TBL_PRODUCT tp JOIN TBL_BUY tb ON tp.PCODE = tb.PCODE ;-- 동등조인. 조인컬럼으로 = 연산식 사용.

-- TBL_CUSTOM과 TBL_BUY테이블 조인
SELECT * FROM TBL_CUSTOM tc, TBL_BUY tb WHERE tc.custom_id = tb.CUSTOM_ID ;
SELECT * FROM TBL_CUSTOM tc JOIN TBL_BUY tb ON tc.custom_id = tb.CUSTOM_ID ;

-- 조인 한 결과에서 특정컬럼만 조회

SELECT tc.CUSTOM_ID, name, REG_DATE , pcode, quantity FROM TBL_CUSTOM tc, TBL_BUY tb WHERE tc.custom_id = tb.CUSTOM_ID AND tc.CUSTOM_ID = 'mina012' ;

-- mina012 가 구매한 상풍명 조회.
SELECT tp.pname FROM TBL_PRODUCT tp , TBL_BUY tb  WHERE tp.PCODE = tp.PCODE  AND custom_id= 'mina012';

SELECT tp.pname FROM TBL_PRODUCT tp JOIN TBL_BUY tb ON tp.PCODE = tb.PCODE AND custom_id= 'mina012';

SELECT tp.pname FROM TBL_PRODUCT tp JOIN TBL_BUY tb ON tp.PCODE = tb.PCODE AND custom_id= 'mina012' AND buy_date = '2022-02-06';

-- mina 012가 구매한 상품명과 가격조회
SELECT  tp.pname, tp.price FROM TBL_PRODUCT tp , TBL_BUY tb  WHERE tp.PCODE= tb.PCODE AND custom_id= 'mina012';

-- 조인할 때 이름이 같은 컬럼은 테이블 명을 반드시 지정해야 함.

-- 3개의 테이블 조인이 가능한가?
SELECT * FROM TBL_PRODUCT tp ,
(SELECT tc.custom_id cusid, name, email, age, reg_date, pcode, quantity, buy_date, buyno 
	FROM TBL_CUSTOM tc , TBL_BUY tb 
	WHERE tc.CUSTOM_ID = tb.CUSTOM_ID ) temp--첫번쨰 조인
	WHERE tp.PCODE = temp.pcode ; --두번째 조인

SELECT * FROM TBL_BUY tb , TBL_CUSTOM tc , TBL_PRODUCT tp WHERE tc.CUSTOM_ID = tb.CUSTOM_ID AND tp.PCODE  = tb.PCODE ;
	

-- 특정컬럼만 조회
SELECT tb.CUSTOM_ID , tb.PCODE , name, age, pname, QUANTITY, BUY_DATE 
	FROM TBL_BUY tb ,TBL_CUSTOM tc ,TBL_PRODUCT tp 
	WHERE tc.CUSTOM_ID = tb.CUSTOM_ID AND tp.PCODE = tb.PCODE ;

-- 3. 외부조인(outer join): 연산을 사용하는 조인이나 한쪽에 없는 값도 조인결과로 포함.

-- join키워드 없는 형식
SELECT * FROM TBL_PRODUCT tp , TBL_BUY tb -- 조인할 테이블 2개
		WHERE tp.PCODE = tb.PCODE(+) ; -- 외부조인 tbl_buy 테이블에 일치하는 pcode값이 없어도 포함시키고 조인.
										-- 조인했을 때 null이 되는 테이블의 컬럼에 (+) 기호

--조인 키워드를 쓰는 명령문 형식 2(ansi표준)
SELECT * FROM TBL_PRODUCT tp LEFT OUTER JOIN TBL_BUY tb ON tp.PCODE = tb.PCODE ;-- tbl_product가 왼쪽테이블이며 그 값을 모두 포함하여 조인.


SELECT * FROM TBL_BUY tb RIGHT OUTER JOIN TBL_PRODUCT tp ON tb.PCODE = tp.PCODE ;


