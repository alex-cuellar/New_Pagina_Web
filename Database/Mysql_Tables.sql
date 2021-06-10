    CREATE TABLE Usuario (
		ID	int primary key NOT NULL AUTO_INCREMENT,
		Nombre varchar(100),
		Descrip varchar(100),
		Email varchar(100),
		Usr varchar(100),
		Pass varchar(100),
		RedSoc varchar(300),
		Tipo int,
		Imagen varchar(350),
		Status1 BIT

	);
    ALTER TABLE Usuario AUTO_INCREMENT=1001;


CREATE TABLE UAnonimo (
		ID	int primary key NOT NULL AUTO_INCREMENT,
		Nombre varchar(100)
		);
    ALTER TABLE Usuario AUTO_INCREMENT=1001;

CREATE TABLE Categoria (
		ID	int primary key NOT NULL AUTO_INCREMENT,
		RedSoc varchar(100)
		);
    ALTER TABLE Usuario AUTO_INCREMENT=1001;

CREATE TABLE `noticia` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) DEFAULT NULL,
  `DescripcioncORTA` varchar(200) DEFAULT NULL,
  `IdCategoria` int DEFAULT NULL,
  `NoticiaParrafo1` varchar(200) DEFAULT NULL,
  `Imagen1` varchar(350) DEFAULT NULL,
  `Video` varchar(100) DEFAULT NULL,
  `Calif` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `IdUsuario` int DEFAULT NULL,
  `NoticiaParrafo2` varchar(200) DEFAULT NULL,
  `Imagen2` varchar(350) DEFAULT NULL,
  `Imagen3` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CATEGORIA` (`IdCategoria`),
  KEY `FK_USUARIO` (`IdUsuario`),
  CONSTRAINT `FK_CATEGORIA` FOREIGN KEY (`IdCategoria`) REFERENCES `categoria` (`ID`),
  CONSTRAINT `FK_USUARIO` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

    ALTER TABLE Usuario AUTO_INCREMENT=1001;

CREATE TABLE NoticiaFav (
		ID	int primary key NOT NULL AUTO_INCREMENT,
		IdNoticia INT,
		IdUsr INT,
		IsRegister INT,
		CONSTRAINT FK_NFNOTICIA Foreign key (IdNoticia) REFERENCES Noticia (ID),
		CONSTRAINT FK_NFUSER Foreign key (IdUsr) REFERENCES Usuario (ID)
	);
        ALTER TABLE Usuario AUTO_INCREMENT=1001;


CREATE TABLE Comentarios (
		ID	int primary key NOT NULL AUTO_INCREMENT,
		IdNoticia INT,
		IdUsr INT,
		IsRegister INT,
		Calif float,
		Texto varchar(500),
		IsHidden BIT,
		CONSTRAINT FK_CNOTICIA Foreign key (IdNoticia) REFERENCES Noticia (ID),
		CONSTRAINT FK_CUSER Foreign key (IdUsr) REFERENCES Usuario (ID),
        CONSTRAINT FK_Anon Foreign key (IsRegister) REFERENCES UAnonimo (ID)
	);
        ALTER TABLE Usuario AUTO_INCREMENT=1001;


CREATE TABLE Respuestas (
		ID	int primary key NOT NULL AUTO_INCREMENT,
		IdNoticia INT,
		IdUsr INT,
		IsRegister INT,
		IdComent INT,
		Calif float,
		Texto varchar(500),
		IsHidden BIT,
		CONSTRAINT FK_RNOTICIA Foreign key (IdNoticia) REFERENCES Noticia (ID),
		CONSTRAINT FK_RUSER Foreign key (IdUsr) REFERENCES Usuario (ID),
		CONSTRAINT FK_RCOMENT Foreign key (IdComent) REFERENCES Comentarios (ID)
	);
        ALTER TABLE Usuario AUTO_INCREMENT=1001;
    
    