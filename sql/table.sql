CREATE DATABASE chacarge;
USE chacarge;

CREATE TABLE `User` (
 `user_id` varchar(15) primary key NOT NULL,
 `user_password` varchar(15) NOT NULL,
 `user_email` varchar(15) NOT NULL,
 `user_name` varchar(15) NOT NULL,
 `user_join_date` varchar(15) NOT NULL,
 `user_grade` varchar(1) NOT NULL DEFAULT 1,
 `user_token` varchar(15) NULL,
 `visit_seq` int NOT NULL
);

CREATE TABLE `board` (
 `board_seq` int primary key auto_increment NOT NULL,
 `board_subject` varchar(30) NOT NULL,
 `board_content` varchar(3000) NOT NULL,
 `user_id` varchar(15) NOT NULL,
 `board_hit` int NOT NULL,
 `board_wdate` datetime NOT NULL
);

CREATE TABLE `visitor` (
 `visit_seq` int primary key auto_increment NOT NULL,
 `visit_date` varchar(15) NOT NULL
);

CREATE TABLE `board_comment` (
 `comment_seq` int primary key auto_increment NOT NULL,
 `user_id` varchar(15) NOT NULL,
 `comment_content` varchar(500) NOT NULL,
 `comment_wdate` datetime NOT NULL,
 `board_seq` int NOT NULL
);

CREATE TABLE `board_picture` (
 `board_pic_seq` int primary key auto_increment NOT NULL,
 `board_pic_path` varchar(100) NOT NULL,
 `board_seq` int NOT NULL
);

CREATE TABLE `car_data` (
 `car_seq` int primary key auto_increment NOT NULL,
 `car_name` varchar(20) NOT NULL,
 `car_price` int NOT NULL,
 `car_year` int NOT NULL,
 `car_picture` varchar(50) NOT NULL
);

CREATE TABLE `car_picture` (
 `car_pic_seq` int primary key auto_increment NOT NULL,
 `car_pic_path` varchar(100) NOT NULL,
 `car_seq` int NOT NULL
);

CREATE TABLE `reference_distance` (
 `ref_distance` varchar(10) NOT NULL,
 `ref_distance_rate` varchar(5) NOT NULL
);

CREATE TABLE `reference_accident` (
 `ref_accident` varchar(1) NOT NULL,
 `ref_accident_rate` varchar(5) NOT NULL
);


ALTER TABLE `User` ADD CONSTRAINT `FK_visitor_TO_User_1` FOREIGN KEY (
 `visit_seq`
)
REFERENCES `visitor` (
 `visit_seq`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_User_TO_board_1` FOREIGN KEY (
 `user_id`
)
REFERENCES `User` (
 `user_id`
);

ALTER TABLE `board_comment` ADD CONSTRAINT `FK_User_TO_board_comment_1` FOREIGN KEY (
 `user_id`
)
REFERENCES `User` (
 `user_id`
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