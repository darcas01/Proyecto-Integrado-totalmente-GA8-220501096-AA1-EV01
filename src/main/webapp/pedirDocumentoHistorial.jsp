<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Historial de Citas</title>
    <link rel="stylesheet" href="historialCitas.css">
</head>
<body>
    <div class="container">
        <img src="CorazonAzulSalud.jpg" alt="Logo Coraz�n" width="20%" height="50%">
        <h2>CompensApp</h2>
        <h3>Historial de Citas</h3>

        <form action="ListarCitasHistorialServlet" method="get">
            <label for="documento">N�mero de Documento:</label>
            <input type="text" id="documento" name="documento" required>
            <button type="submit">Ver Historial</button>
        </form>
    </div>

    <footer>
        <div class="footer-content">
            <p>&copy; 2024 - Aplicaci�n de Citas M�dicas</p>
            <p>L�nea nacional: 01 8000 91 52 02</p>
            <p>L�nea de atenci�n EPS Bogot� y Cundinamarca: 601 4441234</p>
            <a href="https://www.facebook.com/Compensarinfo"><img src="Facebook.png" alt="Facebook"></a>
            <a href="https://x.com/Compensar_info"><img src="x.png" alt="X"></a>
            <a href="https://www.youtube.com/user/Compensarinfo"><img src="Youtube.png" alt="YouTube"></a>
        </div>
    </footer>
</body>
</html>