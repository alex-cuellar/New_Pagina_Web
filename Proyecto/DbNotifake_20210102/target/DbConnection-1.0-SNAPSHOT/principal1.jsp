<%@page import="com.pw.dbconnection.models.Noticia"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Noticia> noticias = (List<Noticia>) request.getAttribute("noticias");
    List<Noticia> destacadas = (List<Noticia>) request.getAttribute("destacadas");

%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fakenoti</title>

        <link rel="stylesheet" href="CSS/style.css">
        <!-- <script src="JS/jquery.js"></script> -->

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

        <link href="https://fonts.googleapis.com/css2?family=Bentham&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=IM+Fell+DW+Pica+SC&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Suravaram&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Oldenburg&display=swap" rel="stylesheet">


    </head>

    <body>

        <div class="container-fluid">


          <jsp:include page="navbar.jsp"></jsp:include>


            <div class="container" >

                <h3 class="H3">DESTACADAS</h3>

                <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel" data-interval="2500" >
                    <div class="carousel-inner">


                        <%                            if (destacadas.size() > 3) {


                        %>

                        <div class="carousel-item active">
                            <a href="VerNoticiaController?id=<%= destacadas.get(0).getId()%>">
                            <img src="<%= destacadas.get(0).getImagen1()%>" onerror="this.onerror=null;this.src='Imagenes/News.png';"
                                 class="d-block w-100" alt="..." width="250px" height="500px">
                              </a>
                        </div>

                        <div class="carousel-item ">
                            <a href="VerNoticiaController?id=<%= destacadas.get(1).getId()%>">
                            <img src="<%= destacadas.get(1).getImagen1()%>" onerror="this.onerror=null;this.src='Imagenes/News.png';"
                                 class="d-block w-100" alt="..." width="250px" height="500px">
                                </a>
                        </div>
                        <div class="carousel-item ">
                            <a href="VerNoticiaController?id=<%= destacadas.get(2).getId()%>">
                            <img src="<%= destacadas.get(2).getImagen1()%>" onerror="this.onerror=null;this.src='Imagenes/News.png';"
                                 class="d-block w-100" alt="..." width="250px" height="500px">
                            </a>
                        </div>
                        <div class="carousel-item ">
                            <a href="VerNoticiaController?id=<%= destacadas.get(3).getId()%>">
                            <img src="<%= destacadas.get(3).getImagen1()%>" onerror="this.onerror=null;this.src='Imagenes/News.png';"
                                 class="d-block w-100" alt="..." width="250px" height="500px">
                             </a>
                        </div>

                        <%

                            }
                        %>

                    </div>


                </div>



                <h3 class="H3">NEW NOTICE</h3>
                <div class="row">
                    <%
                   
                            for (Noticia noticia : noticias) {
                    %>
                    <div class="card mb-3 col-6 col-md-4" style="max-width: 540px;">
                        <a href="VerNoticiaController?id=<%= noticia.getId()%>">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img src="<%= noticia.getImagen1()%>" onerror="this.onerror=null;this.src='Imagenes/News.png';"
                                         class="card-img" alt="...">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">

                                        <h5 class="card-title"><%= noticia.getTitulo()%></h5>
                                        <p class="card-text"><%= noticia.getDescripCorta()%></p>
                                    </div>
                                </div>
                            </div>

                        </a>


                    </div>
                    <%
                            }
                      
                    %>





                </div>
            </div>




        </div>

        <div class="footer">
            <h3 class="H3">PROGRAMADORES</h3>
            <div class="Alumn">
                <div class="box">
                    <img class="imgBx" src="Imagenes/Sarahí.jpg" alt="Sarahí.JPG">
                    <div class="cont">
                        <h2>Fabiola<br><span>Programadora</span></h2>
                    </div>

                </div>

                <div class="box">
                    <img class="imgBx" src="Imagenes/Jonathan.jpg" alt="Jonathan.JPG">
                    <div class="cont">
                        <h2>Jonathan<br><span>Programador</span></h2>
                    </div>
                </div>

            </div>
        </div>


    </body>

</html>
