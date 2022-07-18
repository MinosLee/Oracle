-- 데이터 타입 number연습테이블
-- number : 자바에서 정수, 실수 타입에 해당
-- 			number(정밀도, 소수점 이하 자리수)

--이미 있는 테이블 제거: 꼭 필요할때만 주의해서 제거
DROP TABLE TBL_NUMBER ;

--샘플 데이터 만들기
CREATE TABLE tbl_number(
	col1 NUMBER,		--정밀도 지정안하면 최대 38자리
	col2 number(5),		-- 정수로 5자리
	col3 number(7,2),	-- 전체 7자리수, 소숫점 이하 2자리
	col4 number(2,5)	-- 소수점 이하 5자리, 유효숫자 2자리
);
-- 유효숫자: 123을 쓸 때 12300 or 00123 첫번쨰 00은 유효값 두번쨰의 00은 불필요한 값

--정상 실행값 테스트 1
INSERT INTO tbl_number values(1234567,12345,12345.67,0.00012);

-- 오류테스트 1: col2값 자리수 초과
INSERT INTO tbl_number values(123456789,123456,12345.67,0.00012);

--정상 테스트2 - col3값 소수이하 자리수 초과? - 반올림해서 소수 2자리까지만
INSERT INTO tbl_number values(123456789,1234,12345.6789,0.00012);

--오류테스트 2: col3 전체차리수 (정밀도) 초과
INSERT INTO tbl_number values(123456789,1234,123456.6789,0.00012);

-- 정상테스트 3
INSERT INTO tbl_number values(123456789,1234,12345,0.00012);

--오류테스트 3: col3필드 전체자리수 초과(소수점 00이하 .00)
INSERT INTO tbl_number values(123456789,1234,123456,0.00012);

-- col4 number(2,5)- 소수점 이하 5자리 고정, 0 아닌 유효숫자 최대 2자리
--정상테스트4
INSERT INTO tbl_number values(123456789,1234,12345,0.00002);

--1)
INSERT INTO tbl_number values(123456789,1234,12345,0.0002);

--2)
INSERT INTO tbl_number values(123456789,1234,12345,0.000126);

--3)
INSERT INTO tbl_number values(123456789,1234,12345,0.0012);

--4)
INSERT INTO tbl_number values(123456789,1234,12345,0);



-- 위의 4가지 예시 결론 : number(2,5) 에서 정밀도 <소수점 이하 자릿수, 2-5=-3 소숫점 이하유효 0이 3개 이상이어야 함.




