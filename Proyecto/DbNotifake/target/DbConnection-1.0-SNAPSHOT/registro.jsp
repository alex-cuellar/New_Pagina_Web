<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    
     
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>


    <link rel="stylesheet" href="CSS/registro.css">

    <link href="https://fonts.googleapis.com/css2?family=Special+Elite&display=swap" rel="stylesheet">

</head>
<body>
        <!--Nombre, Descrip, Email, Usr, Pass, RedSoc, Tipo, Imagen-->
       <form class= "formR" action="./UsersController" name="Registro" id="Registro" method="POST" enctype="multipart/form-data">
        <div class="group">
            <label for="name">Nombre</label>
            <input class="controls" type="text" name="name" id="name" placeholder="Nombre(s)" required autocomplete="off">

        </div>
           
        <div class="group">
            <label for="name">Email</label>
            <input class="controls" type="text" name="email" id="email" placeholder="Nombre(s)" required autocomplete="off">

        </div>
        
           
        <div class="group">
            <label for="name">Usuario</label>
            <input class="controls" type="text" name="usr1" id="usr1" placeholder="Apellido(s)" required autocomplete="off">

        </div>

        <div class="group" required>
            <label for="pas">Contraseña </label>
            <input class="controls" class = "form-error" type="password" name="password" id="password" placeholder=" PastelDeLimon47" required minlength="8">
        </div>
        
                <div class="group">
            <label for="name">Red Social</label>
            <input class="controls" type="text" name="redsoc1" id="redsoc1" placeholder="Nombre(s)" required autocomplete="off">

        </div>

        <div class="group">
            <label for="name">Tipo</label>
            <input class="controls" type="number" name="tipo1" id="tipo1" placeholder="Nombre(s)" required autocomplete="off">

        </div>
           
        <div class="group" required>
            <label for="image">Imagen de perfil</label>
            <input class="controls" class = "form-error" type="file" name="image" id="image" placeholder="No Imagen">
  
        </div>
           
        <div class="group" required>
            <label for="image">Descripcion de Perfil</label>
            <input class="controls" type="text" name="descript1" id="descript1" placeholder="No Imagen">
  
        </div>
           
        <div class="group">
            <input class="ER" type="submit" value="Registrar">
        </div>
   
    </form>


</body>
</html>