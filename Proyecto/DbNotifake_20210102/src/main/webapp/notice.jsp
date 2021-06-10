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
    List<Comentarios> respuestas = (List<Comentarios>) request.getAttribute("Respuestas");
    int safemode = (Integer) request.getAttribute("gpa");
    

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
                        <p class="Parrafo" name="Descrip"> <%= noticia.getDescripCorta()%></p>
                    <%
                        String nombre = (String) request.getSession().getAttribute("name");
                        if (nombre != null) {
                    %>
                    <a href="Favoritos?id=<%= noticia.getId()%>">
                        <img src="Imagenes/Favorito.jpg"  alt="Favorito.PNG" class="Favorito">
                        <%
                            }
                        %>

                    </a>
                    
                    <%
                        
                        if (nombre != null) {
                    %>
                    <div class="iconos">
                        <a href="Marcar_MeGusta?id=<%= noticia.getId()%>">
                        <img src="Imagenes/MeGusta.png"  alt="MeGusta.PNG" class="Like">
                         </a>
                        
                        
                         <a href="Marcar_No_MeGusta?id=<%= noticia.getId()%>">
                        <img src="Imagenes/NoMeGusta.png"  alt="NoMeGusta.PNG" class="NoLike">
                        </a>
                    </div>
                        
                        <%
                            } else {
                        %>  
                        
                        
                    <div class="iconos">
                        <a href="IS.jsp">
                        <img src="Imagenes/MeGusta.png"  alt="MeGusta.PNG" class="Like">
                         </a>
                        
                        
                         <a href="IS.jsp">
                        <img src="Imagenes/NoMeGusta.png"  alt="NoMeGusta.PNG" class="NoLike">
                        </a>
                    </div>
                        
                        <%
                            }
                        %>
                    
                    <div class="iconos">
                        <h3>Me gusta: <%= noticia.getCalif()%></h3>
                        
                    </div>


                    <h3><%= noticia.getAutor()%></h3>
                    <h4><%= noticia.getFecha()%></h4>

                    <%
                        String comp = "null";
                        String comp0 = noticia.getImagen1();
                        int op = comp0.compareTo(comp);
                        if (op != 0) {
                    %>

                    <img class="Imagen" name="PrimeraImagen" src="<%= noticia.getImagen1()%>"  onerror="this.onerror=null;this.src='Imagenes/News.png';"  width="70px"
                         alt="IMAGEN:JPG">
                    <%
                        }
                        if (noticia.getParrafo1() != null) {
                    %>

                    <p class="Parrafo" name="PrimerP"><%= noticia.getParrafo1()%></p>
                    <%
                        }

                        comp0 = noticia.getImagen2();
                        op = comp0.compareTo(comp);
                        if (op != 0) {
                    %>

                    <img class="Imagen" name="SegundaImagen" src="<%= noticia.getImagen2()%>"  onerror="this.onerror=null;this.src='Imagenes/News.png';"  width="70px"
                         alt="IMAGEN:JPG">
                    <%
                        }
                        if (noticia.getParrafo2() != null) {
                    %>

                    <p class="Parrafo" name="SegundoP"><%= noticia.getParrafo2()%></p>

                    <%
                        }

                        comp0 = noticia.getImagen3();
                        op = comp0.compareTo(comp);
                        if (op != 0) {
                    %>

                    <img class="Imagen" name="SegundaImagen" src="<%= noticia.getImagen3()%>" onerror="this.onerror=null;this.src='Imagenes/News.png';"  width="70px"
                         alt="IMAGEN:JPG">
                    

                    <%
                        }
                        String se = (String) request.getSession().getAttribute("name");
                        if (se != null) {
                            int id = (int) request.getSession().getAttribute("tipo");
                            if ((id == 3) && noticia.getAceptada() == 0) {
                    %>

                    <form method="POST" action="AcepNot">
                        <div class="form-group">
                            <input type="hidden" name="ID" value ="<%= noticia.getId()%>" >
                            <input class="btn btn-dark" name="Aceptar" type="submit" value="Aceptar ">
                        </div>
                    </form>
                    <%}
                        }%>


                    <%
                        if (se != null) {
                            int id = (int) request.getSession().getAttribute("tipo");
                            if ((id == 2) && noticia.getAceptada() == 0) {
                    %>

                    <div class="card mb-3 col-6 col-md-4" style="max-width: 540px;">
                        <a href="EditarNoticiaController?id=<%= noticia.getId()%>">
                            <div class="row no-gutters">
                                <div class="col-md-4">
                                    <img src="<%= noticia.getImagen1()%>" onerror="this.onerror=null;this.src='Imagenes/News.png';"
                                         class="card-img" alt="...">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">

                                        <h5 class="card-title"><%="EDITAR NOTICIA: " + noticia.getTitulo()%></h5>
                                        <p class="card-text"><%= noticia.getDescripCorta()%></p>
                                    </div>
                                </div>
                            </div>

                        </a>


                    </div>
                    <%}
                        }%>

                </div>
                    <%
                        if (safemode == 1) {
                    %>  
                    <div class="col-md-8">
                    <form method="POST" action="VerNoticiaUnsafeController" class="controlador">
                        <div class="form-group">
                            <input type="hidden" name="id" value ="<%= noticia.getId()%>" >
                        </div>
                        <div class="form-group">
                            <input class="btn btn-dark" name="Enviar" type="submit" value="Ver Ocultos">
                        </div>
                    </form>
                    </div>
                    <% } else {%>
                    <div class="col-md-8">
                    <form method="POST" action="VerNoticiaController" class="controlador">
                        <div class="form-group">
                            <input type="hidden" name="id" value ="<%= noticia.getId()%>" >
                        </div>
                        <div class="form-group">
                            <input class="btn btn-dark" name="Enviar" type="submit" value="Ocultar">
                        </div>
                    </form>
                    </div>
                    
                    <% }%>
                
                    <h2 class="Titulo2">Comentarios</h2>

                    <% String sesion = (String) request.getSession().getAttribute("name");
                        if (sesion == null) {
                    %>

                    <form method="POST" action="ComentarioAnonimoController" class="controlador">
                        <label for="name" class="text">Nombre</label>
                        <input class="controls" type="text" name="name" id="name" placeholder="Unknown" required autocomplete="off" value = "Anonimo">
                        <div class="form-group">
                            <label for="commentary" class="comentario">Escribir un comentario</label>
                            <textarea class="form-control" name="commentary" id="commentary" rows="2"></textarea>
                            <input type="hidden" name="ID" value ="<%= noticia.getId()%>" >
                        </div>
                        <div class="form-group">
                            <input class="btn btn-dark" name="Enviar" type="submit" value="Comentar">
                        </div>
                    </form>
                        
                    <% } else {%>


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
                    
                    <% }%>





                        <%
                            if (comentarios != null) {
                                for (Comentarios comentario : comentarios) {
                            if (comentario.IgetCalif() >= 0.0 || safemode == 0){
                        %>
                        <div class="media">
                        <% 
                        if (comentario.isReg() != 0) {
                        %>
                        <img src="<%= comentario.getImagen()%>" class="mr-3"
                             name="ImagenPerfil" alt="..."  width="70px">
                        <div class="media-body">
                        <h5 class="mt-0" name="NombreComentario"><%= comentario.getNombreUsuario()%></h5>
                        <% 
                            } else {
                        %>
                        <img src="Imagenes/anonimo1.png" class="mr-3"
                             name="ImagenPerfil" alt="..." width="70px">
                        <div class="media-body">
                        <h5 class="mt-0" name="NombreComentario"><%= comentario.getAnonimo()%></h5>
                        
                        <% 
                            }
                        %>                        
                        
                        
                        <h4><%= comentario.getFecha()%></h4>
                        <p class="text"> <%= comentario.getTexto()%> </p> 
                        
                        <div class="iconos">
                        <a href="Comentario_MeGusta?idc=<%= comentario.getId()%>">
                        <img src="Imagenes/MeGusta.png"  alt="MeGusta.PNG" class="Like">
                         </a>
                         <a href="Comentario_No_MeGusta?idc=<%= comentario.getId()%>">
                        <img src="Imagenes/NoMeGusta.png"  alt="NoMeGusta.PNG" class="NoLike">
                        </a>
                        </div>
                        <div class="iconos">
                        <h3>Puntaje: <%= comentario.getCalif()%></h3>
                        
                        </div>
                        
                        <div class="media-body">

                       
                        <% 
                            int idcom = comentario.getId();
                            idcom = comentario.getId();
              
                            if (respuestas.size() > 0) {
                                for (Comentarios respuesta : respuestas) {
                                    if (comentario.getId() == respuesta.getIdComent()){
                        %>

                        
                        <div class="media-body">
                            <img src="<%= respuesta.getImagen()%>" class="mr-" name="ImagenPerfil" alt="...">
                            
                            <h5 class="mt-0" name="NombreComentario"><%= respuesta.getNombreUsuario()%></h5>
                            <p class="text"> <%= respuesta.getTexto()%> </p>           

                        </div>

                            <%
                                        }
                                    }
                                }
                            %>
                            

                    </div>
                                      
                    <%
                    
                    if (nombre != null) {
                    %>



                    <form method="POST" action="RespuestasController" class="controlador">
                        <div class="form-group">
                            <label for="commentary" class="comentario">Escribir Respuesta</label>
                            <textarea class="form-control" name="commentary" id="commentary" rows="2"></textarea>
                            <input type="hidden" name="ID" value ="<%= noticia.getId()%>" >
                            <input type="hidden" name="IDComment" value ="<%= comentario.getId()%>" >
                        </div>
                        <div class="form-group">
                            <input class="btn btn-dark" name="Enviar" type="submit" value="Respuesta">
                        </div>
                    </form>
                        
                        
                        <% 
                            }
                        %>
                        
                        

                        </div>


                    </div>


                       <% 
                            }
                        %> 
                            <%
                                    }
                                }
                            %>





                


           
            </div>
            





        </div>



    </body>

</html>
