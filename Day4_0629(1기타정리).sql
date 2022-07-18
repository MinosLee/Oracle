-- DDL: create, alter, drop, TRUNCATE 
-- 대상은 user table sequence view .. 단 truncate 는 테이블만 사용
-- DML : insert update delete

DROP TABLE students; -- 얘를 먼저 지우려고하면 안됨.  
						-- 외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다.
DROP TABLE scores;

--UPDATE 테이블명 SET 컬럼명 = 값,컬럼명 = 값,컬럼명 = 값,컬럼명 = 값,...WHERE 조건컬럼관계식 
-- delete from 테이블명 where 조건컬럼관계식
-- 주의할 점 UPDATE 와 delete는 where없이 사용하면 위험함.
-- truncate는 실행을 취소(rollback)할 수 없기 때문에 DDL에 속함

SELECT * FROM STUDENTS s ;
-- UPDATE delete select 에서 where의 컬럼이 기본기 컬럼이면 실행되는 것은 몇개일까요? 최대 1개
-- 기본키의 목적은 테이블의 여러 행을 구분하는 역할(식별)
UPDATE STUDENTS SET AGE = 17 WHERE std1 = 2021001;

--rollback테스트 (데이터베이스 메뉴에서 트랜젝션 모드를 manual로 변경)
UPDATE STUDENTS SET ADR  = '성북구', AGE = 16 WHERE STD1 = 2021001;
ROLLBACK; -- 위의 업데이트 실행을 취소함
UPDATE STUDENTS SET ADR  = '성북구', AGE = 16 WHERE STD1 = 2021001;
COMMIT;
ROLLBACK;--이미 커밋된 명령어는 롤백 불가.
-----------------------------------------
--트랜잭션 관리 명령 : rollback, commit
DELETE FROM SCORES s ;
SELECT * FROM SCORES s ;
ROLLBACK;
SELECT * FROM SCORES s ;
DELETE FROM SCORES s WHERE STD1 = 2019019;
SELECT *FROM SCORES s ;
-- 이 편집기는 트랜잭션 수동모드이고 같은 창에서 SELECT 결과 2019019가 없음.
-- 다른 편집기는 다른 클라이언트이므로 이전상태(최종커밋한 상태)로 보여짐.
ROLLBACK;
SELECT * FROM SCORES s ;

--------------
TRUNCATE TABLE SCORES ; --모든 데이터를 지움. rollback여부 확인?
						--롤백 불가.
-- 모든 데이터를 지울것이 확실하면 다른것들과 섞여 롤백되지 않게 확실히 TRUNCATE 하면 좋음.
-------------------------------------

/*
INSERT 
DELETE 
COMMIT
UPDATE
DELETE
ROLLBACK
INSERT
INSERT
ROLLBACK
INSERT
UPDATE
COMMIT
*/