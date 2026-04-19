<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.TiendaCampanya" %>
<%@ page import="java.util.List" %><%-- Created by IntelliJ IDEA. User: javie Date: 18/04/2026 Time: 23:35 To
change this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/voluntarios.css" />
  </head>
  <body>
  <%
    List<TiendaCampanya> tiendas = (List<TiendaCampanya>) request.getAttribute("tiendaCampanyas");
  %>
    <h1>Asignación de voluntarios</h1>
  <main>


    <table>
      <thead>
        <tr>
          <th>Tienda</th>
          <th>Domicilio</th>
          <th>Localidad</th>
          <th>Capitan</th>
          <th>Viernes Mañana</th>
          <th>Viernes Tarde</th>
          <th>Sabado Mañana</th>
          <th>Sabado Tarde</th>
          <th>Observaciones</th>
        </tr>
      </thead>
      <tbody id="table-body">
      <%
        for(TiendaCampanya tienda: tiendas ) {
      %>
        <tr>
          <td><%= tienda.getTienda().getNombre() %></td>
          <td><%= tienda.getTienda().getDomicilio() %> </td>
          <td><%= tienda.getTienda().getLocalidad().getNombre() %></td>
          <td><%= tienda.getCapitan().getNombre() %> </td>
          <td>Nadie Aún</td>
          <td>Nadie Aún</td>
          <td>Nadie Aún</td>
          <td>Nadie Aún</td>
          <td style="max-width: 35vw">Un nene se ha cagado en la sección de congelados, ha tenido que venir mari carmen a limpiarlo todo</td>
        </tr>
      <%
        }
      %>
      </tbody>
    </table>
  </main>
    <div id="info-container">
      <div id="volunteer-container">
        <div id="volunteer-localization">
          <div><p id="lbl-tienda">Carrefour</p></div>
          <div><p id="lbl-domicilio">Calle Principal</p></div>
        </div>
        <div id="volunteer-schedule">
          <label for="volunteer-1">
            <input type="checkbox" id="volunteer-1" name="schedule" value="viernes_manana" />
            Viernes mañana
          </label>
          <label for="volunteer-2">
            <input type="checkbox" id="volunteer-2" name="schedule" value="sabado_manana" />
            Sabado Mañana
          </label>
          <label for="volunteer-3">
            <input type="checkbox" id="volunteer-3" name="schedule" value="sabado_tarde" />
            Sabado tarde
          </label>
        </div>
        <div id="volunteer-info">
          <div id="volunteer-name">
            <div>
              <p id="lbl-capitan">AYUNTAMIETNO DE ALMAYATE</p>
            </div>
            <div class="volunteer-date">
              <div>COMIENZO</div>
              <div>10</div>
            </div>
            <div class="volunteer-date">
              <div>FIN</div>
              <div>14</div>
            </div>
          </div>
          <div id="volunteer-observations">
            <p id="lbl-obs">TENEMOS 10 VOLUNTARIOS DISPONIBLES</p>
          </div>
        </div>
      </div>
      <div id="button-container">
        <button id="save-button">Guardar</button>
        <button id="cancel-button">Cancelar</button>
        <button id="export-button">Exportar</button>
      </div>
    </div>
  </body>
  <script>
    /*
	// Simulación de datos para llenar la tabla
    const trOriginal = document.querySelector("#table-body tr");
    for (let i = 0; i < 5; i++) {
        let clonedRow = trOriginal.cloneNode(true);
        let cells = clonedRow.querySelectorAll("td");
        cells[0].innerText = "Tienda " + i;
        cells[1].innerText = "Domicilio " + i;
        cells[2].innerText = "Localidad " + i;
        cells[3].innerText = "Capitan " + i;
        cells[8].innerText = "Observaciones " + i;
        trOriginal.parentNode.appendChild(clonedRow);
    }
	trOriginal.parentNode.removeChild(trOriginal);
    */
	const table = document.querySelector("#table-body");
	const form = document.querySelector("#volunteer-container");
	
	const lblTienda = document.getElementById('lbl-tienda');
    const lblDomicilio = document.getElementById('lbl-domicilio');
    const lblCapitan = document.getElementById('lbl-capitan');
    const lblObs = document.getElementById('lbl-obs');
	
	table.addEventListener("click", (e) => {
		const row = e.target.closest("tr");
		if (!row) return; // Se ha pinchado en otro lado

		// Limpiamos la clase selected de las otras filas
		table.querySelectorAll("tr").forEach(row => row.classList.remove("selected"));

		// Se la metemos a la clase seleccionada
		row.classList.add("selected");

		const info = row.querySelectorAll("td");
		
		lblTienda.innerText = info[0].innerText;
        lblDomicilio.innerText = info[1].innerText;
        lblCapitan.innerText = info[3].innerText;
        lblObs.innerText = info[8].innerText;
		
		form.style.visibility = 'visible';
	})

	document.querySelector("#cancel-button").addEventListener("click", (e) => {
		e.preventDefault();
		form.style.visibility = 'hidden';
	})
  </script>
</html>
