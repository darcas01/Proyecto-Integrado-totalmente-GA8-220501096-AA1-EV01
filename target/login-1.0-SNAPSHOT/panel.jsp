<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Panel de Usuario</title>
    <link rel="stylesheet" href="EstilosLogin.css">
    <style>
        .container-panel {
            max-width: 900px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .header-panel {
            text-align: center;
            color: #ff6a00;
            margin-bottom: 20px;
        }
        .header-panel img {
            width: 100px;
            height: 100px;
        }
        .welcome-text {
            font-size: 24px;
            color: #ff6a00;
            margin-bottom: 20px;
        }
        .nav-panel ul {
            list-style: none;
            padding: 0;
        }
        .nav-panel ul li {
            margin: 15px 0;
        }
        .nav-panel ul li a {
            text-decoration: none;
            color: #007BFF;
            font-size: 18px;
            font-weight: bold;
        }
        .nav-panel ul li a:hover {
            color: #ff6a00;
        }
    </style>
</head>
<body>
    <div class="container-panel">
        <%
            String usuario = (String) session.getAttribute("usuario");
            Boolean loginAPI = (Boolean) session.getAttribute("loginAPI");

            if (usuario == null) {
                response.sendRedirect("login.html");
                return;
            }

            String mensajeBienvenida = (loginAPI != null && loginAPI) 
                ? "Bienvenido, usuario de la API: " + usuario + "!" 
                : "Bienvenido, " + usuario + "!";
        %>
        <div class="header-panel">
            <img src="CorazonAzulSalud.jpg" alt="Logo CompensApp">
            <h2><%= mensajeBienvenida %></h2>
        </div>
        <div class="welcome-text">
            <p>Este es tu panel de usuario. Selecciona una opción:</p>
        </div>
        <div class="nav-panel">
            <ul>
                <li><a href="agendarCita.jsp">Agendar Cita</a></li>
                <li><a href="pedirDocumento.jsp">Modificar Cita</a></li>
                <li><a href="pedirDocumentoCancelar.jsp">Cancelar Cita</a></li>
                <li><a href="pedirDocumentoHistorial.jsp">Historial de Citas</a></li> <!-- Nuevo enlace -->
                <li><a href="CerrarSesionServlet">Cerrar Sesión</a></li>
            </ul>
        </div>
    </div>
</body>
</html>