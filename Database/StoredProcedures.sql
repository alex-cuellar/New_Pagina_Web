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
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_notice`(
IN pTitulo varchar(100),
IN pDescripcioncORTA varchar(200),
IN pIdCategoria int,
IN pNoticiaParrafo1 varchar(200),
IN pImagen1 varchar(350),
IN pVideo varchar(100),
IN pFecha date,
IN pIdUsuario int,
IN pNoticiaParrafo2 varchar(200),
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
`Imagen3`)
VALUES
(pTitulo,
pDescripcioncORTA,
pIdCategoria,
pNoticiaParrafo1,
pImagen1,
pFecha,
pIdUsuario,
pNoticiaParrafo2,
pImagen2,
pImagen3);

END$$
DELIMITER ;
