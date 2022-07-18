
CREATE TABLE tbl_member(
	mno NUMBER,
	name nvarchar2(50),
	email varchar2(100),
	JOIN_date DATE	-- 날짜-년-월-일, 시간 : 시:분:초.밀리초
);
-- 모든 컬럼에 데이터를 저장하는 형식(컬럼명 생략), - 날짜는 date로 자동변환
INSERT INTO tbl_member VALUES (1, '김모모', 'momo@naver.com', '2022-03-02');
-- 일부 컬럼에 데이터를 저장하는 형식
INSERT INTO tbl_member(mno,name)-- 데이터 저장될 컬럼명 나열
VALUES (2, '이나나');
-----------------------------------------------------
-- 2. dml SELECT (데이터 행 row 조회)
-- select 조회할 컬럼 목록 from 테이블 이름[where 조건식]; 모든 컬럼은 *로 대체
SELECT name FROM TBL_MEMBER;
SELECT name, join_date FROM tbl_member;
SELECT * FROM TBL_MEMBER ;
SELECT * FROM TBL_MEMBER WHERE name= '최다현'; -- 조건식은 
SELECT * FROM TBL_MEMBER tm WHERE mno > 2;
SELECT * FROM TBL_MEMBER tm WHERE JOIN_DATE  > '2022-03-03';
SELECT name, EMAIL FROM TBL_MEMBER tm WHERE JOIN_DATE  > '2022-03-03';
--null값 조회
SELECT * FROM TBL_MEMBER tm WHERE EMAIL IS NULL ; 
SELECT * FROM TBL_MEMBER tm WHERE EMAIL IS NOT NULL ; 
-- 문자열의 부분검색: like연산
SELECT * FROM TBL_MEMBER WHERE name LIKE '%다현';
SELECT * FROM TBL_MEMBER WHERE name LIKE '다현%';
SELECT * FROM TBL_MEMBER WHERE name LIKE '%다현%';

--or 연산 : mno값이 1또는 2또는 4
SELECT * FROM TBL_MEMBER tm WHERE mno = 1 OR mno= 2 OR mno= 4;

-- 오라클의 or 대체 연산자 : in*동일걸럼에 대한 조건식일 때
SELECT * FROM TBL_MEMBER tm WHERE mno in(1,2,4);
SELECT * FROM TBL_MEMBER tm WHERE mno NOT in(1,2,4);
SELECT * FROM TBL_MEMBER tm WHERE name in('김모모','최다현');


----------------------------------------------------
-- 처음 만든 테이블 구조 중 mno컬럼을 정밀도 5로 축소변경을 원한다면
-- mno컬럼의 값이 없어야함

INSERT INTO TBL_MEMBER VALUES (3, '최다현', 'dahy@naver.com', '2022-03-04 16:47'); --오류

-- 오라클의 to_date 함수는 문자열을 날짜형식으로 변환(두번째 인자는 패턴)
INSERT INTO TBL_MEMBER VALUES (3, '최다현', 'dahy@naver.com', to_date('2022-03-04 16:47','yyyy-mm-dd hh24:mi'));

-- to_char 함수: 날짜형식에서 문자열로 변경합니다. 두번째 인자는 패턴-> 년도 또는 일부 값만 추출에 활용.
SELECT to_char(JOIN_date, 'yyyy') FROM TBL_MEMBER;

--현재 시스템의 날짜와 시간: sysdate함수
INSERT INTO TBL_MEMBER VALUES (4, '쯔위', 'aaa@naver.com', sysdate);

SELECT * FROM tbl_member;