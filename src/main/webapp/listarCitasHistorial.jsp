<%@ page import="java.util.List" %>
<%@ page import="com.darwuich.compensapp.models.HistorialCita" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Historial de Citas</title>
    <link rel="stylesheet" href="historialCitas.css">
</head>
<body>
    <div class="container">
        <h2>Historial de Citas para el Documento: <%= request.getAttribute("documento") %></h2>
        <table>
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Ubicación</th>
                    <th>Especialista</th>
                    <th>Especialidad</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<HistorialCita> citas = (List<HistorialCita>) request.getAttribute("citas");
                    if (citas != null && !citas.isEmpty()) {
                        for (HistorialCita cita : citas) {
                %>
                <tr>
                    <td><%= cita.getFecha() %></td>
                    <td><%= cita.getHora() %></td>
                    <td><%= cita.getUbicacion() %></td>
                    <td><%= cita.getEspecialista() %></td>
                    <td><%= cita.getEspecialidad() %></td>
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
        
        <!-- Botón de regresar a inicio -->
        <form action="panel.jsp" method="get">
            <button type="submit">Regresar a Inicio</button>
        </form>
    </div>

    <footer>
        <div class="footer-content">
            <p>&copy; 2024 - Aplicación de Citas Médicas</p>
            <p>Línea nacional: 01 8000 91 52 02</p>
            <p>Línea de atención EPS Bogotá y Cundinamarca: 601 4441234</p>
            <a href="https://www.facebook.com/Compensarinfo"><img src="Facebook.png" alt="Facebook"></a>
            <a href="https://x.com/Compensar_info"><img src="x.png" alt="X"></a>
            <a href="https://www.youtube.com/user/Compensarinfo"><img src="Youtube.png" alt="YouTube"></a>
        </div>
    </footer>
</body>
</html>