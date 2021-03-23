CREATE DATABASE chacarge;
USE chacarge;

CREATE TABLE `User` (
 `user_seq` int NOT NULL primary key auto_increment,
 `user_id` varchar(15) NOT NULL,
 `user_password` varchar(100) NOT NULL,
 `user_email` varchar(30) NOT NULL,
 `user_name` varchar(15) NOT NULL,
 `user_join_date` datetime NOT NULL DEFAULT DATE_FORMAT(now(), '%Y-%m-%d'), -- now() 로 변경
 `user_grade` varchar(1) NOT NULL DEFAULT 1,
 `user_token` varchar(15) NULL DEFAULT NULL,
 `user_session_key` varchar(50) NOT NULL DEFAULT 'none',
 `user_session_limit` TIMESTAMP
);

CREATE TABLE `board` (
 `board_seq` int NOT NULL primary key auto_increment,
 `board_subject` varchar(30) NOT NULL,
 `board_content` varchar(3000) NOT NULL,
 `board_hit` int NOT NULL,
 `board_wdate` datetime NOT NULL,
 `user_seq` int NOT NULL
);

CREATE TABLE `visitor` (
 `visit_seq` int NOT NULL primary key auto_increment,
 `visit_date` datetime NOT NULL,
 `user_seq` int NOT NULL
);

CREATE TABLE `board_comment` (
 `comment_seq` int NOT NULL primary key auto_increment,
 `comment_content` varchar(500) NOT NULL,
 `comment_wdate` datetime NOT NULL,
 `user_seq` int NOT NULL,
 `board_seq` int NOT NULL
);

CREATE TABLE `board_picture` (
 `board_pic_seq` int NOT NULL primary key auto_increment,
 `board_pic_path` varchar(100) NOT NULL,
 `board_seq` int NOT NULL
);

CREATE TABLE `car_data` (
 `car_seq` int NOT NULL primary key auto_increment,
 `car_name` varchar(20) NOT NULL,
 `car_price` int NOT NULL,
 `car_year` int NOT NULL,
 `car_picture` varchar(50) NOT NULL
);

CREATE TABLE `car_picture` (
 `car_pic_seq` int NOT NULL primary key auto_increment,
 `car_pic_path` varchar(100) NOT NULL,
 `car_seq` int NOT NULL
);

CREATE TABLE `reference_distance` (
 `ref_distance` varchar(10) NOT NULL primary key,
 `ref_distance_rate` varchar(5) NOT NULL
);

CREATE TABLE `reference_accident` (
 `ref_accident` varchar(1) NOT NULL primary key,
 `ref_accident_rate` varchar(5) NOT NULL
);

ALTER TABLE `board` ADD CONSTRAINT `FK_User_TO_board_1` FOREIGN KEY (
 `user_seq`
)
REFERENCES `User` (
 `user_seq`
);

ALTER TABLE `visitor` ADD CONSTRAINT `FK_User_TO_visitor_1` FOREIGN KEY (
 `user_seq`
)
REFERENCES `User` (
 `user_seq`
);

ALTER TABLE `board_comment` ADD CONSTRAINT `FK_User_TO_board_comment_1` FOREIGN KEY (
 `user_seq`
)
REFERENCES `User` (
 `user_seq`
);

ALTER TABLE `board_comment` ADD CONSTRAINT `FK_board_TO_board_comment_1` FOREIGN KEY (
 `board_seq`
)
REFERENCES `board` (
 `board_seq`
);

ALTER TABLE `board_picture` ADD CONSTRAINT `FK_board_TO_board_picture_1` FOREIGN KEY (
 `board_seq`
)
REFERENCES `board` (
 `board_seq`
);

ALTER TABLE `car_picture` ADD CONSTRAINT `FK_car_data_TO_car_picture_1` FOREIGN KEY (
 `car_seq`
)
REFERENCES `car_data` (
 `car_seq`
);

-- user 테이블 - 회원가입으로 생성
-- admin => AdminCar 로 시작하는 id로 만들면 grade = 2인 관리자 계정
-- windows의 mariadb는 대소문자 구분 안해서 만들때 유의
-- linux의 mariadb에서는 대소문자를 구분 할 것이므로 sql문 작성할때 대소문자 구분 잘하기
-- 나머지 일반적인 회원가입은 grade = 1인 일반 계정 생성

-- visitor 테이블 dummy 데이터
insert into visitor values (0, '2021-03-17', 1);
insert into visitor values (0, '2021-03-16', 1);
insert into visitor values (0, '2021-03-15', 1);
insert into visitor values (0, '2021-03-14', 1);
insert into visitor values (0, '2021-03-15', 2);
insert into visitor values (0, '2021-03-14', 2);
insert into visitor values (0, '2021-03-13', 2);
insert into visitor values (0, '2021-03-12', 2);
insert into visitor values (0, '2021-03-13', 3);
insert into visitor values (0, '2021-03-12', 3);
insert into visitor values (0, '2021-03-11', 3);
insert into visitor values (0, '2021-03-10', 3);
insert into visitor values (0, '2021-03-11', 4);
insert into visitor values (0, '2021-03-10', 4);
insert into visitor values (0, '2021-03-09', 4);
insert into visitor values (0, '2021-03-08', 4);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 5);

