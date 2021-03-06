CREATE TABLE board (
	no number PRIMARY KEY,
    title varchar2(128) NOT NULL,
    content varchar2(255) NOT NULL,
    hit number DEFAULT 0,
    reg_date date DEFAULT sysdate,
    user_no number NOT NULL
);

CREATE SEQUENCE seq_board_pk
    START WITH 1
    INCREMENT BY 1;
    
    SELECT * FROM board;

SELECT * FROM users WHERE no=2;

--  게시물 리스트 쿼리
SELECT 
    b.no,
    title,
    content,
    hit,
    reg_date as regDate,
    user_no as userNo,
    name as userName
FROM board b, users u
WHERE b.user_no = u.no;

--  게시물 조회
SELECT 
    no,
    title,
    content,
    reg_date as regDate,
    user_no as userNo
FROM board 
WHERE no = 1;

-- 조회 수 증가

UPDATE board
    SET
        hit = hit + 1
WHERE no = 1;

SELECT * FROM board;
rollback;

--  게시물 업데이트

UPDATE board
    SET
        title = '테스트',
        content = '해봅시다'
WHERE no = 21;
rollback;       

-- 게시물 삭제
DELETE FROM board
WHERE no = 21;