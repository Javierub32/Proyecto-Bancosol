<%--
  Created by IntelliJ IDEA.
  User: javie
  Date: 21/04/2026
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="volunteer-container">
    <div id="volunteer-localization">
        <div><p>Añade información a este turno</p></div>
        <div><p></p></div>
    </div>
    <div id="volunteer-schedule">
        <label for="viernes_manana">
            <input type="radio" id="viernes_manana" name="schedule" value="1" />
            Viernes Mañana
        </label>
        <label for="viernes_tarde">
            <input type="radio" id="viernes_tarde" name="schedule" value="2"/>
            Viernes Tarde
        </label>
        <label for="sabado_manana">
            <input type="radio" id="sabado_manana" name="schedule" value="3"/>
            Sabado Mañana
        </label>
        <label for="sabado_tarde">
            <input type="radio" id="sabado_tarde" name="schedule" value="4" />
            Sabado Tarde
        </label>
    </div>
    <div id="volunteer-info">
        <div id="volunteer-name">
            <div>
                <p></p>
            </div>
            <div class="volunteer-date">
                <div>COMIENZO</div>
                <div></div>
            </div>
            <div class="volunteer-date">
                <div>FIN</div>
                <div></div>
            </div>
        </div>
        <div id="volunteer-observations">
            <p></p>
        </div>
    </div>
</div>
<div id="button-container">
    <button id="create-button">Crear</button>
    <button id="cancel-button">Cancelar</button>
    <button id="export-button">Exportar</button>
</div>
