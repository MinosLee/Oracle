
CREATE TABLE students (
	std1 char(7) PRIMARY KEY,
	nam varchar(10) NOT NULL,
	age NUMBER(2),
	adr varchar(10)
);

INSERT INTO students VALUES ('2021001','김모모',16,'서초구');
INSERT INTO students VALUES ('2019019','강다현',18,'강남구');


CREATE TABLE scores (
	std1 char(7) ,
	sbj varchar(6) ,
	sco NUMBER(3) NOT NULL,
	tch varchar(10) NOT NULL,
	ssn char(6) NOT NULL,
	PRIMARY key(std1, sbj),
	FOREIGN KEY (std1) REFERENCES students
	-- 외래키 설정 REFERENCES(참조) 키워드 뒤에 참조 테이블(참조컬럼)
	-- (참조컬럼) 이름이 참조 테이블과 외래테이블 둘 모두 같은 경우 (참조컬럼)생략가능.
	-- 외래키 컬럼은 FOREIGN KEY 키워드 뒤에 ()안에 작성.
	-- 참조컬럼의 조건- 기본키 또는 unique 제약조건 컬럼만 가능
);

CREATE TABLE scores (
	std1 char(7) ,
	sbj varchar(6) ,
	sco NUMBER(3) NOT NULL,
	tch varchar(10) NOT NULL,
	ssn char(6) NOT NULL,
);

--alter table ~add constraint
ALTER TABLE scores ADD CONSTRAINT pk_scores PRIMARY KEY (std1,sbj);
ALTER TABLE scores ADD CONSTRAINT fk_scores FOREIGN KEY (std1) REFERENCES students(std1);
	

INSERT INTO scores VALUES (2021001,'국어',89,'이나연','2022_1');
INSERT INTO scores VALUES (2021001,'영어',78,'김길동','2022_1');
INSERT INTO scores VALUES (2021001,'과학',67,'박세리','2021_2');
INSERT INTO scores VALUES (2019019,'국어',92,'이나연','2019_2');
INSERT INTO scores VALUES (2019019,'영어',85,'박지성','2019_2');
INSERT INTO scores VALUES (2019019,'과학',88,'박세리','2020_1');
SELECT * FROM scores;