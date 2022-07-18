

-- 제약조건 설정은 create table, alter table에서 함.

--제약조건 1 : not null-- 반드시 값을 저장해야 한다는 뜻
CREATE TABLE tbl#(
	col1 varchar2(10),
	col2 number(3) NOT NULL 
);

INSERT INTO tbl#(col2) VALUES(98);
INSERT INTO tbl#(col1) VALUES('korean'); --오류: col2컬럼의 NOT NULL 제약조건 위반
INSERT INTO tbl# VALUES ('korean',78);
INSERT INTO tbl# VALUES ('korean',88);

--확인
SELECT * FROM tbl#;

--새로운 제약조건 2) unique 를 갖는 col3

ALTER TABLE tbl# ADD col3 varchar2(10) UNIQUE; -- 유일한 값이어야 함.

--다음 insert 중 오류가 발생하는 것은?

INSERT INTO tbl#(col1) VALUES('english');-- 오류
INSERT INTO tbl#(col2) VALUES(77);
INSERT INTO tbl#(col3) VALUES('english');-- 오류
INSERT INTO tbl#(col1,col2) VALUES('english',88);
INSERT INTO tbl#(col2,col3) VALUES(88,'science');
INSERT INTO tbl#(col1,col3) VALUES('science',88);-- 오류
INSERT INTO tbl#(col1,col2,col3) VALUES('english',89,'science');--오류 - science는 col3의 unique값으로 위에서 science로 정의했기에 다시 science로 정의하는 것은 불가능함.
INSERT INTO tbl#(col1,col2,col3) VALUES('english',89,'math');
-- 체크사항 : unique컬럼엔 null허용 가능.

--제약조건 3) 기본키(primary key)는 not null과 unique제약조건.

CREATE TABLE tbl2#(
	tno number(3) PRIMARY KEY,
	tid number(3) UNIQUE
);

INSERT INTO tbl2#(tno) VALUES (123);
SELECT * FROM tbl2#;
--무결성 제약조건(pk기본키 컬럼은 유일한 값이면서 not null입니다. )에 위배됩니다.
INSERT INTO tbl2#(tno) VALUES (123); --UNIQUE
INSERT INTO tbl2#(tid) VALUES (123); -- not null

-- 제약조건 4) check :컬럼값의 범위를 설정 -> age 컬러값은 16~80
ALTER TABLE TBL2# ADD age number(3) CHECK (age BETWEEN 16 AND 80);
INSERT INTO TBL2#(tno, tid, age) VALUES (222, 123, 20);
INSERT INTO TBL2#(tno, tid, age) VALUES (222, 124, 90);	--오류: 체크제약조건 위배

-- 성별(gender)컬럼 추가
ALTER TABLE "TBL2#" ADD gender char(1) CHECK (gender IN ('M','F'));
INSERT INTO "TBL2#"(tno, GENDER) VALUES (224, 'F');
INSERT INTO "TBL2#"(tno, GENDER) VALUES (225, 'M');
INSERT INTO "TBL2#"(tno, GENDER) VALUES (226, 'm'); -- 오류: check제약조건 위반 소문자 m

-- 성별(gender)컬럼 수정
ALTER TABLE "TBL2#" MODIFY gender char(1) CHECK (gender IN ('M','F','m','f')); -- 현재 젠더컬럼의 제약조건만 변경하는 경우엔 이게 아닌 다른 명령어 사용필요.
-- 성별 칼럼의 제약조건 변경은 삭제(drop) 후 추가(add)해야 함.
ALTER TABLE "TBL2#" DROP CONSTRAINTS tbl2_CHK_GENDER;
ALTER TABLE "TBL2#" ADD CONSTRAINTS tbl2_CHK_GENDER2 CHECK (gender IN ('M','F','m','f'));

INSERT INTO "TBL2#"(tno, GENDER) VALUES (226, 'm'); --오류 
INSERT INTO "TBL2#"(tno, GENDER) VALUES (227, 'f');  

