<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.Colaborador" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: marin
  Date: 20/04/2026
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Colaboradores</title>
    <link rel="stylesheet" href="/css/colaboradores.css" />
</head>
<body>
    <%
        List<Colaborador> colaboradores = (List<Colaborador>) request.getAttribute("colaboradores");
    %>
    <h1>Colaboradores</h1>
    <main>
        <section class="display-fila">
            <table>
                <thead>
                <tr>
                    <th>Colaborador</th>
                    <th>Domicilio</th>
                    <th>Localidad</th>
                    <th>Colabora en</th>
                    <th>Coordinador</th>
                    <th>Contacto Principal</th>
                    <th>Observaciones</th>
                </tr>
                </thead>
                <tdata>
                    <%
                        for (Colaborador colaborador : colaboradores) {

                    %>
                    <tr>
                        <td><%=colaborador.getNombre()%></td>
                        <td><%=colaborador.getDomicilio()%></td>
                        <td><%=colaborador.getLocalidadSede().getNombre()%></td>
                        <td><%=colaborador.getColaboraEn().getNombre()%></td>
                        <td><%=colaborador.getCoordinador().getNombre()%></td>
                        <td><%=colaborador.getContactoPrincipal()%></td>
                        <td><%=colaborador.getObservaciones()%></td>
                    </tr>
                    <%
                        }
                    %>
                </tdata>
            </table>
            <jsp:include page="info_colaboradores.jsp" />
        </section>
    </main>
</body>
</html>
