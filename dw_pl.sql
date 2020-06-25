delimiter $$


CREATE TABLE `dim_club` (
  `dim_clubid` int NOT NULL,
  `clubid` char(3) NOT NULL,
  `clubname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dim_clubid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci$$

delimiter $$

CREATE TABLE `dim_clubmatch` (
  `dim_clubmatchid` varchar(3) NOT NULL,
  `clubid` char(3) NOT NULL,
  `matchid` int NOT NULL,
  `result` char(1) DEFAULT NULL,
  PRIMARY KEY (`dim_clubmatchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci$$

delimiter $$

CREATE TABLE `dim_game` (
  `dim_matchid` int NOT NULL,
  `hometeam` varchar(50) DEFAULT NULL,
  `awayteam` varchar(50) DEFAULT NULL,
  `gamedate` date DEFAULT NULL,
  `matchid` int NOT NULL,
  PRIMARY KEY (`dim_matchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci$$

delimiter $$

CREATE TABLE `dim_player` (
  `dim_playerid` int NOT NULL,
  `playername` varchar(255) DEFAULT NULL,
  `playerid` int DEFAULT NULL,
  PRIMARY KEY (`dim_playerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci$$

delimiter $$

CREATE TABLE `dim_playerposition` (
  `dim_positionid` int NOT NULL,
  `positiontype` varchar(3) NOT NULL,
  `positionname` varchar(50) DEFAULT NULL,
  `positionid` varchar(3) NOT NULL,
  PRIMARY KEY (`dim_positionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci$$

delimiter $$

CREATE TABLE `dim_time` (
  `dim_timeid` int NOT NULL AUTO_INCREMENT,
  `dt` date DEFAULT NULL,
  `yr` smallint DEFAULT NULL,
  `mth` smallint DEFAULT NULL,
  `dy` smallint DEFAULT NULL,
  `wk` smallint DEFAULT NULL,
  `mth_name` char(3) DEFAULT NULL,
  `day_name` char(10) DEFAULT NULL,
  PRIMARY KEY (`dim_timeid`)
) ENGINE=InnoDB AUTO_INCREMENT=7671 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci$$

delimiter $$

CREATE TABLE `Fact_BestPlayerPosition` (
  `dim_playerid` int NOT NULL,
  `dim_matchid` int NOT NULL,
  `dim_positionid` int NOT NULL,
  `dim_clubid` int NOT NULL,
  `goals` int DEFAULT NULL,
  `shots` int DEFAULT NULL,
  `chancescreated` int DEFAULT NULL,
  `assists` int DEFAULT NULL,
  `dim_timeid` smallint DEFAULT NULL,
  PRIMARY KEY (`dim_clubid`,`dim_positionid`,`dim_matchid`,`dim_playerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci$$

delimiter $$

CREATE TABLE `Fact_TransferSpending` (
  `dim_playerid` int NOT NULL,
  `dim_clubid` int NOT NULL,
  `dim_timeid` int NOT NULL,
  `transferin` char(3) DEFAULT NULL,
  `transferout` char(3) DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`dim_playerid`,`dim_clubid`,`dim_timeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci$$




