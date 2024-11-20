/* 여러줄 주석 */
# 한줄 주석 
-- 한줄 주석
/*
	[ SQL 작성 또는 실행 하는 방법 ]
    1. SQL 문법를 작성한다. 							show databases
    2. SQL 문장이 끝나면 ;(세미콜론)으로 마친다.  			show databases;
    3. 실행할 명령어 줄에 (마우스)커서 두고 ctrl+enter
		- ctrl+enter ( 번개모양의 I 있는 ) : 명령어 단위 실행 
        - ctrl+shitf+enter( 번개모양의 I 없는 ) : 현재 sql파일의 모든 sql 실행 
    4. 실행 결과는 하단에 [Result Grid] 창에서 확인 가능
*/
# [1] db server 내 모든 테이블 확인 # 데이터베이스란? 표/테이블 , 기본 테이블 4개의 테이블명이 출력된다.
show databases;
# [2] db server local path 확인 
show variables like 'datadir';
# [3] db server 데이터베이스 생성 
create database myDBtest1;  
# [4] db server 데이터베이스 삭제 
drop database myDBtest1; -- ctrl+enter[단위실행]
# [4-2] 만약에 데이터베이스가 존재 하면 삭제 
drop database if exists myDBtest1;
# [5] db server 에는 여러개 데이터베이스 가 존재하므로 사용/활성화 할 데이터베이스 선택 
use myDBtest1;

# [실습1] - 아래와 같이 순서대로 SQL문을 작성하여 실행하시오.
drop database if exists test1;		-- 1. 'test1' 이름의 데이터베이스가 존재하면 삭제하기 SQL 작성 
create database test1;    			-- 2. 'test1' 이름의 데이터베이스 생성하기 SQL 작성 
show databases;    					-- 3. 데이터베이스 목록 확인 SQL 작성 
show variables like 'datadir'; 		-- 4. 로컬PC에 데이터베이스가 만들어졌는지 경로 확인 SQL 작성 
use test1;							-- 5. 'test1' 이름의 데이터베이스 사용 활성화 하기 SQL 작성 

# 테이블 생성 과 타입 관련 
# [1] DB 생성 
create database mydb1120;
# [2] DB 활성화( 사용 )
use mydb1120;
# [3] 활성화된 DB 내 테이블 생성 
create table member( 아이디 text , 패스워드 text , 이름 text );
# [4] 활성화된 DB 내 테이블 목록 보기 
show tables;
# [5] 테이블 삭제 
drop table member;
drop table if exists member; -- 사용 권장 

/*
	[ 용어 , 관점 차이에 따른 용어 ]
		파일시스템관점		모델링관점		관계형관점
        - 파일			엔티티		테이블, 릴레이션 	
		- 레코드			튜플 		행(가로)
		- 필드			속성			열(세로)
        1. 테이블(table) : 표 , 릴레이션( Relation ) , 엔티티( Entity )
		2. 레코드(Record) : 튜플(tuple) , 행(row) , 가로 1줄 단위 
        3. 필드(Field)	: 속성(Attribute) , 열(column) , 세로 1줄 단위
        
	[ 테이블 생성시 필드(데이터) 타입 = JAVA의 데이터타입 역할 이 같다. oracle vs mysql ]
		[ 정수 ] 
			TINYINT		1바이트	-128 ~ 127
            SMALLINT	2바이트 	+-3만정도 
            MEDIUMINT	3바이트	+-800만정도 
            INT			4바이트	+-21억정도 
            BIGINT 		8바이트	+-21억이상 
		[ 실수 = 부동소수점 , 오차 존재 ] 
			FLOAT		4바이트 
            DOUBLE		8바이트 
		[ 문자타입 으로 저장되는 숫자 , 오차 없는 실수 표현 ]
			DECIMAL		
		[ 날짜 / 시간 ]
			DATE		날짜 표현 , ( 1000년 ~ 9999년 ) , 0000-00-00
            DATETIME	날짜 와 시간 표현 , 0000-00-00 00:00:00
			TIME		시간 표현 , 00:00:00
		[ 문자열 ]
			1. CHAR( 문자길이 )		: 고정길이  , 최대 1~255글자 , char(5) --> "유재석" --> [유][재][석][ ] [ ] 2칸이 남는다.  
            2. VARCHAR( 문자길이 )		: 가변길이  , 최대 1~255글자 , varchar(5) --> "유재석" --> [유][재][석] 남은 칸은 사용하지 않는다.
			3. TEXT					: 최대길이 6만개 글자 표현 
            4. LONGTEXT				: 최대길이 42억개 글자 표현 ( 4GB )
		[ 논리 ]
			1. BOOL					: true 혹은 false 표현 , 실제로는 0 또는 1로 표현된다.
*/
# 테이블 예제1 
use mydb1120;
# 게시물 테이블
# 1. 게시물의 내용물은 많은 양의 데이터를 저장할 예정이라서 longtext 타입 선택 하고 속성명은 content 
# 2. 게시물의 작성자는 아이디 이므로 적당한 길의 최대 30글자로 받을 예정 이라서 varchar(30) 가변길이의 타입 속성 선택하고 속성명은 writer 
# 3. 게시물의 비밀번호는 숫자로 받을 예정 이라서 적정한 정수 타입의 int 타입 속성 선택하고 속성명은 pwd 
create table board( content longtext , writer varchar(30) , pwd int );
# 테이블의 내용물/레코드 확인 
select * from board; # 테이블은 존재하지만 아직 데이터가 없다
drop table if exists board; # 테이블 삭제 

# 테이블 예제2 







 









