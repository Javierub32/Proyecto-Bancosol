<%--
  Created by IntelliJ IDEA.
  User: marin
  Date: 29/04/2026
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<section>
    <table>
        <thead>
        <tr>
            <th colspan="3">Colaborador seleccionado</th>
        </tr>
        </thead>
        <tr>
            <td>COLABORADOR</td>
            <td colspan="2">Ayuntamiento de Málaga 1</td>
        </tr>
        <tr>
            <td>DOMICILIO</td>
            <td colspan="2">Dirección 1</td>
        </tr>
        <tr>
            <td>CP-LOCALIDAD</td>
            <td>00000</td>
            <td>Málaga</td>
        </tr>
        <tr>
            <td>COLABORA EN</td>
            <td colspan="2">Málaga</td>
        </tr>
        <tr>
            <td rowspan="3"> CONTACTO 1</td>
            <td>Nombre</td>
            <td>Pepe Perez 1</td>
        </tr>
        <tr>
            <td>Email</td>
            <td>correopepe@correo.com</td>
        </tr>
        <tr>
            <td>Teléfono</td>
            <td>111111111</td>
        </tr>
        <tr>
            <td rowspan="3"> CONTACTO 2</td>
            <td>Nombre</td>
            <td>Pepe Perez 2</td>
        </tr>
        <tr>
            <td>Email</td>
            <td>correopepe2@correo.com</td>
        </tr>
        <tr>
            <td>Teléfono</td>
            <td>222222222</td>
        </tr>
        <tr>
            <td rowspan="3"> CONTACTO 3</td>
            <td>Nombre</td>
            <td>Pepe Perez 3</td>
        </tr>
        <tr>
            <td>Email</td>
            <td>correopepe3@correo.com</td>
        </tr>
        <tr>
            <td>Teléfono</td>
            <td>333333333</td>
        </tr>
    </table>
    <section class="buttons-section">
        <section class="flex-buttons"   >
            <div class="column-button">
                <button id="anadir-b">Añadir colaborador</button>
                <button id="eliminar-b">Eliminar colaborador</button>
            </div>
            <div class="column-button">
                <button id="modificar-b">Modificar colaborador</button>
                <button id="asignar-b">Asignar a tienda</button>
            </div>
        </section>
        <section class="flex-action-buttons">
            <button id="cancelar-b">Cancelar</button>
            <button id="guardar-b">Guardar</button>
            <button id="exportar-b">Exportar</button>
        </section>
    </section>

</section>
</body>
</html>
