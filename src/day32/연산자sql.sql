drop database if exists mydb1128;
create database mydb1128;
use mydb1128;

# 1. 회원테이블
drop table if exists member;
create table member(				# 아이돌 그룹
	mid char(8) not null ,			# 식별키 		최대 8자리
    mname varchar(10) not null ,	# 그룹명		최대 10자리
    mnumber int not null ,			# 인원수		정수 +-21억정도
    maddr char(2) not null , 		# 지역		최대 2자리
    mphone1 char(3) ,				# 지역번호	최대 2자리 
    mphone2 char(8) ,				# 전화번호 	최대 8자리
    mheight smallint ,				# 평균키 		정수 +-3만정도
	mdebut date ,					# 데뷔일 		yyyy-mm-dd 
    primary key ( mid )				# 제약조건 
);
# 2. 구매테이블
drop table if exists buy;
create table buy(
	bnum int auto_increment , 			# 구매번호	정수 	자동번호 부여 
    mid char(8),						# 구매자		FK 
    bpname char(6) not null ,			# 제품명		최대 6자리 
    bgname char(4) , 					# 분류명 		최대	4자리
    bprice int not null ,				# 가격 		정수 
    bamout smallint not null ,			# 구매수량	정수 
    primary key(bnum) ,					# 제약조건 
    foreign key ( mid ) references member(mid) # 제약조건 
);

# 샘플데이터 
INSERT INTO member VALUES('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015.10.19');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016.08.08');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015.01.15');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울', NULL, NULL, 160, '2015.04.21');
INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울', '02', '44444444', 168, '2007.08.02');
INSERT INTO member VALUES('ITZ', '잇지', 5, '경남', NULL, NULL, 167, '2019.02.12');
INSERT INTO member VALUES('RED', '레드벨벳', 4, '경북', '054', '55555555', 161, '2014.08.01');
INSERT INTO member VALUES('APN', '에이핑크', 6, '경기', '031', '77777777', 164, '2011.02.10');
INSERT INTO member VALUES('SPC', '우주소녀', 13, '서울', '02', '88888888', 162, '2016.02.25');
INSERT INTO member VALUES('MMU', '마마무', 4, '전남', '061', '99999999', 165, '2014.06.19');
INSERT INTO buy VALUES(NULL, 'BLK', '지갑', NULL, 30, 2);
INSERT INTO buy VALUES(NULL, 'BLK', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES(NULL, 'APN', '아이폰', '디지털', 200, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '아이폰', '디지털', 200, 5);
INSERT INTO buy VALUES(NULL, 'BLK', '청바지', '패션', 50, 3);
INSERT INTO buy VALUES(NULL, 'MMU', '에어팟', '디지털', 80, 10);
INSERT INTO buy VALUES(NULL, 'GRL', '혼공SQL', '서적', 15, 5);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 2);
INSERT INTO buy VALUES(NULL, 'APN', '청바지', '패션', 50, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 1);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 4);

