<%-- 
    Document   : CrearNoticia
    Created on : 10/12/2020, 12:22:38 PM
    Author     : Sara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <form action="NoticiaController" method="POST" enctype="multipart/form-data">
                    <h1 class="H1">CREAR NOTICIA</h1>

                    <div class="form-group">
                        <label for="Titulo" class="Subtitulos">Titulo de la noticia</label>
                        <input type="text" class="form-control" name="Titulo" placeholder="Los saltamontes no saltan montes">
                    </div>

                    <div class="form-group">
                        <label for="Descripcion" class="Subtitulos">Descripcion Corta</label>
                        <textarea class="form-control" name="Descripcion" id="Descripcion" placeholder="¡No te lo vas a creer! Los cientificos hablam sobre ello, algo que muchos ignoran y pocos se lo creen" rows="1"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="image" class="Subtitulos"> Primera Imagen</label>
                        <input type="file" class="form-control" name="PImage" id="PImage">
                    </div>

                    <div class="form-group">
                        <label for="Inf" class="Subtitulos">Primera informacion de la noticia</label>
                        <textarea class="form-control" name="Informacion1" id="Informacion1" rows="10"></textarea>
                    </div>



                    <div class="form-group">
                        <label for="image" class="Subtitulos"> Segunda Imagen</label>
                        <input type="file" class="form-control" name="SImage" id="SImage">
                    </div>

                    <div class="form-group">
                        <label for="Inf" class="Subtitulos">Segunda informacion de la noticia</label>
                        <textarea class="form-control" name="Informacion2" id="Informacion2" rows="10"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="image" class="Subtitulos"> Tercera Imagen</label>
                        <input type="file" class="form-control" name="TImage" id="TImage">
                    </div>

                    <div class="form-group">
                        <label for="Genero" class="Subtitulos">Genero de la noticia</label>
                        <select class="form-control" name="Genero" id="Genero">
                            <option value="-1">Seleccionar</option>
                            <option value = "4">Cine</option>
                            <option value = "5">Música</option>
                            <option value = "6">Politica</option>
                        </select>
                    </div>


                    <div class="group">
                        <input class="Subir" name="Subir" type="submit" value="Subir">
                    </div>

                    <div class="group">
                        <input class="Guardar" name="Guardar" type="submit" value="Guardar Borrador">
                    </div>

                </form>
            </div>
        </div>

    </body>

</html>