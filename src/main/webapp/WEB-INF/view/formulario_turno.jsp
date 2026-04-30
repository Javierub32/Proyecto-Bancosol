<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.AsignacionTurno" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.Tienda" %><%--
  Created by IntelliJ IDEA.
  User: javie
  Date: 22/04/2026
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AsignacionTurno asignacionTurno = (AsignacionTurno) request.getAttribute("asignacionTurno");
    Tienda tienda = asignacionTurno.getTiendaCampanya().getTienda();
%>
<html>
<head>
    <title>Asignacion de Turno</title>
</head>
<body>
<h1>Asignacion de Turno</h1>
<p>Tienda que estoy editando: <%=tienda.getNombre()%> - <%=tienda.getDomicilio()%></p>
<p>Tipo de turno: <%=asignacionTurno.getTipoTurno().getNombre()%></p>
<p>Lineal a editar: <%=asignacionTurno.getLineal()%></p>
<p>Id de asignación: <%= asignacionTurno.getId() != null ? asignacionTurno.getId()  : "No hay"%></p>
<form action="/guardarTurno" method="post">
    <p>
        <label for="input_colaboradores">Colaborador: </label>
        <select id="input_colaboradores" name="colaborador">

        </select>
    </p>
    <p>
        <label for="input_num_voluntarios">Hora Fin</label>
        <input id="input_num_voluntarios" type="number" name="numVoluntarios" value="<%=asignacionTurno.getNumVoluntarios() != null ? asignacionTurno.getNumVoluntarios() : ""%>">
    </p>
    <p>
        <label for="input_hora_inicio">Hora Inicio</label>
        <input id="input_hora_inicio" type="time" name="horaInicio" value="<%=asignacionTurno.getHoraInicio() != null ? asignacionTurno.getHoraInicio() : ""%>">
    </p>

    <p>
        <label for="input_hora_fin">Hora Fin</label>
        <input id="input_hora_fin" type="time" name="horaFin" value="<%=asignacionTurno.getHoraFin() != null ? asignacionTurno.getHoraFin() : ""%>">
    </p>

    <p>
        <label for="input_observaciones">Observaciones</label>
        <br>
        <textarea id="input_observaciones" name="observaciones" rows="5" cols="30"><%=asignacionTurno.getObservaciones() != null ? asignacionTurno.getObservaciones() : ""%></textarea>
    </p>
</form>
</body>
</html>
