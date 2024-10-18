<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detalle de la Cita - CompensApp</title>
    <style>
        body { background-color: #ff6600; font-family: Arial, sans-serif; }
        .container { background-color: #f2f2f2; margin: 0 auto; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); width: 60%; text-align: center; }
        h1 { color: #ff6600; }
        p { font-size: 18px; }
        .button-container {
            margin-top: 20px;
        }
        .button-container a {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 10px;
        }
        .button-container a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Detalle de la Cita</h1>
    <%
        String documento = request.getParameter("documento");
        String ubicacion = request.getParameter("ubicacion");
        String especialista = request.getParameter("especialista");
        String especialidad = request.getParameter("especialidad");
        String hora = request.getParameter("hora");
        String fecha = request.getParameter("fecha");
    %>
    <p><strong>Número de Documento:</strong> <%= documento %></p>
    <p><strong>Ubicación:</strong> <%= ubicacion %></p>
    <p><strong>Especialista:</strong> <%= especialista %></p>
    <p><strong>Especialidad:</strong> <%= especialidad %></p>
    <p><strong>Hora:</strong> <%= hora %></p>
    <p><strong>Fecha:</strong> <%= fecha %></p>
    <p>¡Su cita ha sido agendada exitosamente!</p>

    <!-- Botones para regresar al menú principal o agendar otra cita -->
    <div class="button-container">
        <a href="panel.jsp">Regresar al Menú Principal</a>
        <a href="agenda.jsp">Agendar otra Cita</a>
    </div>
</div>
</body>
</html>