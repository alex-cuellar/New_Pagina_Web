<%-- 
    Document   : CrearNoticia
    Created on : 10/12/2020, 12:22:38 PM
    Author     : Sara
--%>
<%@page import="java.util.List"%>
<%@page import="com.pw.dbconnection.models.Comentarios"%>
<%@page import="com.pw.dbconnection.models.UserModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UserModel usuario = (UserModel) request.getAttribute("Ver");
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="CSS/CrearNoticia.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
        </script>

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
        </script>


        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Oldenburg&display=swap" rel="stylesheet">

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=IM+Fell+DW+Pica+SC&display=swap" rel="stylesheet">


        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Bentham&display=swap" rel="stylesheet">

        <title>Nueva Noticia</title>
    </head>

    <body>
                 <jsp:include page="navbar.jsp"></jsp:include>
        <div class="container-fluid">
           
            
            
            <div class="container">
                <form action="EditarPerfilController" method="POST" enctype="multipart/form-data">
                    <h1 class="H1">EDITAR PERFIL</h1>
                    <label for="image" class="Subtitulos">Imagen de prefil Previa</label>
                    <div class="form-group">
                    <img class="Imagen" name="PrimeraImagen" src="<%= usuario.getUrlImage()%>" onerror="this.onerror=null;this.src='Imagenes/profilepic.png';" width="100px"
                         alt="IMAGEN:JPG">
                    </div>
                    <div class="form-group">
                        <label for="image" class="Subtitulos">Imagen de prefil Nueva</label>
                        <input type="file" class="form-control" name="PImage" id="PImage">
                    </div>
                    <div class="form-group">
                        <label for="Inf" class="Subtitulos">Usuario</label>
                        <h1 class="Titulo" name="Usuario"> <%= usuario.getUserName()%></h1>
                    </div>

                    <div class="form-group">
                        <label for="Inf" class="Subtitulos">Descripcion</label>
                        <input type="text" class="form-control" name="Descripcion" placeholder="¿Qué te apasiona?" value = "<%= usuario.getDescript()%>">
                    </div>

                    <div class="form-group">
                        <label for="Inf" class="Subtitulos">Nombre Completo</label>
                        <p class="Parrafo" name="PrimerP"><%= usuario.getName()%></p>
                    </div>

                    <div class="form-group">
                        <label for="Inf" class="Subtitulos">Email</label>
                        <p class="Parrafo" name="PrimerP"><%= usuario.getEmail()%></p>
                    </div>

                    <div class="form-group">
                        <label for="Inf" class="Subtitulos">Red Social Contacto</label>
                        <input type="text" class="form-control" name="RedSoc" placeholder="@CadlitosM" value = "<%= usuario.getRedSoc()%>">
                    </div>
                    
                    <div class="form-group">
                        <label for="Inf" class="Subtitulos">Nueva Contraseña</label>
                        <input type="text" class="controls" class="form-control" name="Contrasena" placeholder="Nueva Contraseña"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                    </div>
                    



                    <div class="group">
                        <input class="Subir" name="Editar" type="submit" value="Editar">
                    </div>


                </form>
            </div>
        </div>

    </body>

</html>