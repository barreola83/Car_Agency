<%--
    Document   : index
    Created on : 2/11/2017, 10:38:11 PM
    Author     : geroC
--%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Agencia pagina oficial</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styles.css">
        <link href="css/creative.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body id="index" class="img-fluid">

        <nav id="mainNav" class="navbar navbar-expand-lg navbar-light fixed-top">
            <div class="container-fluid">
                <img id="logo" class="img-fluid" src="img/masterc.jpeg" alt="logoimg" align="left">
                <a id="tituloPrincipal" class="navbar-brand js-scroll-trigger" href="index.jsp" target="_self">Agencia de vehiculos</a>
                <a id="tituloPrincipal" class="navbar-brand js-scroll-trigger" href="ResultadosDeBusqueda.jsp" target="_self">go to search results (solo testeo)</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div id="navbarResponsive" align="right" class="collapse navbar-collapse">
                    <ul class="navbar-nav ml-auto navbar-right">
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#galeria">Cotización</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#cotizacion">Cotización</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="pruebaManejo.jsp" target="_self">Agendar prueba de manejo</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="text" placeholder="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                    </form>
                </div>
            </div>
        </nav>

        <div id="carousel" class="carousel slide containe" data-ride="carousel" align="center" >
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active">
                    <img style="width: 100%" class="d-block img-fluid" src="img/Autos/NismoSentra.jpg" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img style="width: 100%" class="d-block img-fluid" src="img/Autos/xtrail.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img style="width: 100%" class="d-block img-fluid" src="img/Autos/frontierNP300.jpg" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>


        <section style="width: 100%">
            <div id="galeria" style="background-color: white;">
                <nav class="navbar container">
                    <label class="title"><h2 class="my-4 text-center text-lg-left"><b>Galeria de vehiculos</b></h2></label>
                    <ul class="nav nav-tabs responsive-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#todos" role="tab"><b>Todos</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#autos" role="tab"><b>Autos</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#crossovers-suvs" role="tab"><b>Crossovers y suvs</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#pick-ups" role="tab"><b>Pick-ups</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#comerciales" role="tab"><b>Comerciales</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#hibridos-electricos" role="tab"><b>Híbridos y Eléctricos</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#deportivos" role="tab"><b>Deportivos</b></a>
                        </li>
                    </ul>
                </nav>
                <div class="tab-content container">
                    <div class="tab-pane fade active in show" id="todos" role="tabpanel">
                        <div class="row text-center text-lg-left">
                            <%
                                Connection connection;

                                PreparedStatement command;
                                ResultSet result;
                                HttpSession sessionInfo = request.getSession();

                                String codigo = request.getParameter("CountryCode");

                                try {
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/world?useSSL=false", "root", "4688");
                                    //connection = DriverManager.getConnection("jdbc:mysql://mysql31691-getacar.jl.serv.net.mx/world", "root", "dUh7Hmkszh");

                                    command = connection.prepareStatement("SELECT Name, District FROM city limit 20");
                                    //command.setString(1, codigo);
                                    //command.setString(2, distrito);
                                    result = command.executeQuery();
                                    int cont = 0;
                                    while (result.next()) {
                                        out.println("<div class=" + "'col-md-3'" + ">");
                                        out.println("<a href='vehicle-Information.jsp' ta" + "rget='_self' class='d-block mb-4 h-100'>");
                                        out.println("<img class='img-fluid img-thumbnail'" + " src='http://placehold.it/400x300' alt=''>");
                                        out.println("<div style='position:relative; top:-" + "60px; left:10px; z-index: 1;color: #004085; font-s" + "size: 18px'><b>" + result.getString(1) + "</b></div>");
                                        out.println("<div style='position:relative; top:-" + "60px; left:10px; z-index: 1'><p style='color: gray" + "'>Desde: <b style='color: #c82333'>" + result.getString(2) + "</b></p><" + "/div>");
                                        out.println("</a>");
                                        out.println("</div>");
                                    }
                                } catch (Exception e) {
                                    System.out.println(e.getMessage());
                                }
                            %>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="autos" role="tabpanel">
                        <div class="row text-center text-lg-left">

                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="crossovers-suvs" role="tabpanel">
                        <div class="row text-center text-lg-left">

                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="pick-ups" role="tabpanel">
                        <div class="row text-center text-lg-left">

                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="comerciales" role="tabpanel">
                        <div class="row text-center text-lg-left">

                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="hibridos-electricos" role="tabpanel">
                        <div class="row text-center text-lg-left">

                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="deportivos" role="tabpanel">
                        <div class="row text-center text-lg-left">

                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a href="vehicle-Information.jsp" target="_self" class="d-block mb-4 h-100">
                                    <img class="img-fluid img-thumbnail" src="http://placehold.it/400x300" alt="">
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1;color: #004085; font-size: 18px"><b>Nombre auto</b></div>
                                    <div style="position:relative; top:-60px; left:10px; z-index: 1"><p style="color: gray">Desde: <b style="color: #c82333">precio</b></p></div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section style="padding-top: 0px; padding-bottom: 0px">
            <div id="cotizacion" class="bg-dark" style="width: 100%; padding-top: 150px; padding-bottom: 150px;">
                <div class="container">
                    <label style="color: white"><h2 class="my-4 text-center text-lg-left"><b>Cotización</b></h2></label>
                    <form action="email-enviado.jsp" method="post" class="form-inline">
                        <div style="padding-bottom: 15px" class="col-md-5">
                            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                <div class="input-group-addon"><img style="width: 15px" class="img-fluid" src="img/util/iconperson.png"></div>
                                <input name="nombre" type="text" class="form-control" id="txtNombre" placeholder="*Nombre" required>
                            </div>
                        </div>
                        <div style="padding-bottom: 15px" class="col-md-7">
                            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                <div class="input-group-addon"><img style="width: 15px" class="img-fluid" src="img/util/iconperson.png"></div>
                                <input name="apellido" type="text" class="form-control" id="txtApellido" placeholder="*Apellido" required>
                            </div>
                        </div>
                        <div style="padding-bottom: 15px" class="col-md-3">
                            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                <div class="input-group-addon"><img style="width: 15px" class="img-fluid" src="img/util/icontelephone.png"></div>
                                <input name="telefono" type="tel" pattern="\d*" class="form-control" id="txtTelefono" placeholder="*Teléfono" required>
                            </div>
                        </div>
                        <div style="padding-bottom: 15px;" class="col-md-6">
                            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                <div class="input-group-addon">@</div>
                                <input name="email" type="email" class="form-control" id="txtEmail" placeholder="*Email" required>
                            </div>
                        </div>
                        <div style="padding-bottom: 15px" class="col-md-3">
                            <select name="vehiculo" id="span_small" class="form-control select2-single select2-hidden-accessible" tabindex="-1" aria-hidden="true" required>
                                <option value="">*Elige un vehiculo</option>
                                <optgroup label="Alaskan/Hawaiian Time Zone">
                                    <option value="">Alaska</option>
                                </optgroup>
                                <optgroup label="Pacific Time Zone">
                                    <option value="California">California</option>
                                    <option value="">Nevada</option>
                                    <option value="Nevada">Oregon</option>
                                    <option value="Washington">Washington</option>
                                </optgroup>

                            </select>
                        </div>
                        <div style="margin-top: 10px;" class="offset-5 col-2">
                            <button type="submit" class="btn">Enviar</button>
                        </div>
                    </form>

                </div>
            </div>
            <div id="footer" style="background-color: white; padding-top: 60px; padding-bottom: 60px">
                <div class="container">
                    <label class="title"><h2 class="my-4 text-center text-lg-left"><b>Contactanos en</b></h2></label>
                    <h5>Calle Lic. Carlos de La Madrid Béjar 891<br> Centro, 28000 Colima, Col.</h5>
                    <a href="#" class="fa fa-facebook"></a>
                    <a href="#" class="fa fa-twitter"></a>
                    <a href="#" class="fa fa-google"></a>
                </div>
            </div>
        </section>

        <script>
            window.onscroll = function () {
                myFunction();
            };

            function myFunction() {
                if (document.body.scrollTop > 500 || document.documentElement.scrollTop > 500) {
                    document.getElementById('mainNav').className = 'navbar navbar-expand-lg navbar-light fixed-top navbar-shrink';
                } else
                {
                    document.getElementById('mainNav').className = 'navbar navbar-expand-lg navbar-light fixed-top';
                }
            }
        </script>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
