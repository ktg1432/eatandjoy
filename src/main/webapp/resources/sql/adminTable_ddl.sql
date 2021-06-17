-- tbl_product 생성
CREATE TABLE `tbl_product` (
	`pId` INT(4) NOT NULL AUTO_INCREMENT,
	`pName` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`pDesc` VARCHAR(500) NOT NULL DEFAULT 'current_timestamp()' COLLATE 'utf8_general_ci',
	`pPrice` INT(100) NOT NULL,
	`pRegDate` DATE NOT NULL DEFAULT current_timestamp(),
	`pUpdateDate` DATE NOT NULL DEFAULT current_timestamp(),
	`hit` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`pId`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1
;

-- tbl_notice 생성
CREATE TABLE `tbl_notice` (
	`nId` INT(4) NOT NULL AUTO_INCREMENT,
	`nTitle` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`nContent` VARCHAR(400) NOT NULL COLLATE 'utf8_general_ci',
	`nWriter` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`nRegDate` DATE NULL DEFAULT current_timestamp(),
	`nUpdateDate` DATE NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`nId`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1
;


--tbl_pattach 생성
CREATE TABLE `tbl_pattach` (
	`uuid` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`uploadPath` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`fileName` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`fileType` CHAR(1) NOT NULL DEFAULT 'I' COLLATE 'utf8_general_ci',
	`pId` INT(4) NOT NULL,
	PRIMARY KEY (`uuid`) USING BTREE,
	INDEX `FK_tbl_pattach_tbl_product` (`pId`) USING BTREE,
	CONSTRAINT `FK_tbl_pattach_tbl_product` FOREIGN KEY (`pId`) REFERENCES `db`.`tbl_product` (`pId`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

-- tbl_notice dummy Data
BEGIN
DECLARE i INT DEFAULT 1;
        
    WHILE i <= 500 DO
        INSERT INTO tbl_notice(nTitle , nContent, nWriter)
          VALUES(concat('제목',i), concat('내용',i), 'Admin');
        SET i = i + 1;
    END WHILE;
END

-- tbl_product dummy Data
 BEGIN
DECLARE i INT DEFAULT 1;
        
    WHILE i <= 100 DO
        INSERT INTO tbl_product(pName, pDesc, pPrice)
          VALUES(concat('상품',i), concat('내용',i), 10000);
        SET i = i + 1;
    END WHILE;
END