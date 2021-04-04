CREATE DATABASE chacarge;
USE chacarge;

CREATE TABLE `User` (
 `user_seq` int NOT NULL primary key auto_increment,
 `user_id` varchar(15) NOT NULL,
 `user_password` varchar(100) NULL,
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
 `board_subject` varchar(200) NOT NULL,
 `board_content` varchar(10000) NOT NULL,
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

-- windows의 mariadb는 대소문자 구분 안해서 만들때 유의
-- linux의 mariadb에서는 대소문자를 구분 할 것이므로 sql문 작성할때 대소문자 구분 잘하기

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
insert into board values (0, 
'아반떼AD 등급A41.6 모던', 
'<p><b>차종 :현대 아반떼AD 1.6 모던</b></p> 
<p><b>출고 연도 :2018</b></p> 
<p><b>운행 거리 :33,945km</b></p>
<p><b>사고 정도 :경미</b></p> 
<p><b>판매 가격 :1,440만원</b></p><br> 
<p>지금 보시는 2018년식 아반떼AD 차량을 정직하게 소개해 드릴게요. 이 차량은 A4 등급으로, 주행거리는 33,945Km로 최상의 운행 품질을 갖춘 차량이에요.</p>', 
0, '2021-03-17', 5);
insert into board values (0, 
'G70 등급A2+2.0 가솔린 터보 2WD 엘리트', 
'<p><b>차종 :G70</b></p> 
<p><b>출고 연도  2019</b></p> 
<p><b>운행 거리 :18,513Km</b></p> 
<p><b>사고 정도 :무사고</b></p> 
<p><b>판매 가격 :3,630만원</b></p> 
<p> 지금 보시는 2019년식 G70 차량을 정직하게 소개해 드릴게요. 이 차량은 A2+ 등급, 주행거리는 18,513Km로 최상의 운행 품질을 갖춘 신차급 차량이에요.</p>', 
0, '2021-03-17', 6);
insert into board values (0, 
'G80 등급A3+3.3 가솔린 AWD 프레스티지', 
'<p><b>차종 :G80</b></p> 
<p><b>출고 연도 :2019</b></p> 
<p><b>운행 거리 :28,751Km</b></p> 
<p><b>사고 정도 :무사고</b></p> 
<p><b>판매 가격 :4,480만원</b></p> 
<p> 지금 보시는 2019년식 G80 차량을 정직하게 소개해 드릴게요. 이 차량은 A3+ 등급, 주행거리는 28,751Km로 최상의 운행 품질을 갖춘 신차급 차량이에요.</p>', 
0, '2021-03-16', 7);
insert into board values (0, 
'G90 등급B5+3.8 가솔린 AWD 프레스티지', 
'<p><b>차종 :G90</b></p> 
<p><b>출고 연도 :2019</b></p> 
<p><b>운행 거리 :43,443Km</b></p> 
<p><b>사고 정도 :경미</b></p> 
<p><b>판매 가격 :7,760만원</b></p> 
<p>금 보시는 2019년식 G90 차량을 정직하게 소개해 드릴게요.이 차량은 B5+ 등급으로, 주행거리는 43,443Km로 양호한 운행 품질을 갖춘 차량이에요.</p>' , 
0, '2021-03-16', 8);
insert into board values (0, 
'더 뉴 그랜저 등급A1+3.3 가솔린 익스클루시브', 
'<p><b>차종 :더 뉴 그랜저</b></p> 
<p><b>출고 연도 :2020</b></p> 
<p><b>운행 거리 :5,740Km</b></p> 
<p><b>사고 정도 :무사고</b></p> 
<p><b>판매 가격 :3,630만원</b></p> 
<p>지금 보시는 2020년식 더 뉴 그랜저 차량을 정직하게 소개해 드릴게요.이 차량은 A1+ 등급, 주행거리는 5,740Km로 최상의 운행 품질을 갖춘 신차급 차량이에요.
주행 조향 보조시스템(LKAS), 블루링크, 스마트 크루즈 컨트롤, 메모리 시트 등의 옵션이 있습니다.</p>', 
0, '2021-03-15', 9);
insert into board values (0, 
'현대 i30 뉴 i30 디젤 1.6 VGT PYL', 
'<p><b>차종 :i30</b></p> 
<p><b>출고 연도 :2015</b></p> 
<p><b>운행 거리 :6,818km</b></p> 
<p><b>사고 정도 :무사고</b></p> 
<p><b>판매 가격 :170만원</b></p><br> 
<p>현재 2021년 03월 27일 토요일 매장에 전시 되어있고 판매중인 차량이예요 주말 공휴일 상관없이 당일출고 및 당일이전 보험가입 가능한 차량이에요</p>', 
0, '2021-03-15', 10);
insert into board values (0, 
'현대 더 뉴 i40 (15년~현재) 2.0 GDi PYL', 
'<p><b>차종 :현대 더 뉴 i40</b></p> 
<p><b>출고 연도 :2018</b></p> 
<p><b>운행 거리 :9,341km</b></p> 
<p><b>사고 정도 :무사고</b></p> 
<p><b>판매 가격 :200만원 </b></p><br> 
<p> 법인중고차안심센터상담)현대 더 뉴 i40 (15년~현재) 2.0 GDi PYL/18연식/200만</p>', 
0, '2021-03-14', 11);
insert into board values (0, 
'코나 등급B101.6 디젤 2WD 모던', 
'<p><b>차종 :코나</b></p> 
<p><b>출고 연도 :2018</b></p> 
<p><b>운행 거리 :36,884Km</b></p> 
<p><b>사고 정도 :무사고</b></p> 
<p><b>판매 가격 :1,480만원</b></p><br> 
<p>지금 보시는 2018년식 코나 차량을 정직하게 소개해 드릴게요.이 차량은 A4 등급으로, 주행거리는 36,884Km로 최상의 운행 품질을 갖춘 차량이에요.</p>', 
0, '2021-03-14', 12);
insert into board values (0, 
'현대 팰리세이드 3.8가솔린2WD 익스클루시브 (43구4479)', 
'<p><b>차종 :palisade</b></p> 
<p><b>출고 연도 :2019</b></p> 
<p><b>운행 거리 :41,000km</b></p> 
<p><b>사고 정도 :무사고</b></p> 
<p><b>판매 가격 :3,409만원</b></p><br> 
<p></p> 직영성능거점검장에서 81가지 차량점검 완료', 
0, '2021-03-14', 13);
insert into board values (0, 
'싼타페TM 등급A2+2.0 디젤 2WD 프리미엄 5인승', 
'<p><b>차종 :싼타페TM</b></p> 
<p><b>출고 연도 :2020</b></p> 
<p><b>운행 거리 :14,856Km</b></p> 
<p><b>사고 정도 :무사고</b></p> 
<p><b>판매 가격 :2,770만원</b></p><br> 
<p>지금 보시는 2020년식 싼타페TM 차량을 정직하게 소개해 드릴게요. 이 차량은 A2+ 등급, 주행거리는 14,856Km로 최상의 운행 품질을 갖춘 신차급 차량이에요</p>', 
0, '2021-03-13', 14);
insert into board values (0, 
'쏘나타(DN8) 등급A2+2.0 가솔린 프리미엄 패밀리', 
'<p><b>차종 :쏘나타(DN8)</b></p> 
<p><b>출고 연도 :2020</b></p> 
<p><b>운행 거리 :10,209Km</b></p> 
<p><b>사고 정도 :무사고</b></p> 
<p><b>판매 가격 :2,630만원</b></p><br> 
<p>지금 보시는 2020년식 쏘나타(DN8) 차량을 정직하게 소개해 드릴게요.이 차량은 A2+ 등급, 주행거리는 10,209Km로 최상의 운행 품질을 갖춘 신차급 차량이에요.</p>', 
0, '2021-03-13', 5);
insert into board values (0, 
'더 뉴 그랜드 스타렉스 등급A1+2.5 디젤 4WD 리무진 익스클루시브 6인승', 
'<p><b>차종 :더 뉴 그랜드 스타렉스</b></p> 
<p><b>출고 연도 : 2019년</b></p> 
<p><b>운행 거리 : 5,234Km</b></p> 
<p><b>사고 정도 :무사고</b></p> 
<p><b>판매 가격 : 5,050만원</b></p><br> 
<p>지금 보시는 2019년식 더 뉴 그랜드 스타렉스 차량을 정직하게 소개해 드릴게요.이 차량은 A1+ 등급, 주행거리는 5,234Km로 최상의 운행 품질을 갖춘 신차급 차량이에요.</p>',
0, '2021-03-12', 6);
insert into board values (0, 
'올 뉴 투싼 등급A8디젤 2.0 4WD 모던 스페셜', 
'<p><b>차종 :올 뉴 투싼</b></p> 
<p><b>출고 연도 :2021</b></p> 
<p><b>운행 거리 :70,981Km</b></p> 
<p><b>사고 정도 :무사고</b></p> 
<p><b>판매 가격 :1,840만원</b></p><br> 
<p> 지금 보시는 2017년식 올 뉴 투싼 차량을 정직하게 소개해 드릴게요.
이 차량은 A8 등급으로, 주행거리는 70,981Km로 최상의 운행 품질을 갖춘 차량이에요.</p>', 
0, '2021-03-12', 7);
insert into board values (0, 
'벨로스터 N 등급A1+2.0 가솔린 터보 퍼포먼스 패키지', 
'<p><b>차종 :벨로스터 N r</b></p> 
<p><b>출고 연도 :2011</b></p> 
<p><b>운행 거리 :3,528Km</b></p> 
<p><b>사고 정도 :무사고</b></p> 
<p><b>판매 가격 :3,330만원</b></p><br> 
<p>지금 보시는 2021년식 벨로스터 N 차량을 정직하게 소개해 드릴게요.
이 차량은 A1+ 등급, 주행거리는 3,528Km로 최상의 운행 품질을 갖춘 신차급 차량이에요.</p>', 
0, '2021-03-11', 8);
insert into board values (0, 
'베뉴 등급A1+1.6 가솔린 모던', 
'<p><b>차종 :베뉴</b></p> 
<p><b>출고 연도 :2020</b></p> 
<p><b>운행 거리 :8,732Km</b></p> 
<p><b>사고 정도 :무사고</b></p> 
<p><b>판매 가격 :1,750만원</b></p><br> 
<p>지금 보시는 2020년식 베뉴 차량을 정직하게 소개해 드릴게요.
이 차량은 A1+ 등급, 주행거리는 8,732Km로 최상의 운행 품질을 갖춘 신차급 차량이에요.</p>', 
0, '2021-03-11', 9);