# [1] 모든 필드의 테이블 조회 , 
select * from member; # 'member' 테이블의 모든 필드 표시 하는 모든 레코드 조회
select * from buy;	  # 'buy' 테이블의 모든 필드 표시 하는 모든 레코드 조회
# [2] 특정 필드의 테이블 조회 
select mid from member; # 'member' 테이블의 'mid' 필드 표시 하는 모든 레코드 조회
select mid , mname from member; # 'member' 테이블의 'mid' 와 'mname' 필드 표시 하는 모든 레코드 조회
# [3] as 별칭 , 조회 결과의 필드명을 부여 , 필드명 별칭 , as 생략가능
select mid as 회원아이디 from member;	# 'member' 테이블의 mid 필드를 '회원아이디'로 표시 하는 모든 레코드 조회 
select mid 회원아이디 from member m; # 'member' 테이블의 mid 필드를 '회원아이디' 로 표시 하는 모든 레코드 조회
# [4] 조건절 , where 
select * from member where mname = '블랙핑크'; #'member' 테이블의 모든 필드 표시 하는 mname이 블랙핑크인 레코드만 조회
select * from member where mnumber = 4;	#'member'테이블의 모든 필드 표시 하는 mnumber가 4 인 레코드만 조회
select * from member where mheight <= 162; # 'member' 테이블의 mheight 필드 값이 162 이하 인 레코드만 조회 
select * from member where mheight >= 165 and mheight <= 170; # 'mheight 필드 값이 165 이상 이면서 170 이하 인 레코드 조회 '
select * from member where mheight between 165 and 170; # 'mheight' 필드 값이 165 이상 이면서 170 이하 인 레코드 조회 '
select * from member where mheight >= 165 or mnumber > 6;  # 'mheight' 필드 값이 165 이상 이거나  'mnumber' 필드 값이 6 초과인 레코드 조회 
select * from member where maddr = '경기' or maddr ='전남' or maddr ='경남'; # 'maddr' 필드값이 '경기' 이거나 '전남' 이거나 '경남' 인 레코드 조회 
select * from member where maddr in( '경기' , '전남' , '경남' ); # 'maddr' 필드값이 '경기' 이거나 '전남' 이거나 '경남' 인 레코드 조회 
select * from member where maddr not in('경기','전남','경남');	# 'maddr' 필드값이 '경기' 이거나 '전남' 이거나 '경남' 이 아닌(부정) 레코드 조회 
select * from member where mname != '에이핑크';	# 'mname' 필드값이 에이핑크가 아닌 레코드 조회 
select * from member where not mname = '에이핑크';
select * from member where mname like '에이%';	# 'mname' 필드값이 에이 로 시작 하는 래코드 조회 
select * from member where mname like '%핑크';	# 'mname' 필드값이 핑크 로 끝나는 레코드 조회 
select * from member where mname like '%이%';	# 'mname' 필드값이 '이' 가 포함된 레코드 조회
select * from member where mname like '에이__';	# 'mname' 필드값이 '에이'로 시작하는 네글자 인 레코드 조회
select * from member where mname like '__핑크';	# 'mname' 필드값이 '핑크'로 끝나는 네글자 인 레코드 조회
select * from member where mname like '_이_';	# 'mname' 필드값이 두번째 글자가 '이' 세글자 인 레코드 조회 
select * from member where mphone1 = '';		# 'mphone1' 필드값이 ''공백인 레코드 조회
select * from member where mphone1 is null;		# ''공백 vs ' '띄어쓰기공백 vs null 모두 다른 데이터로 식별된다. 그러므로 null 조회시 is null
select * from member where mphone1 is not null 	# 'mphone1' 필드값이 null 아닌 레코드 조회 
/*연산자 
	1. 비교연산자 
		1.같다 : 필드명 = 비교값 , 지정한 필드명의 값이 비교값과 같으면 true 
		2.이하 : 필드명 <= 비교값 , 지정한 필드명의 값이 비교값 보다 이하 이면 true 
		3.이상 : 필드명 >= 비교값 , 지정한 필드명의 값이 비교값 보다 이상 이면 true 
	2. 관계연산자
		1. 이면서/면서/이고/그리고 :  조건1 and 조건2 
		2. 이거나/또는/하나라도   :  조건1 or 조건2
		3. 부정/반대			: not 조건		, 조건결과의 반대 , true -> false , false -> true 
	4. 기타연산자 
		- 필드명 between 시작값 and 끝값 	: 지정한 필드명의 값이 시작값과 끝값 사이이면 true 
		- 필드명 in( 값1 , 값2 , 값3 ) 	: 지정한 필드명의 값이 in 안에 있는 값이 하나라도 존재하면 true
        - 필드명 like 패턴 : 지정한 필드명의 값이 패턴과 일치하면 true
			- 패턴 
            1. % : 모든 문자수 대응 			, 김% : 김으로 시작하는 문자열 
            2. _ : _개수만큼 문자수 대응 		, 김_ : 김으로 시작하는 두글자인 문자열 
		- 필드명 is null	: 지정한 필드명의 값이 null 이면 true 
        - 필드명 is not null : 지정한 필드명의 값이 null 이 아니면 true 
*/


