-- board 테이블 dummy 데이터
insert into board values (0, 'item1', 'item1 내용입니다.', 0, '2021-03-17', 1);
insert into board values (0, 'item2', 'item2 내용입니다.', 0, '2021-03-17', 2);
insert into board values (0, 'item3', 'item3 내용입니다.', 0, '2021-03-16', 3);
insert into board values (0, 'item4', 'item4 내용입니다.', 0, '2021-03-16', 4);
insert into board values (0, 'item5', 'item5 내용입니다.', 0, '2021-03-15', 1);
insert into board values (0, 'item6', 'item6 내용입니다.', 0, '2021-03-15', 2);
insert into board values (0, 'item7', 'item7 내용입니다.', 0, '2021-03-14', 3);
insert into board values (0, 'item8', 'item8 내용입니다.', 0, '2021-03-14', 4);
insert into board values (0, 'item9', 'item9 내용입니다.', 0, '2021-03-14', 1);
insert into board values (0, 'item10', 'item10 내용입니다.', 0, '2021-03-13', 2);
insert into board values (0, 'item11', 'item11 내용입니다.', 0, '2021-03-13', 3);
insert into board values (0, 'item12', 'item12 내용입니다.', 0, '2021-03-12', 4);
insert into board values (0, 'item13', 'item13 내용입니다.', 0, '2021-03-12', 1);
insert into board values (0, 'item14', 'item14 내용입니다.', 0, '2021-03-11', 2);
insert into board values (0, 'item15', 'item15 내용입니다.', 0, '2021-03-11', 3);
insert into board values (0, 'item16', 'item16 내용입니다.', 0, '2021-03-11', 4);
insert into board values (0, 'item17', 'item17 내용입니다.', 0, '2021-03-10', 1);
insert into board values (0, 'item18', 'item18 내용입니다.', 0, '2021-03-09', 2);
insert into board values (0, 'item19', 'item19 내용입니다.', 0, '2021-03-09', 3);
insert into board values (0, 'item20', 'item20 내용입니다.', 0, '2021-03-09', 4);

insert into board_picture values( 0, '1.webp', 1 );
insert into board_picture values( 0, '2.webp', 1 );
insert into board_picture values( 0, 'kona_1.jpg', 2 );
insert into board_picture values( 0, 'kona_2.jpg', 2 );
insert into board_picture values( 0, 'kona_3.jpg', 2 );
insert into board_picture values( 0, 'kona_4.jpg', 2 );
insert into board_picture values( 0, 'kona_5.jpg', 2 );
insert into board_picture values( 0, 'venue_1.webp', 3 );
insert into board_picture values( 0, 'venue_2.webp', 3 );
insert into board_picture values( 0, 'venue_3.webp', 3 );
insert into board_picture values( 0, 'venue_4.webp', 3 );
insert into board_picture values( 0, 'venue_5.webp', 3 );
insert into board_picture values( 0, 'venue_6.webp', 3 );
insert into board_picture values( 0, 'venue_7.webp', 3 );
insert into board_picture values( 0, 'venue_8.webp', 3 );
insert into board_picture values( 0, 'venue_9.webp', 3 );
insert into board_picture values( 0, 'venue_10.webp', 3 );
insert into board_picture values( 0, 'venue_11.webp', 3 );
insert into board_picture values( 0, 'venue_12.jpg', 3 );
insert into board_picture values( 0, 'venue_13.webp', 3 );
insert into board_picture values( 0, '1.webp', 4 );
insert into board_picture values( 0, '2.webp', 4 );
insert into board_picture values( 0, '1.webp', 5 );
insert into board_picture values( 0, '2.webp', 5 );
insert into board_picture values( 0, '1.webp', 6 );
insert into board_picture values( 0, '2.webp', 6 );
insert into board_picture values( 0, '1.webp', 7 );
insert into board_picture values( 0, '2.webp', 7 );
insert into board_picture values( 0, '1.webp', 8 );
insert into board_picture values( 0, '2.webp', 8 );
insert into board_picture values( 0, '1.webp', 9 );
insert into board_picture values( 0, '2.webp', 9 );
insert into board_picture values( 0, '1.webp', 10 );
insert into board_picture values( 0, '2.webp', 10 );
insert into board_picture values( 0, '1.webp', 11 );
insert into board_picture values( 0, '2.webp', 11 );
insert into board_picture values( 0, '1.webp', 12 );
insert into board_picture values( 0, '2.webp', 12 );
insert into board_picture values( 0, '1.webp', 13 );
insert into board_picture values( 0, '2.webp', 13 );
insert into board_picture values( 0, '1.webp', 14 );
insert into board_picture values( 0, '2.webp', 14 );
insert into board_picture values( 0, '1.webp', 14 );
insert into board_picture values( 0, '2.webp', 14 );
insert into board_picture values( 0, '1.webp', 15 );
insert into board_picture values( 0, '2.webp', 15 );
insert into board_picture values( 0, '1.webp', 16 );
insert into board_picture values( 0, '2.webp', 16 );
insert into board_picture values( 0, '1.webp', 17 );
insert into board_picture values( 0, '2.webp', 17 );
insert into board_picture values( 0, '1.webp', 18 );
insert into board_picture values( 0, '2.webp', 18 );
insert into board_picture values( 0, '1.webp', 19 );
insert into board_picture values( 0, '2.webp', 19 );
insert into board_picture values( 0, '1.webp', 20 );
insert into board_picture values( 0, '2.webp', 20 );

-- auto_increment 1부터 초기화하는 구문 (데이터 다지우고 1로 시작할 때 - 테이블에 새로 시작할 값보다 높은 값이 있으면 안됨 )
alter table user auto_increment=1;

-- auto_increment 1부터 다시 새로 만들어줌
alter table user auto_increment=1;
set @count = 0;
update user set user_seq = @count:=@count+1;

alter table board auto_increment=1;
set @count = 0;
update board set board_seq = @count:=@count+1;