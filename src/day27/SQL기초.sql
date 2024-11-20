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







