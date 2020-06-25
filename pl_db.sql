delimiter $$

CREATE TABLE `club` (
  `clubid` char(3) NOT NULL,
  `clubname` varchar(50) DEFAULT NULL,
  `currentmanager` varchar(50) DEFAULT NULL,
  `leagueposition` varchar(2) NOT NULL,
  PRIMARY KEY (`clubid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci$$

delimiter $$

CREATE TABLE `clubmatch` (
  `clubid` char(3) NOT NULL,
  `matchid` int NOT NULL,
  `result` char(1) DEFAULT NULL,
  `score` varchar(50) DEFAULT NULL,
  `side` char(4) DEFAULT NULL,
  `season` year DEFAULT NULL,
  PRIMARY KEY (`clubid`,`matchid`),
  KEY `fk_ck5` (`matchid`),
  CONSTRAINT `fk_ck4` FOREIGN KEY (`clubid`) REFERENCES `club` (`clubid`),
  CONSTRAINT `fk_ck5` FOREIGN KEY (`matchid`) REFERENCES `game` (`matchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci$$

delimiter $$

CREATE TABLE `game` (
  `matchid` int NOT NULL,
  `matchtitle` varchar(50) DEFAULT NULL,
  `stadiumname` varchar(50) DEFAULT NULL,
  `hometeam` varchar(50) DEFAULT NULL,
  `awayteam` varchar(50) DEFAULT NULL,
  `homescore` int DEFAULT NULL,
  `awayscore` int DEFAULT NULL,
  `motm` varchar(50) DEFAULT NULL,
  `gamedate` date DEFAULT NULL,
  PRIMARY KEY (`matchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci$$

delimiter $$

CREATE TABLE `player` (
  `playerid` int NOT NULL,
  `clubid` char(3) NOT NULL,
  `positiontype` varchar(3) DEFAULT NULL,
  `playername` varchar(255) DEFAULT NULL,
  `playerno` varchar(3) DEFAULT NULL,
  `playerage` int DEFAULT NULL,
  `wage` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`playerid`),
  KEY `fk_ck6` (`clubid`),
  CONSTRAINT `fk_ck6` FOREIGN KEY (`clubid`) REFERENCES `club` (`clubid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci$$

delimiter $$

CREATE TABLE `playermatchstat` (
  `playerid` int NOT NULL,
  `ingamepos` varchar(3) DEFAULT NULL,
  `matchid` int NOT NULL,
  `goals` int DEFAULT NULL,
  `shots` int DEFAULT NULL,
  `shotsontarget` int DEFAULT NULL,
  `assists` int DEFAULT NULL,
  `chancescreated` int DEFAULT NULL,
  PRIMARY KEY (`playerid`,`matchid`),
  KEY `fk_ck8` (`matchid`),
  KEY `fk_ck9` (`ingamepos`),
  CONSTRAINT `fk_ck3` FOREIGN KEY (`playerid`) REFERENCES `player` (`playerid`),
  CONSTRAINT `fk_ck8` FOREIGN KEY (`matchid`) REFERENCES `game` (`matchid`),
  CONSTRAINT `fk_ck9` FOREIGN KEY (`ingamepos`) REFERENCES `playerposition` (`positionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci$$

delimiter $$

CREATE TABLE `playerposition` (
  `positionid` varchar(3) NOT NULL,
  `positiontype` varchar(3) NOT NULL,
  `positionname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`positionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci$$

delimiter $$

CREATE TABLE `transferrecord` (
  `transferid` int NOT NULL,
  `playerid` int NOT NULL,
  `clubid` char(3) NOT NULL,
  `transferin` varchar(50) NOT NULL,
  `transferout` varchar(50) NOT NULL,
  `transferdate` date DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`transferid`,`playerid`,`clubid`),
  KEY `fk_ck1` (`clubid`),
  KEY `fk_ck2` (`playerid`),
  CONSTRAINT `fk_ck1` FOREIGN KEY (`clubid`) REFERENCES `club` (`clubid`),
  CONSTRAINT `fk_ck2` FOREIGN KEY (`playerid`) REFERENCES `player` (`playerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci$$



