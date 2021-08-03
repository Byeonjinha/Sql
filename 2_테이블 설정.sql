#날짜 : 2021-08-03
#이름 : 변진하
#내용 : 테이블 설정

#실습하기 2-1
CREATE TABLE `USER2` (
 `uid` VARCHAR(10) PRIMARY KEY,
 `name` VARCHAR(10),
 `hp` CHAR(13),
 `age` INT
 );
 
 
INSERT `USER2` VALUES ('A101','김유신','010-1234-1111',25);
INSERT `USER2` VALUES ('A102','김춘추','010-1234-2222',23);
INSERT `USER2` VALUES ('A103','장보고','010-1234-3333',32);

#실습하기 2-2
CREATE TABLE `USER3` (
 `uid` VARCHAR(10) PRIMARY KEY,
 `name` VARCHAR(10),
 `hp` CHAR(13) UNIQUE,
 `age` INT
 );
 
INSERT `USER3` VALUES ('A104','김유신','010-1234-4444',25);
INSERT `USER3` VALUES ('A102','김춘추','010-1234-2222',23);
INSERT `USER3` VALUES ('A103','장보고','010-1234-3333',32);

#실습하기 2-3
CREATE TABLE `USER5` (

`seq`		INT AUTO_INCREMENT PRIMARY KEY,
`name` 	VARCHAR(10),USER6
`gender` TINYINT,
`age` 	INT,
`addr`	VARCHAR(255)
);

#실습하기 2-4
CREATE TABLE `USER6` LIKE `USER5`;

#실습하기 2-5
INSERT INTO `USER6` SELECT*FROM `USER5`;
INSERT INTO `USER6` (`name`,`gender`,`age`,`addr`)
SELECT `name`,`gender`,`age`,`addr` FROM `USER5`;
