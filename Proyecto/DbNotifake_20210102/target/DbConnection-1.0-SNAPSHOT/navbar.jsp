<%-- 
    Document   : navbar
    Created on : 11/12/2020, 10:25:06 AM
    Author     : Sara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="CSS/navbar.css">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous">
</script>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous">
</script>


<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
crossorigin="anonymous"></script>

<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #8C6C6C;" >
    <a class="navbar-brand" href="NoticiaController">Fakenoti</a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="background-color: #8C6C6C;">
        <ul class="navbar-nav mr-auto">

            <div class="navbar-nav" style="background-color: #8C6C6C;">
                <a class="nav-item nav-link active" href="NoticiaController">Principal</a>
                <a class="nav-item nav-link" href="NoticiasCine">Cine</a>
                <a class="nav-item nav-link" href="NoticiasMusica">Música</a>
                <a class="nav-item nav-link" href="NoticiasPolitica">Politica</a>

                <% String nombre = (String) request.getSession().getAttribute("name");
                    if (nombre != null) {
                        int tipo = (int) request.getSession().getAttribute("tipo");

                        if (tipo == 1) {
                %>
                <%--Usr Registrado--%>
                <a class="nav-item nav-link" href="NoticiasFavoritasController?id=<%= request.getSession().getAttribute("id")%>">Noticias Favoritas</a>
                <%-- Creador de contenidos--%>
                <% } else if (tipo == 2) {%>

                <a class="nav-item nav-link" href="NoticiasFavoritasController?id=<%= request.getSession().getAttribute("id")%>">Noticias Favoritas</a>
                <a class="nav-item nav-link" href="CrearNoticia.jsp">Crear noticia</a>
                <a class="nav-item nav-link" href="MisNoticiasController?id=<%= request.getSession().getAttribute("id")%>">Mis noticias</a>
                <%-- Editor--%>
                <% } else if (tipo == 3) {%>
                <a class="nav-item nav-link" href="NoticiasFavoritasController?id=<%= request.getSession().getAttribute("id")%>">Noticias Favoritas</a>
                <a class="nav-item nav-link" href="CrearNoticia.jsp">Crear noticia</a>
                <a class="nav-item nav-link" href="MisNoticiasController?id=<%= request.getSession().getAttribute("id")%>">Mis noticias</a>
                <a class="nav-item nav-link" href="NoticiasRevisarController">Noticias por revisar</a>
                <% } else if (tipo == 4) {%>
                <a class="nav-item nav-link" href="NoticiasFavoritasController?id=<%= request.getSession().getAttribute("id")%>">Noticias Favoritas</a>
                <a class="nav-item nav-link" href="CrearNoticia.jsp">Crear noticia</a>
                <a class="nav-item nav-link" href="MisNoticiasController?id=<%= request.getSession().getAttribute("id")%>">Mis noticias</a>
                <a class="nav-item nav-link" href="NoticiasRevisarController">Noticias por revisar</a>
                <a class="nav-item nav-link" href="RegistroS?num=1">Registrar Usuario</a>
                <%
                } else if (tipo == 5) {%>
                <a class="nav-item nav-link" href="NoticiasFavoritasController?id=<%= request.getSession().getAttribute("id")%>">Noticias Favoritas</a>
                <%
                        }
                    } %>
            </div>
        </ul>
        
        
        <form class="form-inline my-2 my-lg-0" style="background-color: #8C6C6C;">
            <input type="text" class="form-control" name="words1" placeholder="Buscar..." id="qta_field" value="${item.value}"/>
            <a href='' onclick="this.href='NoticiasBuscador?codice='+document.getElementById('qta_field').value" class="btn btn-outline-success my-2 my-sm-0" type="submit" >Buscar>
            </a>
            
        </form>
        
            
            
            
        <% String sesion = (String) request.getSession().getAttribute("name");
            if (sesion
                    == null) {
        %>
        <a href="IS.jsp">

            <button class="btn btn-sm btn-outline-dark" type="button" >Iniciar Sesion</button>
        </a>
        <a href="RegistroS?num=0">
            <button class="btn btn-sm btn-outline-dark" type="button">Registrarse</button>
        </a>
        <% } else {%>
        <img class="imgnav" id="importante" src="<%= request.getSession().getAttribute("image")%>"  onerror="this.onerror=null;this.src='Imagenes/profilepic.png';" alt="perfil.JPG" width="50px">
        
        
        <a class="nav-item nav-link" href="EditarPerfilController?id=<%= request.getSession().getAttribute("id")%>"><%= request.getSession().getAttribute("name")%></a>
        <a href="CerrarSesion">
            <button class="btn btn-sm btn-outline-dark" type="button" >Cerrar Sesion</button>
        </a>

        <% }%>
    </div>

</nav>
