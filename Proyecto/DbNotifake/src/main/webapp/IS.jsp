<%-- 
    Document   : IS
    Created on : 10/12/2020, 03:02:10 AM
    Author     : Sara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesion</title>
    <link rel="stylesheet" href="CSS/IS.css">
</head>
<body>
    
    <div class="login">
        <img class="avatar" src="Imagenes/mediatelecom_fake_news_jb200219.jpg" alt="Logo">
        <h1> Iniciar Sesion </h1>
        <form action="LogIn"  method="POST">

            <label for="user">Username</label>
            <input type="text" class="controls" name="Nikname" id="Username" placeholder="SaKu">

            <label for="pass">Contraseña</label>
            <input type="password" class="controls" name="Password" id="Contraseña" placeholder="Te_4m0_D4rr3n_Ch3n">

            <input  class="ER" name="Entrar" id="Entrar" type="submit" value="Entrar">
            
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
                <label class="form-check-label" for="flexCheckChecked">
                    Recordar
                </label>
            </div>
            
       
        </form>
    </div>
</body>
</html>