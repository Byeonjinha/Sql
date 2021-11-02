CREATE TABLE `시간대구간` (
	`시작시간대` TIME,
	`종료시간대` TIME,
	`단가` INT
	
);
INSERT INTO `시간대구간` SET `시작시간대` = '08:00:00' , `종료시간대` =  '09:00:00' , `단가` = 2400;
INSERT INTO `시간대구간` SET `시작시간대` = '09:00:00' , `종료시간대` =  '10:00:00' , `단가` = 2500;
INSERT INTO `시간대구간` SET `시작시간대` = '10:00:00' , `종료시간대` =  '11:00:00' , `단가` = 2600;
INSERT INTO `시간대구간` SET `시작시간대` = '11:00:00' , `종료시간대` =  '12:00:00' , `단가` = 2700;
INSERT INTO `시간대구간` SET `시작시간대` = '12:00:00' , `종료시간대` =  '13:00:00' , `단가` = 2800;

CREATE TABLE `시간대별 사용량` (
	`고객ID` INT,
	`사용시간대` TIME,
	`사용량` int
	);
INSERT INTO  `시간대별 사용량` SET `고객ID` = 1 , `사용시간대` = '08:00:00' , `사용량`=3000;
INSERT INTO  `시간대별 사용량` SET `고객ID` = 2 , `사용시간대` = '08:00:00' , `사용량`=5000;
INSERT INTO  `시간대별 사용량` SET `고객ID` = 3 , `사용시간대` = '09:00:00' , `사용량`=2000;
INSERT INTO  `시간대별 사용량` SET `고객ID` = 4 , `사용시간대` = '10:00:00' , `사용량`=1800;	
	
	
CREATE TABLE `고객` (
`고객ID` INT,
`고객명` VARCHAR(20),
`생년월일` DATE 
);
INSERT INTO `고객` SET `고객ID` = 1 , `고객명` = '김철수' , `생년월일`='1990-09-23';
INSERT INTO `고객` SET `고객ID` = 2 , `고객명` = '김철순' , `생년월일`='1991-09-24';
INSERT INTO `고객` SET `고객ID` = 3 , `고객명` = '김철숙' , `생년월일`='1992-09-25';
INSERT INTO `고객` SET `고객ID` = 4 , `고객명` = '김철선' , `생년월일`='1993-09-26';

SELECT A.고객ID, A.고객명, SUM(B.사용량* C.단가) AS 사용금액 FROM 고객 A INNER JOIN `시간대별 사용량` B
ON (A.`고객ID` = B.`고객ID`) INNER JOIN 시간대구간 C
ON (B.사용시간대 <= C 시작시간대 AND  B.사용시간대 >= C.`종료시간대`)
GROUP BY A.`고객ID`, A.`고객명`
ORDER BY A.`고객ID`, A.`고객명`;



SELECT A.고객ID, A.고객명, SUM(B.사용량* C.단가) AS 사용금액 
FROM 고객 A INNER JOIN `시간대별 사용량` B INNER JOIN 시간대구간 C
ON (A.`고객ID` = B.`고객ID` AND B.사용시간대
	 BETWEEN C.`시작시간대` AND C.`종료시간대`)
GROUP BY A.`고객ID`, A.`고객명`
ORDER BY A.`고객ID`, A.`고객명`;


SELECT A.고객ID, A.고객명, SUM(B.사용량* C.단가) AS 사용금액 
FROM 고객 A INNER JOIN `시간대별 사용량` B
ON (A.`고객ID` = B.`고객ID`) INNER JOIN 시간대구간 C
ON B.사용시간대 BETWEEN C.`시작시간대` AND C.`종료시간대`
GROUP BY A.`고객ID`, A.`고객명`
ORDER BY A.`고객ID`, A.`고객명`;