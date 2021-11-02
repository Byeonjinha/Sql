CREATE TABLE quetion68pg(`co1` INT ,`co2` INT, `co3` INT );

INSERT INTO quetion64pg  SET  `co1` = 1, `co2` = 2, `co3` = 3 ;
INSERT INTO quetion64pg  SET  `co2` = 2, `co3` = 3 ;
INSERT INTO quetion64pg  SET  `co3` = 3 ;


SELECT SUM(COALESCE(co1,co2,co3)) FROM quetion64pg;

UPDATE  quetion64pg SET `co1` = 1 WHERE `co1` IS NULL AND `co2` IS NOT NULL ;


DELETE  FROM quetion64pg WHERE `co1` = 1 ;