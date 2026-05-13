<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.TurnoEntity" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.TiendaEntity" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.ColaboradorEntity" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ColaboradorEntity colaborador = (ColaboradorEntity) request.getAttribute("colaborador");
%>

<div style="padding: 40px">
    <%= colaborador != null ? colaborador.getNombre() : "No hay"%>
</div>