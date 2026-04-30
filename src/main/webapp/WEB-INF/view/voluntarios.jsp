<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.TiendaCampanya" %>
<%@ page import="java.util.List" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.VistaAsignacionColaboradores" %><%-- Created by IntelliJ IDEA. User: javie Date: 18/04/2026 Time: 23:35 To
change this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/voluntarios.css" />
  </head>
  <body>
  <%
    List<VistaAsignacionColaboradores> tiendas = (List<VistaAsignacionColaboradores>) request.getAttribute("asignacionColaboradores");


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
        </tr>
      </thead>
      <tbody id="table-body">
      <%
        for(VistaAsignacionColaboradores tienda: tiendas ) {
      %>
        <tr data-id="<%= tienda.getIdTiendaCampanya() %>" data-li="<%= tienda.getLineales()%>">
          <td><%= tienda.getTienda() %></td>
          <td><%= tienda.getDomicilio() %> </td>
          <td><%= tienda.getLocalidad() %></td>
          <td><%= tienda.getCapitan() %> </td>
          <td><%= tienda.getViernesManana() != null ? tienda.getViernesManana() : "" %></td>
          <td><%= tienda.getViernesTarde() != null ? tienda.getViernesTarde() : ""  %></td>
          <td><%= tienda.getSabadoManana() != null ? tienda.getSabadoManana() : ""  %></td>
          <td><%= tienda.getSabadoTarde() != null ? tienda.getSabadoTarde() : "" %></td>
        </tr>
      <%
        }
      %>
      </tbody>
    </table>
  </main>
    <div id="info-container">
      <jsp:include page="info_turno.jsp" />
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
    const infoContainer = document.querySelector("#info-container");
    infoContainer.innerHTML = "";

    let id;
    let lineales = 1;
    let linealActual = 1;
    let turno = 1;


    function fetchTurnoData() {
      if (!id) return;

      const params = new URLSearchParams();
      params.append("id", id);
      params.append("turno", turno);
      params.append("lineales", lineales);
      params.append("linealActual", linealActual);


      fetch("/buscarTurno", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: params.toString()
      })
              .then(response => response.text())
              .then(html => {
                // Reemplazamos el HTML con la nueva información
                infoContainer.innerHTML = html;

                // Hacemos visible el formulario
                const form = document.querySelector("#volunteer-container");
                if(form) form.style.visibility = 'visible';
              })
              .catch(error => console.error("Error:", error));
    }

	table.addEventListener("click", (e) => {
		const row = e.target.closest("tr");
		if (!row) return; // Se ha pinchado en otro lado

        // Cambiamos el id y los lineales de la tienda
        id = row.dataset.id;
        lineales = row.dataset.li;

        // Ponemos como turno por defecto el Viernes por la mañana y el lineal 1
        turno = 1;
        linealActual = 1;

		// Limpiamos la clase selected de las otras filas
		table.querySelectorAll("tr").forEach(row => row.classList.remove("selected"));

		// Se la metemos a la clase seleccionada
		row.classList.add("selected");


        // Hacemos la petición para obtener los datos de la tienda y el turno 1
        fetchTurnoData();
	})

    // Usamos delegación de eventos en #info-container para los radio buttons
    // ya que su HTML se destruye y se vuelve a crear con cada petición fetch
    infoContainer.addEventListener("change", (e) => {
      if (e.target.name === "schedule") {
        turno = e.target.value;
        fetchTurnoData(); // Volvemos a pedir los datos con el nuevo turno
      }
    });

    infoContainer.addEventListener("change", (e) => {
      if (e.target.name === "lineal") {
        linealActual = e.target.value;
        fetchTurnoData(); // Volvemos a pedir los datos con el nuevo turno
      }
    })

    // Delegación de eventos para el botón de cancelar
    infoContainer.addEventListener("click", (e) => {
      if (e.target.id === "create-button") {
        console.log("Botón pulsado. ID:", id, "Turno:", turno, "Lineal:", linealActual);

        if (id && turno && linealActual) {
          const params = new URLSearchParams();
          params.append("id", id);
          params.append("turno", turno);
          params.append("lineal", linealActual);

          // Usamos backticks (`) para que la variable se evalúe correctamente
          window.location.href = `/crearTurno?\${params.toString()}`;
        } else {
          console.error("Faltan datos para navegar");
        }
      }

      if (e.target.id === "cancel-button") {
        e.preventDefault();

        const form = document.querySelector("#volunteer-container");
        if (form) form.style.visibility = 'hidden';
        infoContainer.innerHTML = "";
        turno = 1;
        id = null;
        lineales = 1;
        table.querySelectorAll("tr").forEach(row => row.classList.remove("selected"));
      }
    });
  </script>
</html>
