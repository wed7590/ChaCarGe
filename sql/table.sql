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
 `car_price` varchar(10) NOT NULL,
 `car_year` varchar(10) NOT NULL,
 `car_picture` varchar(50) NOT NULL
);

CREATE TABLE `car_picture` (
 `car_pic_seq` int NOT NULL primary key auto_increment,
 `car_pic_path` varchar(100) NOT NULL,
 `car_seq` int NOT NULL
);

CREATE TABLE `car_reference_distance` (
 `car_ref_distance` varchar(10) NOT NULL primary key,
 `car_ref_distance_rate` varchar(10) NOT NULL
);

CREATE TABLE `car_reference_accident` (
 `car_ref_accident` varchar(10) NOT NULL primary key,
 `car_ref_accident_rate` varchar(10) NOT NULL
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

-- board 픽쳐 dummy 데이터
insert into board_picture values( 0, 'kona_1.jpg', 1 );
insert into board_picture values( 0, 'kona_2.jpg', 1 );
insert into board_picture values( 0, 'kona_3.jpg', 1 );
insert into board_picture values( 0, 'kona_4.jpg', 1 );
insert into board_picture values( 0, 'kona_5.jpg', 1 );
insert into board_picture values( 0, 'venue_1.jpg', 2 );
insert into board_picture values( 0, 'venue_2.jpg', 2 );
insert into board_picture values( 0, 'venue_3.webp', 2 );
insert into board_picture values( 0, 'venue_4.webp', 2 );
insert into board_picture values( 0, 'venue_5.webp', 2 );
insert into board_picture values( 0, 'venue_6.webp', 2 );
insert into board_picture values( 0, 'venue_7.webp', 2 );
insert into board_picture values( 0, 'venue_8.webp', 2 );
insert into board_picture values( 0, 'venue_9.webp', 2 );
insert into board_picture values( 0, 'venue_10.webp', 2 );
insert into board_picture values( 0, 'venue_11.webp', 2 );
insert into board_picture values( 0, 'venue_12.webp', 2 );
insert into board_picture values( 0, 'venue_13.webp', 2 );
insert into board_picture values( 0, 'genesis_g70_1.jpg', 3 );
insert into board_picture values( 0, 'genesis_g70_2.jpg', 3 );
insert into board_picture values( 0, 'genesis_g70_3.jpg', 3 );
insert into board_picture values( 0, 'genesis_g70_4.jpg', 3 );
insert into board_picture values( 0, 'genesis_g70_5.jpg', 3 );
insert into board_picture values( 0, 'genesis_g70_6.png', 3 );
insert into board_picture values( 0, 'genesis_g80_1.jpg', 4 );
insert into board_picture values( 0, 'genesis_g80_2.jpg', 4 );
insert into board_picture values( 0, 'genesis_g80_3.jpg', 4 );
insert into board_picture values( 0, 'genesis_g80_4.jpg', 4 );
insert into board_picture values( 0, 'genesis_g80_5.jpg', 4 );
insert into board_picture values( 0, 'genesis_g80_6.jpg', 4 );
insert into board_picture values( 0, 'genesis_g80_7.jpg', 4 );
insert into board_picture values( 0, 'genesis_g80_8.jpg', 4 );
insert into board_picture values( 0, 'genesis_g80_9.jpg', 4 );
insert into board_picture values( 0, 'genesis_g90_1.jpg', 5 );
insert into board_picture values( 0, 'genesis_g90_2.jpg', 5 );
insert into board_picture values( 0, 'genesis_g90_3.jpg', 5 );
insert into board_picture values( 0, 'genesis_g90_4.jpg', 5 );
insert into board_picture values( 0, 'genesis_g90_5.jpg', 5 );
insert into board_picture values( 0, 'genesis_g90_6.jpg', 5 );
insert into board_picture values( 0, 'genesis_g90_7.jpg', 5 );
insert into board_picture values( 0, 'genesis_g90_8.jpg', 5 );
insert into board_picture values( 0, 'genesis_g90_9.jpg', 5 );
insert into board_picture values( 0, 'i30_1.jpg', 6 );
insert into board_picture values( 0, 'i30_2.jpg', 6 );
insert into board_picture values( 0, 'i30_3.jpg', 6 );
insert into board_picture values( 0, 'i30_4.jpg', 6 );
insert into board_picture values( 0, 'i30_5.jpg', 6 );
insert into board_picture values( 0, 'i30_6.jpg', 6 );
insert into board_picture values( 0, 'i30_7.png', 6 );
insert into board_picture values( 0, 'i40_1.jpg', 7 );
insert into board_picture values( 0, 'i40_2.jpg', 7 );
insert into board_picture values( 0, 'i40_3.jpg', 7 );
insert into board_picture values( 0, 'i40_4.jpg', 7 );
insert into board_picture values( 0, 'i40_5.jpg', 7 );
insert into board_picture values( 0, 'i40_6.png', 7 );
insert into board_picture values( 0, 'avante_1.jpg', 8 );
insert into board_picture values( 0, 'avante_2.webp', 8 );
insert into board_picture values( 0, 'avante_3.webp', 8 );
insert into board_picture values( 0, 'avante_4.webp', 8 );
insert into board_picture values( 0, 'avante_5.webp', 8 );
insert into board_picture values( 0, 'avante_6.webp', 8 );
insert into board_picture values( 0, 'avante_7.webp', 8 );
insert into board_picture values( 0, 'grandeur_1.jpg', 9 );
insert into board_picture values( 0, 'grandeur_2.jpg', 9 );
insert into board_picture values( 0, 'grandeur_3.jpg', 9 );
insert into board_picture values( 0, 'grandeur_4.jpg', 9 );
insert into board_picture values( 0, 'grandeur_5.jpg', 9 );
insert into board_picture values( 0, 'grandeur_6.webp', 9 );
insert into board_picture values( 0, 'grandeur_7.webp', 9 );
insert into board_picture values( 0, 'grandeur_8.webp', 9 );
insert into board_picture values( 0, 'grandeur_9.webp', 9 );
insert into board_picture values( 0, 'palisade_1.webp', 10 );
insert into board_picture values( 0, 'palisade_2.webp', 10 );
insert into board_picture values( 0, 'palisade_3.webp', 10 );
insert into board_picture values( 0, 'palisade_4.webp', 10 );
insert into board_picture values( 0, 'palisade_5.webp', 10 );
insert into board_picture values( 0, 'palisade_6.webp', 10 );
insert into board_picture values( 0, 'palisade_7.webp', 10 );
insert into board_picture values( 0, 'santafe_1.jpg', 11 );
insert into board_picture values( 0, 'santafe_2.webp', 11 );
insert into board_picture values( 0, 'santafe_3.webp', 11 );
insert into board_picture values( 0, 'santafe_4.webp', 11 );
insert into board_picture values( 0, 'santafe_5.webp', 11 );
insert into board_picture values( 0, 'santafe_6.webp', 11 );
insert into board_picture values( 0, 'santafe_7.webp', 11 );
insert into board_picture values( 0, 'santafe_8.webp', 11 );
insert into board_picture values( 0, 'santafe_9.webp', 11 );
insert into board_picture values( 0, 'sonata_1.jpg', 12 );
insert into board_picture values( 0, 'sonata_2.webp', 12 );
insert into board_picture values( 0, 'sonata_3.webp', 12 );
insert into board_picture values( 0, 'sonata_4.webp', 12 );
insert into board_picture values( 0, 'sonata_5.webp', 12 );
insert into board_picture values( 0, 'sonata_6.webp', 12 );
insert into board_picture values( 0, 'sonata_7.webp', 12 );
insert into board_picture values( 0, 'starex_1.webp', 13 );
insert into board_picture values( 0, 'starex_2.webp', 13 );
insert into board_picture values( 0, 'starex_3.webp', 13 );
insert into board_picture values( 0, 'starex_4.webp', 13 );
insert into board_picture values( 0, 'starex_5.webp', 13 );
insert into board_picture values( 0, 'starex_6.webp', 13 );
insert into board_picture values( 0, 'tucson_1.webp', 14 );
insert into board_picture values( 0, 'tucson_2.webp', 14 );
insert into board_picture values( 0, 'tucson_3.webp', 14 );
insert into board_picture values( 0, 'tucson_4.webp', 14 );
insert into board_picture values( 0, 'tucson_5.webp', 14 );
insert into board_picture values( 0, 'tucson_6.webp', 14 );
insert into board_picture values( 0, 'tucson_7.webp', 14 );
insert into board_picture values( 0, 'tucson_8.webp', 14 );
insert into board_picture values( 0, 'tucson_9.webp', 14 );
insert into board_picture values( 0, 'veloster_1.jpg', 15 );
insert into board_picture values( 0, 'veloster_2.webp', 15 );
insert into board_picture values( 0, 'veloster_3.webp', 15 );
insert into board_picture values( 0, 'veloster_4.webp', 15 );
insert into board_picture values( 0, 'veloster_5.webp', 15 );
insert into board_picture values( 0, 'veloster_6.webp', 15 );

-- estimate 페이지 car_data 테이블 dummy 데이터
insert into car_data values (0, "아반테", "18500000", "2021", "Avante.jpg");
insert into car_data values (0, "아반테", "17575000", "2020", "Avante.jpg");
insert into car_data values (0, "아반테", "16650000", "2019", "Avante.jpg");
insert into car_data values (0, "아반테", "15725000", "2018", "Avante.jpg");
insert into car_data values (0, "아반테", "14800000", "2017", "Avante.jpg");
insert into car_data values (0, "아반테", "14245000", "2016", "Avante.jpg");
insert into car_data values (0, "아반테", "13875000", "2015", "Avante.jpg");
insert into car_data values (0, "아반테", "13320000", "2014", "Avante.jpg");
insert into car_data values (0, "아반테", "12950000", "2013", "Avante.jpg");
insert into car_data values (0, "아반테", "12950000", "2012", "Avante.jpg");
insert into car_data values (0, "벨로스터", "21000000", "2021", "Veloster.jpg");
insert into car_data values (0, "벨로스터", "19950000", "2020", "Veloster.jpg");
insert into car_data values (0, "벨로스터", "18900000", "2019", "Veloster.jpg");
insert into car_data values (0, "벨로스터", "17850000", "2018", "Veloster.jpg");
insert into car_data values (0, "벨로스터", "16800000", "2017", "Veloster.jpg");
insert into car_data values (0, "벨로스터", "16170000", "2016", "Veloster.jpg");
insert into car_data values (0, "벨로스터", "15750000", "2015", "Veloster.jpg");
insert into car_data values (0, "벨로스터", "15120000", "2014", "Veloster.jpg");
insert into car_data values (0, "벨로스터", "14700000", "2013", "Veloster.jpg");
insert into car_data values (0, "벨로스터", "14700000", "2012", "Veloster.jpg");
insert into car_data values (0, "소나타", "24000000", "2021", "sonata.png");
insert into car_data values (0, "소나타", "22800000", "2020", "sonata.png");
insert into car_data values (0, "소나타", "21600000", "2019", "sonata.png");
insert into car_data values (0, "소나타", "20400000", "2018", "sonata.png");
insert into car_data values (0, "소나타", "19200000", "2017", "sonata.png");
insert into car_data values (0, "소나타", "18480000", "2016", "sonata.png");
insert into car_data values (0, "소나타", "18000000", "2015", "sonata.png");
insert into car_data values (0, "소나타", "17280000", "2014", "sonata.png");
insert into car_data values (0, "소나타", "16800000", "2013", "sonata.png");
insert into car_data values (0, "소나타", "16800000", "2012", "sonata.png");
insert into car_data values (0, "그랜져", "33000000", "2021", "Grandeur.jpg");
insert into car_data values (0, "그랜져", "31350000", "2020", "Grandeur.jpg");
insert into car_data values (0, "그랜져", "29700000", "2019", "Grandeur.jpg");
insert into car_data values (0, "그랜져", "28050000", "2018", "Grandeur.jpg");
insert into car_data values (0, "그랜져", "26400000", "2017", "Grandeur.jpg");
insert into car_data values (0, "그랜져", "25410000", "2016", "Grandeur.jpg");
insert into car_data values (0, "그랜져", "24750000", "2015", "Grandeur.jpg");
insert into car_data values (0, "그랜져", "23760000", "2014", "Grandeur.jpg");
insert into car_data values (0, "그랜져", "23100000", "2013", "Grandeur.jpg");
insert into car_data values (0, "그랜져", "23100000", "2012", "Grandeur.jpg");
insert into car_data values (0, "투싼", "24500000", "2021", "Tucson.png");
insert into car_data values (0, "투싼", "23275000", "2020", "Tucson.png");
insert into car_data values (0, "투싼", "22050000", "2019", "Tucson.png");
insert into car_data values (0, "투싼", "20825000", "2018", "Tucson.png");
insert into car_data values (0, "투싼", "19600000", "2017", "Tucson.png");
insert into car_data values (0, "투싼", "18865000", "2016", "Tucson.png");
insert into car_data values (0, "투싼", "18375000", "2015", "Tucson.png");
insert into car_data values (0, "투싼", "17640000", "2014", "Tucson.png");
insert into car_data values (0, "투싼", "17150000", "2013", "Tucson.png");
insert into car_data values (0, "투싼", "17150000", "2012", "Tucson.png");
insert into car_data values (0, "싼타페", "24640000", "2016", "Santafe.png");
insert into car_data values (0, "싼타페", "24000000", "2015", "Santafe.png");
insert into car_data values (0, "싼타페", "23040000", "2014", "Santafe.png");
insert into car_data values (0, "싼타페", "22400000", "2013", "Santafe.png");
insert into car_data values (0, "싼타페", "22400000", "2012", "Santafe.png");
insert into car_data values (0, "베뉴", "32400000", "2019", "Venue.png");
insert into car_data values (0, "베뉴", "30600000", "2018", "Venue.png");
insert into car_data values (0, "베뉴", "28800000", "2017", "Venue.png");
insert into car_data values (0, "베뉴", "27720000", "2016", "Venue.png");
insert into car_data values (0, "베뉴", "27000000", "2015", "Venue.png");
insert into car_data values (0, "베뉴", "25920000", "2014", "Venue.png");
insert into car_data values (0, "베뉴", "25200000", "2013", "Venue.png");
insert into car_data values (0, "베뉴", "25200000", "2012", "Venue.png");
insert into car_data values (0, "코나", "15200000", "2017", "kona.png");
insert into car_data values (0, "코나", "14630000", "2016", "kona.png");
insert into car_data values (0, "코나", "14250000", "2015", "kona.png");
insert into car_data values (0, "코나", "13680000", "2014", "kona.png");
insert into car_data values (0, "코나", "13300000", "2013", "kona.png");
insert into car_data values (0, "코나", "13300000", "2012", "kona.png");
insert into car_data values (0, "펠리세이드", "36000000", "2021", "Palisade.jpg");
insert into car_data values (0, "펠리세이드", "34200000", "2020", "Palisade.jpg");
insert into car_data values (0, "펠리세이드", "32400000", "2019", "Palisade.jpg");
insert into car_data values (0, "펠리세이드", "30600000", "2018", "Palisade.jpg");
insert into car_data values (0, "펠리세이드", "28800000", "2017", "Palisade.jpg");
insert into car_data values (0, "펠리세이드", "27720000", "2016", "Palisade.jpg");
insert into car_data values (0, "펠리세이드", "27000000", "2015", "Palisade.jpg");
insert into car_data values (0, "펠리세이드", "25920000", "2014", "Palisade.jpg");
insert into car_data values (0, "펠리세이드", "25200000", "2013", "Palisade.jpg");
insert into car_data values (0, "펠리세이드", "25200000", "2012", "Palisade.jpg");
insert into car_data values (0, "스타렉스", "24000000", "2021", "Starex.jpg");
insert into car_data values (0, "스타렉스", "22800000", "2020", "Starex.jpg");
insert into car_data values (0, "스타렉스", "21600000", "2019", "Starex.jpg");
insert into car_data values (0, "스타렉스", "20400000", "2018", "Starex.jpg");
insert into car_data values (0, "스타렉스", "19200000", "2017", "Starex.jpg");
insert into car_data values (0, "스타렉스", "18480000", "2016", "Starex.jpg");
insert into car_data values (0, "스타렉스", "18000000", "2015", "Starex.jpg");
insert into car_data values (0, "스타렉스", "17280000", "2014", "Starex.jpg");
insert into car_data values (0, "스타렉스", "16800000", "2013", "Starex.jpg");
insert into car_data values (0, "스타렉스", "16800000", "2012", "Starex.jpg");
insert into car_data values (0, "i30", "18050000", "2020", "i30.png");
insert into car_data values (0, "i30", "17100000", "2019", "i30.png");
insert into car_data values (0, "i30", "16150000", "2018", "i30.png");
insert into car_data values (0, "i30", "15200000", "2017", "i30.png");
insert into car_data values (0, "i30", "14630000", "2016", "i30.png");
insert into car_data values (0, "i30", "14250000", "2015", "i30.png");
insert into car_data values (0, "i30", "13680000", "2014", "i30.png");
insert into car_data values (0, "i30", "13300000", "2013", "i30.png");
insert into car_data values (0, "i30", "13300000", "2012", "i30.png");
insert into car_data values (0, "i40", "23400000", "2019", "i40.png");
insert into car_data values (0, "i40", "22100000", "2018", "i40.png");
insert into car_data values (0, "i40", "20800000", "2017", "i40.png");
insert into car_data values (0, "i40", "20020000", "2016", "i40.png");
insert into car_data values (0, "i40", "19500000", "2015", "i40.png");
insert into car_data values (0, "i40", "18720000", "2014", "i40.png");
insert into car_data values (0, "i40", "18200000", "2013", "i40.png");
insert into car_data values (0, "i40", "18200000", "2012", "i40.png");
insert into car_data values (0, "제네시스g70", "39000000", "2021", "Genesisg70.png");
insert into car_data values (0, "제네시스g70", "37050000", "2020", "Genesisg70.png");
insert into car_data values (0, "제네시스g70", "35100000", "2019", "Genesisg70.png");
insert into car_data values (0, "제네시스g70", "33150000", "2018", "Genesisg70.png");
insert into car_data values (0, "제네시스g70", "31200000", "2017", "Genesisg70.png");
insert into car_data values (0, "제네시스g80", "54000000", "2021", "Genesisg80.jpg");
insert into car_data values (0, "제네시스g80", "51300000", "2020", "Genesisg80.jpg");
insert into car_data values (0, "제네시스g90", "78000000", "2021", "Genesisg90.jpg");
insert into car_data values (0, "제네시스g90", "74100000", "2020", "Genesisg90.jpg");

-- estimate 페이지 car_distance 테이블 dummy 데이터
insert into car_reference_distance values("10000", "500000");
insert into car_reference_distance values("20000", "1000000");
insert into car_reference_distance values("30000", "1500000");
insert into car_reference_distance values("40000", "2000000");
insert into car_reference_distance values("50000", "2500000");
insert into car_reference_distance values("60000", "3000000");
insert into car_reference_distance values("70000", "3500000");
insert into car_reference_distance values("80000", "4000000");
insert into car_reference_distance values("90000", "4500000");
insert into car_reference_distance values("100000", "5000000");
insert into car_reference_distance values("110000", "5500000");
insert into car_reference_distance values("120000", "6000000");
insert into car_reference_distance values("130000", "6500000");
insert into car_reference_distance values("140000", "7000000");
insert into car_reference_distance values("150000", "7500000");

-- estimate 페이지 car_accident 테이블 dummy 데이터
insert into car_reference_accident values("1", "1");
insert into car_reference_accident values("2", "0.9");
insert into car_reference_accident values("3", "0.85");
insert into car_reference_accident values("4", "0.8");

-- auto_increment 1부터 초기화하는 구문 (데이터 다지우고 1로 시작할 때 - 테이블에 새로 시작할 값보다 높은 값이 있으면 안됨 )
alter table user auto_increment=1;

-- auto_increment 1부터 다시 새로 만들어줌
alter table user auto_increment=1;
set @count = 0;
update user set user_seq = @count:=@count+1;

alter table board auto_increment=1;
set @count = 0;
update board set board_seq = @count:=@count+1;