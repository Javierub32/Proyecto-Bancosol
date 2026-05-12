
<%@ page import="java.util.List" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.Tienda" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.Cadena" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.TipoCampanya" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.Campanya" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Edición de Cadena</title>
        <link rel="stylesheet" href="/css/global.css">
        <link rel="stylesheet" href="/css/campanyas.css">
    </head>
    <body>
    <%
        String nombreCadena = (String) request.getAttribute("nombreCadena");
        String codigoCadena = (String) request.getAttribute("codigoCadena");

        Boolean editando = (Boolean) request.getAttribute("editando");

        Integer idCadena = (Integer) request.getAttribute("idCadena");


    %>
    <jsp:include page="../shared/navbar.jsp"/>
        <main class="campanya-page">
            <section class="campanya-form-wrapper">
                <div class="campanya-header">
                    <div>
                        <h2>Datos de la <%= editando ? "" : "nueva" %> Cadena</h2>
                        <p>Rellenar la información de la cadena</p>
                    </div>
                </div>
                <div id="formularioCampanya" class="card campanya-form-card">
                    <form class="campanya-form" method="post" action="/campanyas/guardarCadena">
                        <% if (editando) { %>
                            <input type="hidden" name="id" value="<%= idCadena %>">
                        <% } %>
                        <section class="form-section">
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="fechaInicio">Nombre de la Cadena</label>
                                    <input id="nombreCampanya" type="text" name="nombre" value="<%= editando ? nombreCadena : "" %>" required placeholder="Nueva cadena de supermercados">
                                </div>
                                <div class="form-group">
                                    <label for="fechaFin">Codigo de la Campaña (Primeras letras)</label>
                                    <input id="nombreCampanya" type="text" name="codigo" value="<%= editando ? codigoCadena : "" %>" required placeholder="Mercadona -> MERC">
                                </div>
                            </div>
                        </section>
                        <section class="form-actions">
                            <%if (editando){%>
                                <a href="/campanyas" class="btn-outline">Salir sin guardar</a>
                            <%} else {%>
                                <a href="/campanyas" class="btn-outline">Cancelar</a>
                           <%};%>
                            <button type="submit" class="btn-primary">Guardar</button>
                        </section>

                    </form>
                </div>
            </section>
        </main>
    </body>
</html>