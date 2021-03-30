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
 `o_pic_name` varchar(100) NOT NULL,
 `u_pic_name` varchar(100) NOT NULL,
 `board_seq` int NOT NULL
);

CREATE TABLE `car_data` (
 `car_seq` int NOT NULL primary key auto_increment,
 `car_name` varchar(30) NOT NULL,
 `car_price` varchar(20) NOT NULL,
 `car_picture` varchar(50) NOT NULL
);

CREATE TABLE `car_reference_year` (
 `car_name` varchar(30) NOT NULL,
 `car_ref_year` varchar(10) NOT NULL,
 `car_ref_year_rate` varchar(10) NOT NULL
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
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 6);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 7);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 8);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 9);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 10);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 11);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 12);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 13);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 14);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 15);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 16);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 17);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 18);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 19);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 20);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 21);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 22);
insert into visitor values(0, DATE_FORMAT(now(), '%Y-%m-%d'), 23);

-- board 테이블 dummy 데이터
insert into board values (0, 'item1', '<p><b>차종 :현대 아반떼AD 1.6 모던</b></p> <p><b>출고 연도 :2018</b></p> <p><b>운행 거리 :33,945km</b></p>
 </b></p> <p><b>사고 정도 :경미</b></p> <p><b>판매 가격 :1,440만원</b></p><br> <p></p> 지금 보시는 2018년식 아반떼AD 차량을 정직하게 소개해 드릴게요.
이 차량은 A4 등급으로, 주행거리는 33,945Km로 최상의 운행 품질을 갖춘 차량이에요. ', 0, '2021-03-17', 1);
insert into board values (0, 'item2', '<p><b>차종 :G70</b></p> <p><b>출고 연도  2019</b></p> --<p><b>운행 거리 :18,513Km</b></p> <p><b>사고 정도 :무사고
</b></p> <p><b>판매 가격 :3,630만원</b></p> <p></p> 지금 보시는 2019년식 G70 차량을 정직하게 소개해 드릴게요.
이 차량은 A2+ 등급, 주행거리는 18,513Km로 최상의 운행 품질을 갖춘 신차급 차량이에요.', 0, '2021-03-17', 2);
insert into board values (0, 'item3', '<p><b>차종 :G80</b></p> <p><b>출고 연도 :2019</b></p> <p><b>운행 거리 :28,751Km</b></p> <p><b>사고 정도 :무사고
</b></p> <p><b>판매 가격 :4,480만원</b></p> <p></p> 지금 보시는 2019년식 G80 차량을 정직하게 소개해 드릴게요.
이 차량은 A3+ 등급, 주행거리는 28,751Km로 최상의 운행 품질을 갖춘 신차급 차량이에요.', 0, '2021-03-16', 3);
insert into board values (0, 'item4', '<p><b>차종 :G90</b></p> <p><b>출고 연도 :2019</b></p> <p><b>운행 거리 :43,443Km</b></p> <p><b>사고 정도 :경미
</b></p> <p><b>판매 가격 :7,760만원</b></p> <p></p> 금 보시는 2019년식 G90 차량을 정직하게 소개해 드릴게요.
이 차량은 B5+ 등급으로, 주행거리는 43,443Km로 양호한 운행 품질을 갖춘 차량이에요.' , 0, '2021-03-16', 4);
insert into board values (0, 'item5', '<p><b>차종 :더 뉴 그랜저</b></p> <p><b>출고 연도 :2020</b></p> <p><b>운행 거리 :5,740Km</b></p> <p><b>사고 정도 :무사고
</b></p> <p><b>판매 가격 :3,630만원</b></p> <p></p> 지금 보시는 2020년식 더 뉴 그랜저 차량을 정직하게 소개해 드릴게요.
이 차량은 A1+ 등급, 주행거리는 5,740Km로 최상의 운행 품질을 갖춘 신차급 차량이에요.
주행 조향 보조시스템(LKAS), 블루링크, 스마트 크루즈 컨트롤, 메모리 시트 등의 옵션이 있습니다.', 0, '2021-03-15', 1);
insert into board values (0, 'item6', '<p><b>차종 :i30</b></p> <p><b>출고 연도 :2015</b></p> <p><b>운행 거리 :6,818km</b></p> <p><b>사고 정도 :무사고
</b></p> <p><b>판매 가격 :170만원</b></p><br> <p></p>
현재 2021년 03월 27일 토요일 매장에 전시 되어있고 판매중인 차량이예요 주말 공휴일 상관없이 당일출고 및 당일이전 보험가입 가능한 차량이에요', 0, '2021-03-15', 2);
insert into board values (0, 'item7', '<p><b>차종 :현대 더 뉴 i40</b></p> <p><b>출고 연도 :2018</b></p> <p><b>운행 거리 :	9,341km</b></p> <p><b>사고 정도 :무사고
</b></p> <p><b>판매 가격 :200만원 </b></p><br> <p></p> 법인중고차안심센터상담)현대 더 뉴 i40 (15년~현재) 2.0 GDi PYL/18연식/200만', 0, '2021-03-14', 3);
insert into board values (0, 'item8', '<p><b>차종 :코나</b></p> <p><b>출고 연도 :2018</b></p> <p><b>운행 거리 :36,884Km</b></p> <p><b>사고 정도 :무사고
</b></p> <p><b>판매 가격 :1,480만원</b></p><br> <p></p> 지금 보시는 2018년식 코나 차량을 정직하게 소개해 드릴게요.
이 차량은 A4 등급으로, 주행거리는 36,884Km로 최상의 운행 품질을 갖춘 차량이에요.', 0, '2021-03-14', 4);
insert into board values (0, 'item9', '<p><b>차종 :palisade</b></p> <p><b>출고 연도 :2019</b></p> <p><b>운행 거리 :41,000km</b></p> <p><b>사고 정도 :무사고
</b></p> <p><b>판매 가격 :3,409만원</b></p><br> <p></p> 직영성능거점검장에서 81가지 차량점검 완료', 0, '2021-03-14', 1);
insert into board values (0, 'item10', '<p><b>차종 :싼타페TM</b></p> <p><b>출고 연도 :2020</b></p> <p><b>운행 거리 :14,856Km</b></p> <p><b>사고 정도 :무사고
</b></p> <p><b>판매 가격 :2,770만원</b></p><br> <p></p> 지금 보시는 2020년식 싼타페TM 차량을 정직하게 소개해 드릴게요.
이 차량은 A2+ 등급, 주행거리는 14,856Km로 최상의 운행 품질을 갖춘 신차급 차량이에요', 0, '2021-03-13', 2);
insert into board values (0, 'item11', '<p><b>차종 :쏘나타(DN8)</b></p> <p><b>출고 연도 :2020</b></p> <p><b>운행 거리 :10,209Km</b></p> <p><b>사고 정도 :무사고
</b></p> <p><b>판매 가격 :2,630만원</b></p><br> <p></p> 지금 보시는 2020년식 쏘나타(DN8) 차량을 정직하게 소개해 드릴게요.
이 차량은 A2+ 등급, 주행거리는 10,209Km로 최상의 운행 품질을 갖춘 신차급 차량이에요.', 0, '2021-03-13', 3);
insert into board values (0, 'item12', '<p><b>차종 :더 뉴 그랜드 스타렉스</b></p> <p><b>출고 연도 : 2019년</b></p> <p><b>운행 거리 : 5,234Km</b></p> <p><b>사고 정도 :무사고
</b></p> <p><b>5,050만원</b></p><br> <p></p> 지금 보시는 2019년식 더 뉴 그랜드 스타렉스 차량을 정직하게 소개해 드릴게요.
이 차량은 A1+ 등급, 주행거리는 5,234Km로 최상의 운행 품질을 갖춘 신차급 차량이에요.', 0, '2021-03-12', 4);
insert into board values (0, 'item13', '<p><b>차종 :올 뉴 투싼</b></p> <p><b>출고 연도 :2021</b></p> <p><b>운행 거리 :70,981Km</b></p> <p><b>사고 정도 :무사고
</b></p> <p><b>판매 가격 :1,840만원</b></p><br> <p></p> 지금 보시는 2017년식 올 뉴 투싼 차량을 정직하게 소개해 드릴게요.
이 차량은 A8 등급으로, 주행거리는 70,981Km로 최상의 운행 품질을 갖춘 차량이에요.', 0, '2021-03-12', 1);
insert into board values (0, 'item14', '<p><b>차종 :벨로스터 N r</b></p> <p><b>출고 연도 :2011</b></p> <p><b>운행 거리 :3,528Km</b></p> <p><b>사고 정도 :무사고
</b></p> <p><b>판매 가격 :3,330만원</b></p><br> <p></p> 지금 보시는 2021년식 벨로스터 N 차량을 정직하게 소개해 드릴게요.
이 차량은 A1+ 등급, 주행거리는 3,528Km로 최상의 운행 품질을 갖춘 신차급 차량이에요.', 0, '2021-03-11', 2);
insert into board values (0, 'item15', '<p><b>차종 :베뉴</b></p> <p><b>출고 연도 :2020</b></p> <p><b>운행 거리 :8,732Km</b></p> <p><b>사고 정도 :무사고
</b></p> <p><b>판매 가격 :1,750만원</b></p><br> <p></p> 지금 보시는 2020년식 베뉴 차량을 정직하게 소개해 드릴게요.
이 차량은 A1+ 등급, 주행거리는 8,732Km로 최상의 운행 품질을 갖춘 신차급 차량이에요.', 0, '2021-03-11', 3);

-- board 픽쳐 dummy 데이터
insert into board_picture values( 0, 'avantee_1.jpg', 'avantee_1.jpg', 1 );
insert into board_picture values( 0, 'avante_2.jpg', 'avante_2.jpg', 1 );
insert into board_picture values( 0, 'avante_3.jpg', 'avante_3.jpg', 1 );
insert into board_picture values( 0, 'avante_4.jpg', 'avante_4.jpg', 1 );
insert into board_picture values( 0, 'g70_1.jpg', 'g70_1.jpg', 2 );
insert into board_picture values( 0, 'g70_2.jpg', 'g70_2.jpg', 2 );
insert into board_picture values( 0, 'g70_3.jpg', 'g70_3.jpg', 2 );
insert into board_picture values( 0, 'g70_4.jpg', 'g70_4.jpg', 2 );
insert into board_picture values( 0, 'g80_1.jpg', 'g80_1.jpg', 3 );
insert into board_picture values( 0, 'g80_2.jpg', 'g80_2.jpg', 3 );
insert into board_picture values( 0, 'g80_3.jpg', 'g80_3.jpg',3 );
insert into board_picture values( 0, 'g80_4.jpg', 'g80_4.jpg', 3 );
insert into board_picture values( 0, 'g90_1.jpg', 'g90_1.jpg', 4 );
insert into board_picture values( 0, 'g90_2.jpg', 'g90_2.jpg', 4 );
insert into board_picture values( 0, 'g90_3.jpg', 'g90_3.jpg', 4 );
insert into board_picture values( 0, 'g90_4.jpg', 'g90_4.jpg', 4 );
insert into board_picture values( 0, 'grandeurr_1.jpg', 'grandeurr_1.jpg', 5 );
insert into board_picture values( 0, 'grandeur_2.jpg', 'grandeur_2.jpg', 5 );
insert into board_picture values( 0, 'grandeur_3.jpg', 'grandeur_3.jpg', 5 );
insert into board_picture values( 0, 'grandeur_4.jpg', 'grandeur_4.jpg', 5 );
insert into board_picture values( 0, 'i30_1.png', 'i30_1.png', 6 );
insert into board_picture values( 0, 'i30_2.png', 'i30_2.png', 6 );
insert into board_picture values( 0, 'i30_3.png', 'i30_3.png', 6 );
insert into board_picture values( 0, 'i30_4.png', 'i30_4.png', 6 );
insert into board_picture values( 0, 'i40_1.png', 'i40_1.png', 7 );
insert into board_picture values( 0, 'i40_2.png', 'i40_2.png', 7 );
insert into board_picture values( 0, 'i40_3.png', 'i40_3.png', 7 );
insert into board_picture values( 0, 'i40_4.png', 'i40_4.png', 7 );
insert into board_picture values( 0, 'kona_1.jpg', 'kona_1.jpg', 8 );
insert into board_picture values( 0, 'kona_2.jpg', 'kona_2.jpg', 8 );
insert into board_picture values( 0, 'kona_3.jpg', 'kona_3.jpg', 8 );
insert into board_picture values( 0, 'kona_4.jpg', 'kona_4.jpg', 8 );
insert into board_picture values( 0, 'palisade_1.jpg', 'palisade_1.jpg', 9 );
insert into board_picture values( 0, 'palisade_2.jpg', 'palisade_2.jpg', 9 );
insert into board_picture values( 0, 'palisade_3.jpg', 'palisade_3.jpg', 9 );
insert into board_picture values( 0, 'palisade_4.jpg', 'palisade_4.jpg', 9 );
insert into board_picture values( 0, 'santafee_1.jpg', 'santafee_1.jpg', 10 );
insert into board_picture values( 0, 'santafee_2.jpp', 'santafee_2.jpp', 10 );
insert into board_picture values( 0, 'santafee_3.jpp', 'santafee_3.jpp', 10 );
insert into board_picture values( 0, 'santafee_4.jpp', 'santafee_4.jpg', 10 );
insert into board_picture values( 0, 'sonataa_1.jpg', 'sonataa_1.jpg', 11 );
insert into board_picture values( 0, 'sonata_2.jpg', 'sonata_2.jpg', 11 );
insert into board_picture values( 0, 'sonata_3.jpg', 'sonata_3.jpg', 11 );
insert into board_picture values( 0, 'sonata_4.jpg', 'sonata_4.jpg', 11 );
insert into board_picture values( 0, 'starex_1.jpg', 'starex_1.jpg', 12 );
insert into board_picture values( 0, 'starex_2.jpg', 'starex_2.jpg', 12 );
insert into board_picture values( 0, 'starex_3.jpg', 'starex_3.jpg', 12 );
insert into board_picture values( 0, 'starex_4.jpg', 'starex_4.jpg', 12 );
insert into board_picture values( 0, 'tucson_1.jpg', 'tucson_1.jpg', 13 );
insert into board_picture values( 0, 'tucson_2.jpg', 'tucson_2.jpg', 13 );
insert into board_picture values( 0, 'tucson_3.jpg', 'tucson_3.jpg', 13 );
insert into board_picture values( 0, 'tucson_4.jpg', 'tucson_4.jpg', 13 );
insert into board_picture values( 0, 'velosterr_1.jpg', 'velosterr_1.jpg', 14 );
insert into board_picture values( 0, 'veloster_2.jpg', 'veloster_2.jpg', 14 );
insert into board_picture values( 0, 'veloster_3.jpg', 'veloster_3.jpg', 14 );
insert into board_picture values( 0, 'veloster_4.jpg', 'veloster_4.jpg', 14 );
insert into board_picture values( 0, 'venuee_1.jpg', 'venuee_1.jpg', 15 );
insert into board_picture values( 0, 'venue_2.jpg', 'venue_2.jpg', 15 );
insert into board_picture values( 0, 'venue_3.jpg', 'venue_3.jpg', 15 );
insert into board_picture values( 0, 'venue_4.jpg', 'venue_4.jpg', 15 );

-- estimate 페이지 car_data 테이블 dummy 데이터
insert into car_data values (0, "아반테", "18500000", "Avante.jpg");
insert into car_data values (0, "벨로스터", "21000000", "Veloster.jpg");
insert into car_data values (0, "소나타", "24000000", "sonata.png");
insert into car_data values (0, "그랜져", "33000000", "Grandeur.jpg");
insert into car_data values (0, "투싼", "24500000", "Tucson.png");
insert into car_data values (0, "싼타페", "32000000", "Santafe.png");
insert into car_data values (0, "베뉴", "36000000", "Venue.png");
insert into car_data values (0, "코나", "19000000", "kona.png");
insert into car_data values (0, "펠리세이드", "36000000", "Palisade.jpg");
insert into car_data values (0, "스타렉스", "24000000", "Starex.jpg");
insert into car_data values (0, "i30", "19000000", "i30.png");
insert into car_data values (0, "i40", "26000000", "i40.png");
insert into car_data values (0, "제네시스g70", "39000000", "Genesisg70.png");
insert into car_data values (0, "제네시스g80", "54000000", "Genesisg80.jpg");
insert into car_data values (0, "제네시스g90", "78000000", "Genesisg90.jpg");

-- estimate 페이지 car_reference_year 테이블 dummy 데이터
insert into car_reference_year values ("아반테", "2021", "1");
insert into car_reference_year values ("아반테", "2020", "0.95");
insert into car_reference_year values ("아반테", "2019", "0.9");
insert into car_reference_year values ("아반테", "2018", "0.85");
insert into car_reference_year values ("아반테", "2017", "0.8");
insert into car_reference_year values ("아반테", "2016", "0.77");
insert into car_reference_year values ("아반테", "2015", "0.75");
insert into car_reference_year values ("아반테", "2014", "0.72");
insert into car_reference_year values ("아반테", "2013", "0.7");
insert into car_reference_year values ("아반테", "2012", "0.7");
insert into car_reference_year values ("벨로스터", "2021", "1");
insert into car_reference_year values ("벨로스터", "2020", "0.95");
insert into car_reference_year values ("벨로스터", "2019", "0.9");
insert into car_reference_year values ("벨로스터", "2018", "0.85");
insert into car_reference_year values ("벨로스터", "2017", "0.8");
insert into car_reference_year values ("벨로스터", "2016", "0.77");
insert into car_reference_year values ("벨로스터", "2015", "0.75");
insert into car_reference_year values ("벨로스터", "2014", "0.72");
insert into car_reference_year values ("벨로스터", "2013", "0.7");
insert into car_reference_year values ("벨로스터", "2012", "0.7");
insert into car_reference_year values ("소나타", "2021", "1");
insert into car_reference_year values ("소나타", "2020", "0.95");
insert into car_reference_year values ("소나타", "2019", "0.9");
insert into car_reference_year values ("소나타", "2018", "0.85");
insert into car_reference_year values ("소나타", "2017", "0.8");
insert into car_reference_year values ("소나타", "2016", "0.77");
insert into car_reference_year values ("소나타", "2015", "0.75");
insert into car_reference_year values ("소나타", "2014", "0.72");
insert into car_reference_year values ("소나타", "2013", "0.7");
insert into car_reference_year values ("소나타", "2012", "0.7");
insert into car_reference_year values ("그렌져", "2021", "1");
insert into car_reference_year values ("그렌져", "2020", "0.95");
insert into car_reference_year values ("그렌져", "2019", "0.9");
insert into car_reference_year values ("그렌져", "2018", "0.85");
insert into car_reference_year values ("그렌져", "2017", "0.8");
insert into car_reference_year values ("그렌져", "2016", "0.77");
insert into car_reference_year values ("그렌져", "2015", "0.75");
insert into car_reference_year values ("그렌져", "2014", "0.72");
insert into car_reference_year values ("그렌져", "2013", "0.7");
insert into car_reference_year values ("그렌져", "2012", "0.7");
insert into car_reference_year values ("투싼", "2021", "1");
insert into car_reference_year values ("투싼", "2020", "0.95");
insert into car_reference_year values ("투싼", "2019", "0.9");
insert into car_reference_year values ("투싼", "2018", "0.85");
insert into car_reference_year values ("투싼", "2017", "0.8");
insert into car_reference_year values ("투싼", "2016", "0.77");
insert into car_reference_year values ("투싼", "2015", "0.75");
insert into car_reference_year values ("투싼", "2014", "0.72");
insert into car_reference_year values ("투싼", "2013", "0.7");
insert into car_reference_year values ("투싼", "2012", "0.7");
insert into car_reference_year values ("싼타페", "2016", "0.77");
insert into car_reference_year values ("싼타페", "2015", "0.75");
insert into car_reference_year values ("싼타페", "2014", "0.72");
insert into car_reference_year values ("싼타페", "2013", "0.7");
insert into car_reference_year values ("싼타페", "2012", "0.7");
insert into car_reference_year values ("베뉴", "2019", "0.9");
insert into car_reference_year values ("베뉴", "2018", "0.85");
insert into car_reference_year values ("베뉴", "2017", "0.8");
insert into car_reference_year values ("베뉴", "2016", "0.77");
insert into car_reference_year values ("베뉴", "2015", "0.75");
insert into car_reference_year values ("베뉴", "2014", "0.72");
insert into car_reference_year values ("베뉴", "2013", "0.7");
insert into car_reference_year values ("베뉴", "2012", "0.7");
insert into car_reference_year values ("코나", "2017", "0.8");
insert into car_reference_year values ("코나", "2016", "0.77");
insert into car_reference_year values ("코나", "2015", "0.75");
insert into car_reference_year values ("코나", "2014", "0.72");
insert into car_reference_year values ("코나", "2013", "0.7");
insert into car_reference_year values ("코나", "2012", "0.7");
insert into car_reference_year values ("펠리세이드", "2021", "1");
insert into car_reference_year values ("펠리세이드", "2020", "0.95");
insert into car_reference_year values ("펠리세이드", "2019", "0.9");
insert into car_reference_year values ("펠리세이드", "2018", "0.85");
insert into car_reference_year values ("펠리세이드", "2017", "0.8");
insert into car_reference_year values ("펠리세이드", "2016", "0.77");
insert into car_reference_year values ("펠리세이드", "2015", "0.75");
insert into car_reference_year values ("펠리세이드", "2014", "0.72");
insert into car_reference_year values ("펠리세이드", "2013", "0.7");
insert into car_reference_year values ("펠리세이드", "2012", "0.7");
insert into car_reference_year values ("스타렉스", "2021", "1");
insert into car_reference_year values ("스타렉스", "2020", "0.95");
insert into car_reference_year values ("스타렉스", "2019", "0.9");
insert into car_reference_year values ("스타렉스", "2018", "0.85");
insert into car_reference_year values ("스타렉스", "2017", "0.8");
insert into car_reference_year values ("스타렉스", "2016", "0.77");
insert into car_reference_year values ("스타렉스", "2015", "0.75");
insert into car_reference_year values ("스타렉스", "2014", "0.72");
insert into car_reference_year values ("스타렉스", "2013", "0.7");
insert into car_reference_year values ("스타렉스", "2012", "0.7");
insert into car_reference_year values ("i30", "2020", "0.95");
insert into car_reference_year values ("i30", "2019", "0.9");
insert into car_reference_year values ("i30", "2018", "0.85");
insert into car_reference_year values ("i30", "2017", "0.8");
insert into car_reference_year values ("i30", "2016", "0.77");
insert into car_reference_year values ("i30", "2015", "0.75");
insert into car_reference_year values ("i30", "2014", "0.72");
insert into car_reference_year values ("i30", "2013", "0.7");
insert into car_reference_year values ("i30", "2012", "0.7");
insert into car_reference_year values ("i40", "2019", "0.9");
insert into car_reference_year values ("i40", "2018", "0.85");
insert into car_reference_year values ("i40", "2017", "0.8");
insert into car_reference_year values ("i40", "2016", "0.77");
insert into car_reference_year values ("i40", "2015", "0.75");
insert into car_reference_year values ("i40", "2014", "0.72");
insert into car_reference_year values ("i40", "2013", "0.7");
insert into car_reference_year values ("i40", "2012", "0.7");
insert into car_reference_year values ("제네시스g70", "2021", "1");
insert into car_reference_year values ("제네시스g70", "2020", "0.95");
insert into car_reference_year values ("제네시스g70", "2019", "0.9");
insert into car_reference_year values ("제네시스g70", "2018", "0.85");
insert into car_reference_year values ("제네시스g70", "2017", "0.8");
insert into car_reference_year values ("제네시스g80", "2021", "1");
insert into car_reference_year values ("제네시스g80", "2020", "0.95");
insert into car_reference_year values ("제네시스g90", "2021", "1");
insert into car_reference_year values ("제네시스g90", "2020", "0.95");

-- estimate 페이지 car_reference_distance 테이블 dummy 데이터
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

-- estimate 페이지 car_reference_accident 테이블 dummy 데이터
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