
-- 고객 테이블
CREATE TABLE tbl_custom(
	custom_id varchar2(20) PRIMARY KEY,
	name nvarchar2(20) NOT NULL,
	email varchar2(20),
	age number(3),
	reg_date date DEFAULT sysdate
);

INSERT INTO tbl_custom VALUES ('mina012','김미나','kimm@gmail.com',20,to_date('2022-03-10 14:23:25','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_custom VALUES ('hongGD','홍길동','gil@korea.com',32,to_date('2021-10-21 00:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_custom VALUES ('twice','박모모','momo@daum.net',29,to_date('2021-12-25 00:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_custom VALUES ('wonder','이나나','lee@naver.com',40,sysdate);


--상품 테이블
CREATE TABLE tbl_product(
	pcode varchar2(20) PRIMARY KEY,
	category char(2) NOT NULL,
	pname nvarchar2(20) NOT NULL,
	price number(9) NOT NULL
);

INSERT INTO tbl_product VALUES ('IPAD011', 'A1','아이패드10',880000);
INSERT INTO tbl_product VALUES ('DOWON123a', 'B1','동원참치선물세트',54000);
INSERT INTO tbl_product VALUES ('dk_143', 'A2','모션데스크',234500);



-- 구매 테이블
CREATE TABLE tbl_buy(
	custom_id varchar2(20) NOT NULL,
	pcode varchar2(20) NOT NULL,
	quantity number(5) NOT NULL,
	buy_date DATE DEFAULT sysdate,
	FOREIGN KEY (custom_id) REFERENCES tbl_custom,
	FOREIGN KEY (pcode) REFERENCES tbl_product
);

INSERT INTO tbl_buy VALUES ('mina012','IPAD011',1,to_date('2022-02-06 00:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_buy VALUES ('hongGD','IPAD011',2,to_date('2022-06-29 20:37:47','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_buy VALUES ('wonder','DOWON123a',3,to_date('2022-02-06 00:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO tbl_buy VALUES ('mina012','dk_143',1,sysdate);
INSERT INTO tbl_buy VALUES ('twice','DOWON123a',2,to_date('2022-02-09 08:49:55','yyyy-mm-dd hh24:mi:ss'));

ALTER TABLE tbl_buy ADD buyNo Number(8);

UPDATE tbl_buy SET buyNo  = 1001 WHERE CUSTOM_ID  = 'mina012' AND pcode = 'IPAD011';
UPDATE tbl_buy SET buyNo  = 1002 WHERE CUSTOM_ID  = 'hongGD';
UPDATE tbl_buy SET buyNo  = 1003 WHERE CUSTOM_ID  = 'wonder';
UPDATE tbl_buy SET buyNo  = 1004 WHERE CUSTOM_ID  = 'mina012' AND pcode = 'dk_143';
UPDATE tbl_buy SET buyNo  = 1005 WHERE CUSTOM_ID  = 'twice';


ALTER TABLE tbl_buy ADD PRIMARY KEY (buyNo);

CREATE SEQUENCE tblbuy_seq INCREMENT BY 1 START WITH 1006;

SELECT tblbuy_seq.nextval FROM dual;
SELECT tblbuy_seq.currval FROM dual;

INSERT INTO tbl_buy VALUES ('wonder','IPAD011',1,to_date('2022-05-15 00:00:00','yyyy-mm-dd hh24:mi:ss'),tblbuy_seq.currval);

SELECT * from tbl_custom WHERE age>=30;
SELECT email FROM tbl_custom WHERE CUSTOM_ID ='twice';
SELECT pname FROM tbl_product WHERE CATEGORY = 'A2';
SELECT max(price) FROM tbl_product;
SELECT sum(quantity) FROM tbl_buy WHERE pcode= 'IPAD011';
SELECT pcode FROM tbl_buy WHERE pcode LIKE '%0%';
SELECT pcode FROM tbl_buy WHERE pcode LIKE '%on%' OR pcode LIKE'%ON%';


