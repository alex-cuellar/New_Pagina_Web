 DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Destacadas`()
BEGIN
SELECT * FROM noticia WHERE `noticia`.`Aceptada` = 1
ORDER BY Calif DESC 
LIMIT 4;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `IniciarSesion`(
IN pUsr varchar(100),
IN pPass varchar(100))
BEGIN
select ID, Nombre, Usr, Email, Descrip, RedSoc, Tipo, Imagen
from usuario
where Usr = pUsr
and Pass = pPass;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MIS_NOTICIAS`(
IN `ID` int
)
BEGIN
SELECT `noticia`.`ID`,
    `noticia`.`Titulo`,
    `noticia`.`DescripcioncORTA`,
    `noticia`.`IdCategoria`,
    `noticia`.`NoticiaParrafo1`,
    `noticia`.`Imagen1`,
    `noticia`.`Fecha`,
    `noticia`.`IdUsuario`,
    `noticia`.`NoticiaParrafo2`,
    `noticia`.`Imagen2`,
    `noticia`.`Imagen3`,
    `noticia`.`Aceptada`,
	`usuario`.`Nombre`
FROM `noticia` left join `usuario` on `noticia`.`IdUsuario` = `usuario`.`ID`
WHERE `IdUsuario` = ID
ORDER BY fecha DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_notice`(
IN pTitulo varchar(100),
IN pDescripcioncORTA varchar(200),
IN pIdCategoria int,
IN pNoticiaParrafo1 longtext,
IN pImagen1 varchar(350),
IN pIdUsuario int,
IN pNoticiaParrafo2 longtext,
IN pImagen2 varchar(350),
IN pImagen3 varchar(350)

)
BEGIN
INSERT INTO `notifakedb`.`noticia`
(`Titulo`,
`DescripcioncORTA`,
`IdCategoria`,
`NoticiaParrafo1`,
`Imagen1`,
`Fecha`,
`IdUsuario`,
`NoticiaParrafo2`,
`Imagen2`,
`Imagen3`,
`Aceptada`,
`Calif`
)
VALUES
(pTitulo,
pDescripcioncORTA,
pIdCategoria,
pNoticiaParrafo1,
pImagen1,
now(),
pIdUsuario,
pNoticiaParrafo2,
pImagen2,
pImagen3,
0,
0);

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_user`(
IN pNombre varchar(100),
IN pDescrip varchar(100),
IN pEmail varchar(100),
IN pUsr varchar(100),
IN pPass varchar(100),
IN pRedSoc varchar(300),
IN pTipo int,
IN pImagen varchar(350),
IN pStatus1 bit(1)
)
BEGIN
INSERT INTO `usuario`
(
`Nombre`,
`Descrip`,
`Email`,
`Usr`,
`Pass`,
`RedSoc`,
`Tipo`,
`Imagen`,
`Status1`)
VALUES
(
pNombre,
pDescrip,
pEmail,
pUsr,
pPass,
pRedSoc,
pTipo,
pImagen,
pStatus1
);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `NOTICIA_CINE`()
BEGIN
SELECT * FROM noticia
where IdCategoria = 4 AND Aceptada = 1
ORDER BY fecha DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `NOTICIA_MUSICA`()
BEGIN
SELECT * FROM noticia
where IdCategoria = 5 AND Aceptada = 1
ORDER BY fecha DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `NOTICIAS_PELICULA`()
BEGIN
SELECT * FROM noticia
where IdCategoria = 6 AND Aceptada = 1
ORDER BY fecha DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `NOTICIAS_REVISAR`()
BEGIN
SELECT `noticia`.`ID`,
    `noticia`.`Titulo`,
    `noticia`.`DescripcioncORTA`,
    `noticia`.`IdCategoria`,
    `noticia`.`NoticiaParrafo1`,
    `noticia`.`Imagen1`,
    `noticia`.`Fecha`,
    `noticia`.`IdUsuario`,
    `noticia`.`NoticiaParrafo2`,
    `noticia`.`Imagen2`,
    `noticia`.`Imagen3`,
    `noticia`.`Aceptada`,
	`usuario`.`Nombre`
FROM `noticia` left join `usuario` on `noticia`.`IdUsuario` = `usuario`.`ID`
WHERE `Aceptada` = 0
ORDER BY fecha DESC;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `OBTENER_NEW_NOTICE`()
BEGIN
SELECT * FROM noticia WHERE `noticia`.`Aceptada` = 1
ORDER BY fecha DESC 
LIMIT 12;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `OBTENER_NOTICIA`(
IN `ID` int)
BEGIN
SELECT `noticia`.`ID`,
    `noticia`.`Titulo`,
    `noticia`.`DescripcioncORTA`,
    `noticia`.`IdCategoria`,
    `noticia`.`NoticiaParrafo1`,
    `noticia`.`Imagen1`,
    `noticia`.`Fecha`,
    `noticia`.`IdUsuario`,
    `noticia`.`NoticiaParrafo2`,
    `noticia`.`Imagen2`,
    `noticia`.`Imagen3`,
	`usuario`.`Nombre`,
    `usuario`.`Aceptada`,
    `usuario`.`Calif`
