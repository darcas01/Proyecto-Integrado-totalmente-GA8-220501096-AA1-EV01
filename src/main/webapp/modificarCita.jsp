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
            <label for="documento">Número de Documento:</label>
            <input type="text" id="documento" name="documento" value="<%= request.getAttribute("documento")%>" readonly>

            <!-- Cargar los datos de la cita seleccionada -->
            <input type="hidden" id="idCita" name="idCita" value="${idCita}">

            <label for="ubicacion">Ubicación:</label>
            <select id="ubicacion" name="ubicacion" required>
                <option value="${ubicacion}" selected>${ubicacion}</option>
                <option value="Kennedy">Kennedy</option>
                <option value="Venecia">Venecia</option>
            </select>

            <label for="especialista">Especialista:</label>
            <select id="especialista" name="especialista" required>
                <option value="${especialista}" selected>${especialista}</option>
                <option value="Dr. Juan Pérez">Dr. Juan Pérez (Esp: Oncología)</option>
                <option value="Dra. Ana Martínez">Dra. Ana Martínez (Esp: Pediatría)</option>
                <option value="Dr. Mario Andretti">Dr. Mario Andretti (Esp: Gastroenterología)</option>
                <option value="Dra. Francy Reyes">Dra. Francy Reyes (Esp: Neurología)</option>
                <option value="Dra. Manuela Beltran">Dra. Manuela Beltran (Esp: Psiquiatría)</option>
                <option value="Dr. Carlos Estupiñan">Dr. Carlos Estupiñan (Esp: Toxicología)</option>
                <option value="Dr. Fabio Espitia">Dr. Fabio Espitia (Medico General)</option>
                <option value="Dra. Ramona Lafaurie">Dra. Ramona Lafaurie (Médico General)</option>

            </select>

            <label for="especialidad">Especialidad:</label>
            <select id="especialidad" name="especialidad" required>
                <option value="${especialidad}" selected>${especialidad}</option>
                <option value="Oncología">Oncología</option>
                <option value="Pediatría">Pediatría</option>
                <option value="Gastroenterología">Gastroenterología</option>
                <option value="Neurología">Neurología</option>
                <option value="Psiquiatría">Psiquiatría</option>
                <option value="Toxicología">Toxicología</option>
                <option value="Médico General">Médico General</option>

            </select>

            <label for="fecha">Fecha:</label>
            <input type="date" id="fecha" name="fecha" value="${fecha}" required>

            <label for="hora">Hora:</label>
            <input type="time" id="hora" name="hora" value="${hora}" required>

            <!-- Botón de envío -->
            <button type="submit">Modificar Cita</button>
        </form>
    </div>
</body>
</html>