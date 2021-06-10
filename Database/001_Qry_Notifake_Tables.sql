USE Notifake

GO

CREATE TABLE Usuario (
		ID	int IDENTITY (10000,1) primary key not null,
		Nombre varchar(100),
		Descrip varchar(100),
		Email varchar(100),
		Usr varchar(100),
		Pass varchar(100),
		RedSoc varchar(100),
		Tipo int,
		Imagen image,
		Status1 BIT

	);


CREATE TABLE UAnonimo (
		ID	int IDENTITY (10000,1) primary key not null,
		RedSoc varchar(100)
		);

CREATE TABLE Categoria (
		ID	int IDENTITY (10000,1) primary key not null,
		RedSoc varchar(100)
		);

CREATE TABLE Noticia (
		ID	int IDENTITY (10000,1) primary key not null,
		Titulo varchar(100),
		Descripcion varchar(200),
		IdCategoria INT,
		Noticia varchar(200),
		Imagen image,
		Video varchar(100),
		Calif int
		CONSTRAINT FK_CATEGORIA Foreign key (IdCategoria) REFERENCES CATEGORIA (ID)

	);

CREATE TABLE NoticiaFav (
		ID	int IDENTITY (10000,1) primary key not null,
		IdNoticia INT,
		IdUsr INT,
		IsRegister INT,
		CONSTRAINT FK_NFNOTICIA Foreign key (IdNoticia) REFERENCES Noticia (ID),
		CONSTRAINT FK_NFUSER Foreign key (IdUsr) REFERENCES Usuario (ID)
	);

GO

CREATE TABLE Comentarios (
		ID	int IDENTITY (10000,1) primary key not null,
		IdNoticia INT,
		IdUsr INT,
		IsRegister INT,
		Calif float,
		Texto varchar(500),
		IsHidden BIT,
		CONSTRAINT FK_CNOTICIA Foreign key (IdNoticia) REFERENCES Noticia (ID),
		CONSTRAINT FK_CUSER Foreign key (IdUsr) REFERENCES Usuario (ID)
	);


CREATE TABLE Respuestas (
		ID	int IDENTITY (10000,1) primary key not null,
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