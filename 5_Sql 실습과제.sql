#1 다음과 같은 속성을 가진 Book 테이블을 생성 후 그림과 같이 데이터를 삽입하시오.
CREATE TABLE `Book` (
`bookid` 	INT PRIMARY KEY,
`bookname`	VARCHAR(20),
`publisher`	VARCHAR(20),
`price` 		INT (10) 
);

INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book VALUES(2, '축구 아는 여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '역도 단계별 기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

#2 다음과 같은 속성을 가진 Customer 테이블을 생성 후 그림과 같이 데이터를 삽입하시오.
CREATE TABLE `Customer` (
`custid` 	INT PRIMARY KEY,
`name`		VARCHAR(20),
`address`	VARCHAR(30),
`phone` 		char (13) 
);
INSERT INTO Customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO Customer VALUES (5, '박세리', '대한민국 대전',  NULL);

#3 다음과 같은 속성을 가진 Orders 테이블을 생성 후 그림과 같이 데이터를 삽입하시오.
CREATE TABLE `Orders` (
	`orderid`		INT AUTO_INCREMENT PRIMARY KEY,
	`custid`			INT,
	`bookid`			INT,
	`saleprice`		INT,
	`orderdate`		DATE
);



INSERT INTO Orders VALUES (1, 1,  1, 6000, '2014-07-01'); 
INSERT INTO Orders VALUES (2, 1,3, 21000, '2014-07-03');
INSERT INTO Orders VALUES (3, 2, 5, 8000, '2014-07-03'); 
INSERT INTO Orders VALUES (4, 3, 6, 6000, '2014-07-04'); 
INSERT INTO Orders VALUES (5, 4, 7, 20000, '2014-07-05');
INSERT INTO Orders VALUES (6, 1, 2, 12000, '2014-07-07');
INSERT INTO Orders VALUES (7, 4, 8, 13000, '2014-07-07');
INSERT INTO Orders VALUES (8, 3, 10, 12000, '2014-07-08'); 
INSERT INTO Orders VALUES (9, 2, 10, 7000, '2014-07-09'); 
INSERT INTO Orders VALUES (10, 3, 8, 13000, '2014-07-10');




#4 모든 회원의 회원번호, 이름, 주소를 검색하시오.
SELECT `custid`, `name`, `address` FROM `Customer`;
#5 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오
SELECT `bookid`, `bookname`, `publisher`, `price` FROM `Book`;
#6 도서 테이블에 있는 모든 출판사를 검색하시오
#DISTINCT 삽입시 중복값 제거
SELECT  `publisher` FROM `Book`;




#7 가격이 20,000원 미만인 도서를 검색하시오.
SELECT * FROM `Book` WHERE `price` <20000;

#8 가격이 10,000원 이상 20,000 이하인 도서를 검색하시오.
SELECT * FROM `Book` WHERE `price` >= 10000 && `price` <=20000;

#9 출판사가 `굿스포츠` 혹은 `대한미디어`인 도서를 검색하시오.
SELECT*FROM `Book` 	WHERE `publisher` = '굿스포츠' OR `publisher` = '대한미디어';
SELECT*FROM `Book` 	WHERE `publisher` IN('굿스포츠', '대한미디어');

#10 '축구의 역사' 를 출간한 출판사를 검색하시오.
SELECT `publisher` FROM `Book` WHERE `bookname` = '축구의 역사';

#11 '축구'가 포함된 출판사를 검색하시오.
SELECT `publisher` FROM `Book` WHERE `bookname` LIKE  '%축구%';

#12 도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서를 검색하시오.

SELECT * FROM `Book` WHERE `bookname` LIKE  '_구%';

#13 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오.

SELECT * FROM `Book` WHERE `bookname` LIKE  '%축구%' AND `price` >= 20000;

#14 도서를 이름순으로 검색하시오.
SELECT * FROM `Book` ORDER BY `bookname` ASC;

#15 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오.
SELECT * FROM `Book` ORDER BY `price` , `bookname` ASC ;

#16 도서를 가격의 내림차순으로 검색하시오. 만약 가격이 같다면 출판사의 오름차순으로 검색하시오.
SELECT * FROM `Book` ORDER BY `price` DESC , `publisher` ASC ;

#17 고객이 주문한 도서의 총 판매액을 구하시오.
SELECT SUM(saleprice) FROM `Orders` ;

#18 2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오.
SELECT SUM(saleprice) AS 총매출  FROM `Orders`  WHERE  custid =2;

#19 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 구하시오.
SELECT SUM(saleprice) AS 총판매액,
AVG(saleprice) AS 평균값,
MIN(saleprice) AS 최저가,
MAX(saleprice) AS 최고가
FROM `Orders` ;


#20 도서판매 건수를 구하시오.
select COUNT(*) AS 판매건수  FROM `Orders`; 

#21 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 단, 두 권 이상 구매한 고객만 구한다.
SELECT custid, COUNT(*) AS `수량`
FROM `Orders`
WHERE saleprice >= 8000
GROUP BY custid
HAVING `수량` >= 2;

#22 고객과 고객의 주문에 관한 데이터를 모두 보이시오.
SELECT *
FROM `Customer`, `Orders`
WHERE `Customer`.`custid` =`Orders`.`custid`;

#23 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 보이시오.
SELECT *
FROM `Customer`, `Orders`
WHERE `Customer`.`custid` =`Orders`.`custid`
ORDER BY `Customer`.`custid`;

#24 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
SELECT `name`, `saleprice`
FROM `Customer`, `Orders`
WHERE `Customer`.`custid` =`Orders`.`custid`;
#25 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.
SELECT `name`, SUM(saleprice)
FROM `Customer`, `Orders`
WHERE `Customer`.`custid` =`Orders`.`custid`
GROUP BY `Customer`.`name`
ORDER BY `Customer`.`name`;

#26 고객의 이름과 고객이 주문한 도서의 이름을 조회하시오.
SELECT `Customer`.`name`, `Book`.`bookname`
FROM `Customer`, `Orders`, `Book`
WHERE `Customer`.`custid` =`Orders`.`custid` AND `Orders`.`bookid` =`Book`.`bookid`;
#27 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 조회하시오
SELECT `Customer`.`name`, `Book`.`bookname`
FROM `Customer`, `Orders`, `Book`
WHERE `Customer`.`custid` =`Orders`.`custid` AND `Orders`.`bookid` =`Book`.`bookid`
AND `Orders`.`saleprice` =20000;

#28 가장 비싼 도서의 이름을 조회하시오.
SELECT `bookname`
FROM `Book`
WHERE `price` = (SELECT MAX(`price`) 
FROM `Book`);
#29 Book 테이블에 새로운 도서 '스포츠 의학'을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 90,000원이다.
INSERT INTO `Book` VALUES (11, "스포츠 의학", "한솔의학서적",90000);

#30 Book 테이블에 새로운 도서 '스포츠 의학'을 삽입하사ㅣ오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 미정이다.
INSERT INTO `Book` VALUES (12, "스포츠 의학", "한솔의학서적",null);

#31 Customer 테이블에섯 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 변경하시오.
UPDATE `Customer`
SET `address`='대한민국 부산'
WHERE `custid`=5;


#32 Customer 테이블에서 고객번호가 5인 고객을 삭제하시오.

DELETE
FROM `Customer`
WHERE `custid`=5;