FROM `noticia` left join `usuario` on `noticia`.`IdUsuario` = `usuario`.`ID`
WHERE `noticia`.`ID` = ID;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Comentario_Usuario_Registrado`(
IN PIdNoticia int,
IN PIdUsr int,
IN PTexto varchar(500)
)
BEGIN
INSERT INTO `notifakedb`.`comentarios`
(`IdNoticia`,
`IdUsr`,
`Texto`,
`Fecha`)
VALUES
(PIdNoticia,
PIdUsr,
PTexto,
CURRENT_TIEMSTAMP()
);

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener_Comentarios`(
IN pID int
)
BEGIN
SELECT 
`comentarios`.`ID`,
`comentarios`.`IdNoticia`,
`comentarios`.`IdUsr`,
`comentarios`.`Texto`,
`usuario`.`Nombre`,
`usuario`.`Imagen`
FROM `comentarios` left join `usuario` on `comentarios`.`IdUsr` = `usuario`.`ID`
WHERE `comentarios`.`IdNoticia` = pID;
END$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Noticia_Aceptada`(
IN idNoticia int)
BEGIN

UPDATE `notifakedb`.`noticia`
SET
`Aceptada` = 1
WHERE `ID` = idNoticia;

DELETE FROM `comentarios`
WHERE `comentarios`.`IdNoticia` = idNoticia;

END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_notice`(
IN pTitulo varchar(100),
IN pDescripcioncORTA varchar(200),
IN pIdCategoria int,
IN pNoticiaParrafo1 longtext,
IN pImagen1 varchar(350),
IN pIdUsuario int,
IN pNoticiaParrafo2 longtext,
IN pImagen2 varchar(350),
IN pImagen3 varchar(350),
IN Id int
)
BEGIN
UPDATE `notifakedb`.`noticia`
SET
`Titulo` = pTitulo,
`DescripcioncORTA` = pDescripcioncORTA,
`IdCategoria` = pIdCategoria,
`NoticiaParrafo1` = pNoticiaParrafo1,
`Imagen1` = pImagen1,
`Fecha` = now(),
`IdUsuario` = pIdUsuario,
`NoticiaParrafo2` = pNoticiaParrafo2,
`Imagen2` = pImagen2,
`Imagen3` = pImagen3,
`Aceptada` = 0
WHERE `noticia`.`ID` = Id;
END$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Respuesta_Usuario_Registrado`(
IN PIdNoticia int,
IN PIdUsr int,
IN PIdComent int,
IN PTexto varchar(500)
)
BEGIN
INSERT INTO `notifakedb`.`respuestas`
(`IdNoticia`,
`IdUsr`,
`IdComent`,
`Texto`,
`Fecha`)
VALUES
(PIdNoticia,
PIdUsr,
PIdComent,
PTexto,
CURRENT_TIEMSTAMP()
);
END$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener_Respuestas`(
IN ID1 int
)
BEGIN
SELECT 
`respuestas`.`ID`,
`respuestas`.`idNoticia`,
`respuestas`.`IdUsr`,
`respuestas`.`IdComent`,
`respuestas`.`Texto`,
`usuario`.`Nombre`,
`usuario`.`Imagen`
FROM `respuestas` left join `usuario` on `respuestas`.`IdUsr` = `usuario`.`ID`
WHERE `respuestas`.`IdComent` = ID1;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener_Resp_Noti`(
IN ID1 int
)
BEGIN
SELECT 
`respuestas`.`ID`,
`respuestas`.`idNoticia`,
`respuestas`.`IdUsr`,
`respuestas`.`IdComent`,
`respuestas`.`Texto`,
`usuario`.`Nombre`,
`usuario`.`Imagen`
FROM `respuestas` left join `usuario` on `respuestas`.`IdUsr` = `usuario`.`ID`
WHERE `respuestas`.`IdNoticia` = ID1;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `OBTENER_UserData`(
IN IDu int)
BEGIN
select ID, Nombre, Usr, Descrip, Email, RedSoc, Tipo, Imagen
from usuario
where `usuario`.`ID` = IDu;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_perfil`(
IN Id int,
IN descrip1 varchar(100),
IN contra1 varchar(100),
IN redsoc1 varchar(200),
IN imagen varchar(350)
)
BEGIN
UPDATE `notifakedb`.`usuario`
SET
`Descrip` = descrip1,
`Pass` = contra1,
`RedSoc` = redsoc1,
`Imagen` = imagen
WHERE `usuario`.`ID` = Id;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Noticia_Favorita`(
IN IDN int,
IN IDU int
)
BEGIN
INSERT INTO `notifakedb`.`noticiafav`
(`IdNoticia`,
`IdUsr`
)
VALUES
(IDN,
IDU
);

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Noticias_Favoritas`(
IN `ID` int
)
BEGIN
SELECT `noticia`.`ID`,
    `noticia`.`Titulo`,
    `noticia`.`DescripcioncORTA`,   
    `noticia`.`Imagen1`
FROM `noticiafav` left join `noticia` on `noticiafav`.`IdNoticia` = `noticia`.`ID`
WHERE `noticiafav`.`IdUsr` = ID
ORDER BY fecha DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MeGusta`(
IN `IDN` int
)
BEGIN
UPDATE `notifakedb`.`noticia`
SET
`Calif` = `Calif` + 1
WHERE `ID` = `IDN`;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `NoMeGusta`(
IN `IDN` int
)
BEGIN
UPDATE `notifakedb`.`noticia`
SET
`Calif` = `Calif` - 1
WHERE `ID` = `IDN`;
END$$
DELIMITER ;
