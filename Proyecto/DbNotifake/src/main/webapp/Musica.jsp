<%-- 
    Document   : Musica
    Created on : 11/12/2020, 03:20:37 AM
    Author     : Sara
--%>

<%@page import="com.pw.dbconnection.models.Noticia"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% List<Noticia> noticias = (List<Noticia>) request.getAttribute("noticias"); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Noticias por seccion</title>

    <link rel="stylesheet" href="CSS/Genero.css">
    
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
                crossorigin="anonymous">
        </script>


        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
                integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Oldenburg&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=IM+Fell+DW+Pica+SC&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Bentham&display=swap" rel="stylesheet">
</head>



<body>

            <jsp:include page="navbar.jsp"></jsp:include>
    <div class="container">

        
        <h2 class="genero">Musica</h2>

        
        
         <%
                    if (noticias != null) {
                        for (Noticia noticia : noticias) {
                %>
        
       <div class="noticias">
                     <a href="VerNoticiaController?id=<%= noticia.getId()%>">
                <h3 class="titulo"><%= noticia.getTitulo()%></h3>
                 </a>

                <div class="Imagen">
                    <img src="<%= noticia.getImagen1()%>" class="ImNoticia"
                         name="ImNoticia" alt="...">
                </div>

                <div class="datosInf">
                    <p class="datos"> <%= noticia.getDescripCorta()%></p>
                </div>

            </div>

        <%
                    }
                }
            %>
        
        
        
        

    </div>



</body>

</html>