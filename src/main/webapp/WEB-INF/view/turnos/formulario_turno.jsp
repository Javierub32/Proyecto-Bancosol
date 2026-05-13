<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.TiendaEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.TurnoEntity" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.TurnoEntity" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TurnoEntity turno = (TurnoEntity) request.getAttribute("asignacionTurno");
    com.leftjoiners.bancosol.proyectobackend.entity.TiendaEntity tienda = turno.getTiendaCampanya().getTienda();
    List<ColaboradorEntity> colaboradores = (List<ColaboradorEntity>) request.getAttribute("colaboradores");
    ColaboradorEntity colaboradorModal = (ColaboradorEntity) request.getAttribute("colaborador");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Asignación de Turno</title>
    <link rel="stylesheet" href="/css/global.css" />
    <link rel="stylesheet" href="/css/formularioTurno.css" />
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body class="formulario-turno-page">

<jsp:include page="../shared/navbar.jsp"/>
<div style="display: flex; flex-direction: row" >
    <div class="form-turno">
        <div class="turno-info">
            <div class="turno-info-row">
                <span><%=tienda.getNombre()%> - <span class="text-mutex"><%=tienda.getDomicilio()%></span></span>
                <span><%=turno.getTipoTurno().getNombre()%></span>
            </div>
            <div class="turno-info-row">
                <span></span>
                <span>Lineal <%=turno.getLineal()%></span>
            </div>
        </div>

        <form action="/turnos/guardarTurno" method="post">
            <input type="hidden" value="<%=turno.getId() != null ? turno.getId() : ""%>" name="id">
            <input type="hidden" value="<%=turno.getTiendaCampanya().getId()%>" name="tiendaCampanyaId">
            <input type="hidden" value="<%=turno.getTipoTurno().getId()%>" name="tipoTurnoId">
            <input type="hidden" value="<%=turno.getLineal()%>" name="lineal">

            <div class="form-group">
                <label for="input_colaboradores">Colaborador:</label>
                <select id="input_colaboradores" name="idColaborador">
                    <option value="0">Seleccione un colaborador...</option>
                    <%for (ColaboradorEntity colaborador : colaboradores) {%>
                    <option value="<%=colaborador.getId()%>" <%=turno.getColaborador() != null && turno.getColaborador().equals(colaborador) ? "selected" : "" %>>
                        <%=colaborador.getNombre()%>
                    </option>
                    <%}%>
                </select>
            </div>

            <div class="form-group">
                <label for="input_num_voluntarios">Número de voluntarios:</label>
                <input id="input_num_voluntarios" type="number" name="numVoluntarios"
                       value="<%=turno.getNumVoluntarios() != null ? turno.getNumVoluntarios() : ""%>">
            </div>

            <div class="form-group-row">
                <div class="form-group">
                    <label for="input_hora_inicio">Hora Inicio:</label>
                    <input id="input_hora_inicio" type="time" name="horaInicio"
                           value="<%=turno.getHoraInicio() != null ? turno.getHoraInicio() : ""%>">
                </div>

                <div class="form-group">
                    <label for="input_hora_fin">Hora Fin:</label>
                    <input id="input_hora_fin" type="time" name="horaFin"
                           value="<%=turno.getHoraFin() != null ? turno.getHoraFin() : ""%>">
                </div>
            </div>

            <div class="form-group">
                <label for="input_observaciones">Observaciones:</label>
                <textarea id="input_observaciones" name="observaciones" rows="4"><%=turno.getObservaciones() != null ? turno.getObservaciones() : ""%></textarea>
            </div>

            <button type="submit" class="btn-submit">Guardar Turno</button>
        </form>
    </div>
    <div id="colaborador_container">
        <%if (colaboradorModal != null){%>
            <jsp:include page="../colaboradores/info_colaboradores.jsp"/>

        <%}%>
    </div>
</div>
</body>
<script>
    const colaboradorContainer = document.querySelector("#colaborador_container");
    const inputColaboradores = document.querySelector("#input_colaboradores");
    let colaboradorActual = inputColaboradores.value;

    function fetchColaboradorData() {
        if (colaboradorActual == 0) {
            colaboradorContainer.innerHTML = "";
            return;
        }

        const params = new URLSearchParams();
        params.append("id", colaboradorActual);

        fetch("/turnos/buscarColaborador", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: params.toString()
        })
            .then(response => response.text())
            .then(html => {colaboradorContainer.innerHTML = html})
            .catch(error => console.error("Error:", error));
    }

    inputColaboradores.addEventListener("change", (e) => {
        colaboradorActual = e.target.value;
        fetchColaboradorData();
    })
</script>
</html>