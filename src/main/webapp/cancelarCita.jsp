<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Cancelar Cita</title>
    <link rel="stylesheet" href="cancelarCita.css">
</head>
<body>
    <div class="container">
        <h2>Cancelar Cita</h2>
        <form action="ListarCitasCancelarServlet" method="get">
            <label for="documento">Número de Documento:</label>
            <input type="text" id="documento" name="documento" required>
            <button type="submit">Consultar Citas</button>
        </form>
    </div>
</body>
</html>
