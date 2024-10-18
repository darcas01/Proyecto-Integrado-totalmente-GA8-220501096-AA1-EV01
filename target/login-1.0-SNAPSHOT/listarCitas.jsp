<%@ page import="java.util.List" %>
<%@ page import="com.darwuich.compensapp.models.Cita" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Listado de Citas</title>
    <link rel="stylesheet" type="text/css" href="modificarCita.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
        }
        table th, table td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        table th {
            background-color: #ff6a00;
            color: white;
        }
        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        table tr:hover {
            background-color: #f1f1f1;
        }
        table td a {
            text-decoration: none;
            color: #007BFF;
        }
        table td a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Citas para el Documento: <%= request.getAttribute("documento") %></h2>

    <!-- El formulario envía los datos al servlet que cargará el formulario para modificar -->
    <form action="CargarModificarCitaServlet" method="post">
        <table>
            <thead>
                <tr>
                    <th>Seleccionar</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Especialista</th>
                    <th>Ubicación</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Cita> citas = (List<Cita>) request.getAttribute("citas");
                    if (citas != null && !citas.isEmpty()) {
                        for (Cita cita : citas) {
                %>
                <tr>
                    <!-- Enviar el idCita de la cita seleccionada al servlet para cargar los datos -->
                    <td><input type="radio" name="idCita" value="<%= cita.getIdCita() %>" required></td>
                    <td><%= cita.getFecha() %></td>
                    <td><%= cita.getHora() %></td>
                    <td><%= cita.getEspecialista() %></td>
                    <td><%= cita.getUbicacion() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5">No se encontraron citas.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <!-- Botón para enviar la cita seleccionada -->
        <button type="submit">Modificar Cita Seleccionada</button>
    </form>
</body>
</html>