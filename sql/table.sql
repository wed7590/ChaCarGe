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

-- user 테이블 dummy 데이터
insert into User ( user_seq, user_id, user_password, user_email, user_name, user_join_date, user_grade ) values( 0, 'admin1', '123456', 'admin1@chacarge.net', 'admin1', DATE_FORMAT(now(), '%Y-%m-%d'), '2' );
insert into User ( user_seq, user_id, user_password, user_email, user_name, user_join_date, user_grade ) values( 0, 'admin2', '123456', 'admin2@chacarge.net', 'admin2', DATE_FORMAT(now(), '%Y-%m-%d'), '2' );
insert into User ( user_seq, user_id, user_password, user_email, user_name, user_join_date, user_grade ) values( 0, 'admin3', '123456', 'admin3@chacarge.net', 'admin3', DATE_FORMAT(now(), '%Y-%m-%d'), '2' );
insert into User ( user_seq, user_id, user_password, user_email, user_name, user_join_date, user_grade ) values( 0, 'admin4', '123456', 'admin4@chacarge.net', 'admin4', DATE_FORMAT(now(), '%Y-%m-%d'), '2' );

-- visitor 테이블 dummy 데이터
insert into visitor values (0, '2021-03-17', 1);
insert into visitor values (0, '2021-03-16', 1);
insert into visitor values (0, '2021-03-15', 1);
insert into visitor values (0, '2021-03-14', 1);
insert into visitor values (0, '2021-03-13', 2);
insert into visitor values (0, '2021-03-12', 2);
insert into visitor values (0, '2021-03-11', 2);
insert into visitor values (0, '2021-03-10', 2);
insert into visitor values (0, '2021-03-09', 3);
insert into visitor values (0, '2021-03-08', 3);
insert into visitor values (0, '2021-03-07', 3);
insert into visitor values (0, '2021-03-06', 3);
insert into visitor values (0, '2021-03-05', 4);
insert into visitor values (0, '2021-03-04', 4);
insert into visitor values (0, '2021-03-03', 4);
insert into visitor values (0, '2021-03-02', 4);

-- auto_increment 1부터 초기화하는 구문 (데이터 다지우고 1로 시작할 때 - 테이블에 새로 시작할 값보다 높은 값이 있으면 안됨 )
alter table user auto_increment=1;

-- auto_increment 1부터 다시 새로 만들어줌
alter table user auto_increment=1;
set @count = 0;
update user set user_seq = @count:=@count+1;