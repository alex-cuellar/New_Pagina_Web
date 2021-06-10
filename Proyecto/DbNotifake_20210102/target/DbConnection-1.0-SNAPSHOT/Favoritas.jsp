<%-- 
    Document   : Favoritas
    Created on : 11/12/2020, 12:58:48 PM
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
    <title>Marcadas</title>

    <link rel="stylesheet" href="CSS/Genero.css">

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

        <h2 class="genero">Noticias marcadas</h2>

              <%
                    if (noticias != null) {
                        for (Noticia noticia : noticias) {
                %>
        
       <div class="noticias">
                     <a href="VerNoticiaController?id=<%= noticia.getId()%>">
                <h3 class="titulo"><%= noticia.getTitulo()%></h3>
                 </a>


                <div class="Imagen">
                    <img src="<%= noticia.getImagen1()%>" class="ImNoticia" onerror="this.onerror=null;this.src='Imagenes/News.png';"
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
