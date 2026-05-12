<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.List" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.Tienda" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.Cadena" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.TipoCampanya" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.Campanya" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gestión de Cadenas</title>
    <link rel="stylesheet" href="/css/global.css">
    <link rel="stylesheet" href="/css/campanyas.css">
</head>
<body>
<%
    List<Cadena> listaCadenas = (List<Cadena>) request.getAttribute("cadenasSistema");

%>
<jsp:include page="../shared/navbar.jsp"/>
<main class="main-page">
    <section class="campanya-form-wrapper">
        <div class="campanya-header">
            <div>
                <h2>Gestión de Cadenas</h2>
                <p>Modifica, añade u elimina datos de cadenas registradas en el sistema.</p>
            </div>
            <div class ="campanya-list-actions">
                <a class="btn-nueva-cadena" href="/campanyas/crearCadena" >
                    <span style="font-size: 20px">+</span><span style="font-size: 15px">Nueva cadena</span>
                </a>
            </div>
        </div>

        <form action="/campanyas/eliminarCadenasSistema" method="post">
            <div class="card campanya-table-card">
                <table class="modernTable">
                    <thead>
                    <tr>
                        <th>Tipo de campaña</th>
                        <th>Nombre</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>

                    <tbody>
                    <% for(Cadena c : listaCadenas) { %>
                    <tr>
                        <td><%= c.getNombre()%></td>
                        <td><%= c.getCodigo()%></td>
                        <td>
                            <a class="edit-campanya-btn" href="/campanyas/editarCadena?id=<%=c.getId()%>">
                                <span class="edit-campanya-icon">✎</span>
                                <span>Editar</span>
                            </a>
                            <div class =delete-cdn-check >
                                <input type="checkbox" name="cadenas" value="<%=c.getId()%>">
                                <span>Eliminar</span>
                                </input>
                            </div>

                        </td>

                    </tr>
                    <% }; %>
                    </tbody>
                </table>
            </div>
            <div class="campanya-list-actions">
                <a class="btn-outline" href="/campanyas/gestionarCadenas">Cancelar Cambios</a>
                <button type="submit">
                    Eliminar Cadenas
                </button>
            </div>
        </form>


    </section>
</main>
</body>
</html>