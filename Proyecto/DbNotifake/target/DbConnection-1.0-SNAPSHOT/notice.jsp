<%-- 
    Document   : notice
    Created on : 10/12/2020, 09:53:10 PM
    Author     : Sara
--%>
<%@page import="java.util.List"%>
<%@page import="com.pw.dbconnection.models.Comentarios"%>
<%@page import="com.pw.dbconnection.models.Noticia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Noticia noticia = (Noticia) request.getAttribute("Ver");
    List<Comentarios> comentarios = (List<Comentarios>) request.getAttribute("Comentarios");
%>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Notice</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
        </script>

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
        </script>

        <link rel="stylesheet" href="CSS/Notice.css">

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=IM+Fell+DW+Pica+SC&display=swap" rel="stylesheet">

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Suravaram&display=swap" rel="stylesheet">





    </head>

    <body>

        <div class="container-fluid">

            <jsp:include page="navbar.jsp"></jsp:include>
                <div class="container">

                    <div class="noticia">

                        <h1 class="Titulo" name="TituloNoticia"> <%= noticia.getTitulo()%></h1>

                    <img src="assets/Iconos/Favorito.png"  alt="Favorito.PNG" class="Favorito">


                    <h3><%= noticia.getAutor()%></h3>
                    <h4><%= noticia.getFecha()%></h4>

                    <img class="Imagen" name="PrimeraImagen" src="<%= noticia.getImagen1()%>"
                         alt="IMAGEN:JPG">


                    <p class="Parrafo" name="PrimerP"><%= noticia.getParrafo1()%></p>


                    <img class="Imagen" name="SegundaImagen" src="<%= noticia.getImagen2()%>"
                         alt="IMAGEN:JPG">


                    <p class="Parrafo" name="SegundoP"><%= noticia.getParrafo2()%></p>

                    <img class="Imagen" name="SegundaImagen" src="<%= noticia.getImagen3()%>"
                         alt="IMAGEN:JPG">

                    <% String se = (String) request.getSession().getAttribute("name");
                        if (se != null) {
                            int id = (int) request.getSession().getAttribute("tipo");
                            if ((id == 2 || id == 3) && noticia.getAceptada() == 0) {
                    %>

                    <form method="POST" action="AcepNot">
                        <div class="form-group">
                        <input type="hidden" name="ID" value ="<%= noticia.getId()%>" >
                            <input class="btn btn-dark" name="Aceptar" type="submit" value="Aceptar ">
                        </div>
                    </form>
                    <%}
                        }%>

                </div>

                <div class="footer">
                    <h2 class="Titulo2">Comentarios</h2>


                    <% String sesion = (String) request.getSession().getAttribute("name");
                        if (sesion == null) {
                    %>
                    <div class="group">
                        <label for="name" class="text">Nombre</label>
                        <input class="controls" type="text" name="name" id="name" placeholder="Unknown" required autocomplete="off">

                    </div>

                    <% }%>


                    <form method="POST" action="ComentariosController" class="controlador">
                        <div class="form-group">
                            <label for="commentary" class="comentario">Escribir un comentario</label>
                            <textarea class="form-control" name="commentary" id="commentary" rows="2"></textarea>
                            <input type="hidden" name="ID" value ="<%= noticia.getId()%>" >
                        </div>
                        <div class="form-group">
                            <input class="btn btn-dark" name="Enviar" type="submit" value="Comentar">
                        </div>
                    </form>




                    <div class="media">

                        <%
                            if (comentarios != null) {
                                for (Comentarios comentario : comentarios) {
                        %>

                        <img src="<%= comentario.getImagen()%>" class="mr-3"
                             name="ImagenPerfil" alt="...">
                        <div class="media-body">


                            <h5 class="mt-0" name="NombreComentario"><%= comentario.getNombreUsuario()%></h5>
                            <p class="text"> <%= comentario.getTexto()%> </p>           



                            <div class="comentar">

                                <div class="form-group">
                                    <label for="commentary" class="comentario">Responder</label>
                                    <textarea class="form-control" name="commentary" id="commentary" rows="2"></textarea>
                                </div>
                                <div class="form-group">
                                    <input class="btn btn-dark" name="Enviar" type="submit" value="Comentar">
                                </div>
                            </div>

                            <div class="iconos">
                                <img src="assets/Iconos/MeGusta.png"  alt="MeGusta.PNG" class="Like">
                                <img src="assets/Iconos/NoMeGusta.png"  alt="NoMeGusta.PNG" class="NoLike">
                            </div>

                            <%
                                    }
                                }
                            %>


                        </div>


                    </div>



                </div>



            </div>






        </div>



    </body>

</html>
