--다음의 순서를 따라주세요

--01 테이블 생성 및 dummy 데이터 입력
	readme 폴더의 table.sql 내용을 mysql 에 복사, 붙여넣기, 실행

--02 user 테이블 dummy 데이터 입력
	src/main/java 의 net.chacarge.util 의 UserJoin.java 실행
		(run as - java application)
		
--03 자동차 image dummy 데이터 입력
	readme 폴더의 image.7z 의 이미지를 저장할 필요 있음
	
----01 Windows 환경의 경우
		C:\\upload\ 폴더에 더미 이미지를 저장, 게시판 글 작성시 업로드 위치

		Servers-Tomcat-server.xml 파일 맨 아래쪽에서 추가
		<host> 안에 저장
			<Context docBase="C:\upload" path="/img" reloadable="true"/>
		</host>
	
----02 리눅스 서버 환경에서는 경로를 변경해 줘야함

--기본 세팅이 완료되었습니다.