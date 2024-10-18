<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Modificar Cita</title>
    <link rel="stylesheet" href="modificarCita.css">
</head>
<body>
    <div class="container">
        <h1>Modificar Cita</h1>
        <form id="modificarCitaForm" action="ModificarCitaServlet" method="post">
            <!-- Campo del documento -->
            <label for="documento">N�mero de Documento:</label>
            <input type="text" id="documento" name="documento" value="<%= request.getAttribute("documento")%>" readonly>

            <!-- Cargar los datos de la cita seleccionada -->
            <input type="hidden" id="idCita" name="idCita" value="${idCita}">

            <label for="ubicacion">Ubicaci�n:</label>
            <select id="ubicacion" name="ubicacion" required>
                <option value="${ubicacion}" selected>${ubicacion}</option>
                <option value="Kennedy">Kennedy</option>
                <option value="Venecia">Venecia</option>
            </select>

            <label for="especialista">Especialista:</label>
            <select id="especialista" name="especialista" required>
                <option value="${especialista}" selected>${especialista}</option>
                <option value="Dr. Juan P�rez">Dr. Juan P�rez (Esp: Oncolog�a)</option>
                <option value="Dra. Ana Mart�nez">Dra. Ana Mart�nez (Esp: Pediatr�a)</option>
                <option value="Dr. Mario Andretti">Dr. Mario Andretti (Esp: Gastroenterolog�a)</option>
                <option value="Dra. Francy Reyes">Dra. Francy Reyes (Esp: Neurolog�a)</option>
                <option value="Dra. Manuela Beltran">Dra. Manuela Beltran (Esp: Psiquiatr�a)</option>
                <option value="Dr. Carlos Estupi�an">Dr. Carlos Estupi�an (Esp: Toxicolog�a)</option>
                <option value="Dr. Fabio Espitia">Dr. Fabio Espitia (Medico General)</option>
                <option value="Dra. Ramona Lafaurie">Dra. Ramona Lafaurie (M�dico General)</option>

            </select>

            <label for="especialidad">Especialidad:</label>
            <select id="especialidad" name="especialidad" required>
                <option value="${especialidad}" selected>${especialidad}</option>
                <option value="Oncolog�a">Oncolog�a</option>
                <option value="Pediatr�a">Pediatr�a</option>
                <option value="Gastroenterolog�a">Gastroenterolog�a</option>
                <option value="Neurolog�a">Neurolog�a</option>
                <option value="Psiquiatr�a">Psiquiatr�a</option>
                <option value="Toxicolog�a">Toxicolog�a</option>
                <option value="M�dico General">M�dico General</option>

            </select>

            <label for="fecha">Fecha:</label>
            <input type="date" id="fecha" name="fecha" value="${fecha}" required>

            <label for="hora">Hora:</label>
            <input type="time" id="hora" name="hora" value="${hora}" required>

            <!-- Bot�n de env�o -->
            <button type="submit">Modificar Cita</button>
        </form>
    </div>
</body>
</html>