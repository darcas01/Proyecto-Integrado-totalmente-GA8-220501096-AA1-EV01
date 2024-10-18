<%@ page import="java.util.List" %>
<%@ page import="com.darwuich.compensapp.models.Cita" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Citas para Cancelar</title>
    <link rel="stylesheet" href="cancelarCita.css">
</head>
<body>
    <div class="container">
        <h2>Citas para el Documento: <%= request.getAttribute("documento") %></h2>
        <table>
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Especialista</th>
                    <th>Ubicación</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Cita> citas = (List<Cita>) request.getAttribute("citas");
                    if (citas != null && !citas.isEmpty()) {
                        for (Cita cita : citas) {
                %>
                <tr>
                    <td><%= cita.getFecha() %></td>
                    <td><%= cita.getHora() %></td>
                    <td><%= cita.getEspecialista() %></td>
                    <td><%= cita.getUbicacion() %></td>
                    <td>
                        <form action="CancelarCitaServlet" method="post">
                            <input type="hidden" name="idCita" value="<%= cita.getIdCita() %>">
                            <button type="submit" class="btn-cancel">Cancelar</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5">No se encontraron citas para cancelar.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>