CREATE TABLE quetion63pg(`co1` VARCHAR(25) ,`co2` INT );

INSERT INTO quetion63pg  SET  `co1` = 'a';
INSERT INTO quetion63pg  SET  `co1` = 'b', `co2` ='';
INSERT INTO quetion63pg  SET  `co1` = 'c', `co2` = 3;
INSERT INTO quetion63pg  SET  `co1` = 'd', `co2` = 4;
INSERT INTO quetion63pg  SET  `co1` = 'e', `co2` = 3;


#1
SELECT co2 FROM quetion63pg WHERE co1 = 'b';
#2
SELECT IFNULL(co2,'x') FROM quetion63pg WHERE co1 = 'a';
#3
SELECT COUNT(co1) FROM quetion63pg WHERE co2 = NULL;
#4
SELECT COUNT(co2) FROM quetion63pg WHERE co1 IN ('b','c');