-- board_comment 테이블 dummy 데이터
insert into board_comment values( 0, '아반떼 연비 좋나요', now(), 14, 1 );
insert into board_comment values( 0, '평균이에요', now(), 13, 1 );
insert into board_comment values( 0, '구매문의요', now(), 12, 2 );
insert into board_comment values( 0, '사고싶당', now(), 11, 2 );
insert into board_comment values( 0, 'g80 단점 있나요?', now(), 10, 3 );
insert into board_comment values( 0, '브랜드제외하면 e세그먼트중에 제일 낫다고봐요', now(), 9, 3 );
insert into board_comment values( 0, '휠로 예술하네', now(), 8, 4 );
insert into board_comment values( 0, '우와 이쁘네요', now(), 7, 4 );
insert into board_comment values( 0, '계기판이 에라', now(), 6, 5 );
insert into board_comment values( 0, '구매하고 싶어요', now(), 5, 5 );
insert into board_comment values( 0, '연식이 덜된차가 좋습니다.', now(), 14, 6 );
insert into board_comment values( 0, '운전하는 거 좋아하면 n라인 수동 1.6t 추천드립니다.', now(), 13, 6 );
insert into board_comment values( 0, 'i40 같은 중고차는 수리비가 더나올까요', now(), 12, 7 );
insert into board_comment values( 0, '안그래요', now(), 11, 7 );
insert into board_comment values( 0, '적당하네요 블박이 좋은거라', now(), 10, 8 );
insert into board_comment values( 0, '사고싶어요', now(), 9, 8 );
insert into board_comment values( 0, '진짜 디자인은 마름모랜져 이후로 최악이네요ㅎㅎㅎ', now(), 8, 9 );
insert into board_comment values( 0, '가성비 ㅎㄷㄷ인데', now(), 7, 9 );
insert into board_comment values( 0, '싼타페 디젤 괜찮나여', now(), 6, 10 );
insert into board_comment values( 0, '15년 20년 타실거 아니면 사셔도 아무 문제 없을듯요', now(), 5, 10);
insert into board_comment values( 0, '가성비는 프패트림인데', now(), 6, 11 );
insert into board_comment values( 0, '구매문의요', now(), 7, 11 );
insert into board_comment values( 0, '국민상용차 스타렉스', now(), 8, 12 );
insert into board_comment values( 0, '멋있당', now(), 9, 12 );
insert into board_comment values( 0, '비싼거 같아요 ㅎ', now(), 10, 13 );
insert into board_comment values( 0, '내가 산다면 화물차 세금적용 안받으면 좋겠네요', now(), 11, 13 );
insert into board_comment values( 0, '구매문의용', now(), 12, 14 );
insert into board_comment values( 0, '조선의 뽀르쉐*_*', now(), 13, 14 );
insert into board_comment values( 0, '베뉴 어떤가요', now(), 14, 15 );
insert into board_comment values( 0, '엑센트 실내에 전고만 높인차 느낌이었습니다 +_+', now(), 5, 15 );

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

-- board_comment 테이블 dummy 데이터
insert into board_comment values( 0, '123', now(), 1, 1 );
insert into board_comment values( 0, '456', now(), 1, 1 );

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