SELECT A.`고객ID`, B.`고객ID`
FROM `고객` A FULL OUTER JOIN `시간대별 사용량` B
ON A.`고객ID` = B.`고객ID`


SELECT A.`고객ID`, B.`고객ID`
FROM `고객` A LEFT OUTER JOIN `시간대별 사용량` B
ON A.`고객ID` = B.`고객ID`
UNION
SELECT A.`고객ID`, B.`고객ID`
FROM `고객` A RIGHT OUTER JOIN `시간대별 사용량` B
ON A.`고객ID` = B.`고객ID`

SELECT a.id, b.id
FROM `고객` A , `시간대별 사용량` B
WHERE A.ID= B.ID
UNION ALL
SELECT A.ID, NULL
FROM `고객` A
WHERE NOT EXISTS (SELECT 1 FROM `시간대별 사용량` B WHERE A.`고객ID` = B.`고객ID`)
UNION ALL
SELECT NULL, B.고객ID
FROM 시간대별 사용량 B
WHERE NOT EXISTS (SELECT 1 FROM `고객` A WHERE B.`고객ID` = A.`고객ID`)

INSERT INTO `고객` SET 고객ID = 5, 고객명 = '테스트' , 생년월일 = '1997:03:30';