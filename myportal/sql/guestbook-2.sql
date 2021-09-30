SELECT no,
    name,
    password,
    content,
    regdate as regDate
FROM guestbook
ORDER BY regdate DESC;

	
INSERT INTO guestbook
(no, name, password, content)
VALUES (seq_guestbook_no.nextval, '홍길동', '1234', '왔다 갑니다');

SELECT * FROM guestbook;

DELETE FROM guestbook
WHERE no=3 AND password='1234';

rollback;
	