CREATE TABLE `categoria` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RedSoc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `uanonimo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `usuario` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Descrip` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Usr` varchar(100) DEFAULT NULL,
  `Pass` varchar(100) DEFAULT NULL,
  `RedSoc` varchar(300) DEFAULT NULL,
  `Tipo` int DEFAULT NULL,
  `Imagen` varchar(350) DEFAULT NULL,
  `Status1` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `noticia` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) DEFAULT NULL,
  `DescripcioncORTA` varchar(200) DEFAULT NULL,
  `IdCategoria` int DEFAULT NULL,
  `NoticiaParrafo1` longtext,
  `Imagen1` varchar(350) DEFAULT NULL,
  `Video` varchar(100) DEFAULT NULL,
  `Calif` int DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `IdUsuario` int DEFAULT NULL,
  `NoticiaParrafo2` longtext,
  `Imagen2` varchar(350) DEFAULT NULL,
  `Imagen3` varchar(350) DEFAULT NULL,
  `Aceptada` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CATEGORIA` (`IdCategoria`),
  KEY `FK_USUARIO` (`IdUsuario`),
  CONSTRAINT `FK_CATEGORIA` FOREIGN KEY (`IdCategoria`) REFERENCES `categoria` (`ID`),
  CONSTRAINT `FK_USUARIO` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `noticiafav` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IdNoticia` int DEFAULT NULL,
  `IdUsr` int DEFAULT NULL,
  `IsRegister` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_NFNOTICIA` (`IdNoticia`),
  KEY `FK_NFUSER` (`IdUsr`),
  CONSTRAINT `FK_NFNOTICIA` FOREIGN KEY (`IdNoticia`) REFERENCES `noticia` (`ID`),
  CONSTRAINT `FK_NFUSER` FOREIGN KEY (`IdUsr`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `comentarios` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IdNoticia` int DEFAULT NULL,
  `IdUsr` int DEFAULT NULL,
  `IsRegister` int DEFAULT NULL,
  `Calif` float DEFAULT NULL,
  `Texto` varchar(500) DEFAULT NULL,
  `UsrAnonimo` varchar(100) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `IsHidden` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CNOTICIA` (`IdNoticia`),
  CONSTRAINT `FK_CNOTICIA` FOREIGN KEY (`IdNoticia`) REFERENCES `noticia` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `respuestas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IdNoticia` int DEFAULT NULL,
  `IdUsr` int DEFAULT NULL,
  `IsRegister` int DEFAULT NULL,
  `IdComent` int DEFAULT NULL,
  `Calif` float DEFAULT NULL,
  `Texto` varchar(500) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `IsHidden` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RNOTICIA` (`IdNoticia`),
  KEY `FK_RUSER` (`IdUsr`),
  KEY `FK_RCOMENT` (`IdComent`),
  CONSTRAINT `FK_RCOMENT` FOREIGN KEY (`IdComent`) REFERENCES `comentarios` (`ID`),
  CONSTRAINT `FK_RNOTICIA` FOREIGN KEY (`IdNoticia`) REFERENCES `noticia` (`ID`),
  CONSTRAINT `FK_RUSER` FOREIGN KEY (`IdUsr`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `notifakedb`.`categoria`
(`ID`,
`RedSoc`)
VALUES
(1,
'Cine');

INSERT INTO `notifakedb`.`categoria`
(`ID`,
`RedSoc`)
VALUES
(2,
'Música');


INSERT INTO `notifakedb`.`categoria`
(`ID`,
`RedSoc`)
VALUES
(3,
'Pelicula');

INSERT INTO `notifakedb`.`categoria`
(`ID`,
`RedSoc`)
VALUES
(4,
'Ninguna');

INSERT INTO `notifakedb`.`usuario`
(`Nombre`,
`Descrip`,
`Email`,
`Usr`,
`Pass`,
`RedSoc`,
`Tipo`,
`Imagen`,
`Status1`)
VALUES
('Julio Cesar Administrador',
'Administrador',
'admin@gmail.com',
'SoyAdmin',
'admin12345',
'intagram.com/@admin4all',
5, 
null,
1
);