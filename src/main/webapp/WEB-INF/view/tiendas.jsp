<%@ page import="java.util.List" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.Tienda" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Tiendas</title>
        <link rel="stylesheet" href="/css/tiendas.css">
    </head>
    <body>
    <%
        List<Tienda> tiendas = (List<Tienda>) request.getAttribute("tiendas");
    %>
        <header>
            <h1>GESTIÓN DE CAMPAÑAS - TIENDAS</h1>
        </header>
        <main>
            <section>
                <h2>Filtrado</h2>
                <div id="filtrado-tiendas">
                    <select name="cadena" id="cadena-tienda">

                        <option id="i"> FALTA por llamar a un bucle de caada cosa </option>
                    </select>
                </div>


            </section>

            <section>
                <h2>Tiendas</h2>
            </section>


        </main>
    </body>
</html>