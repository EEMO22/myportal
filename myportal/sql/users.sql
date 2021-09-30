CREATE TABLE users (
	no number PRIMARY KEY,
    name varchar(20) NOT NULL,
    email varchar(128) UNIQUE NOT NULL,
    password varchar(20) NOT NULL,
    gender char(1) DEFAULT 'M' check (gender in ('M', 'F')),
    joindate date DEFAULT sysdate
);
​
CREATE SEQUENCE seq_users_pk
    START WITH 1 INCREMENT BY 1 NOCACHE;
    
-- 가입 쿼리

INSERT INTO users(no, name, password, email, gender)
VALUES(seq_users_pk.nextval, '리자', '1234', 'admin@example.com', 'M');

SELECT * FROM users;

rollback;