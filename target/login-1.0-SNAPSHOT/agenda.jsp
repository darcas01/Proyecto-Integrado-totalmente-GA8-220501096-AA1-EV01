<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agendar Cita - CompensApp</title>
    <link rel="stylesheet" href="Agendar.css">
</head>
<body>
    <div class="container">
        <h2>Bienvenid@s a Agendar Cita</h2>
        <img align="right" src="Compensarsalud.jpg" width="10%" height="10%">
        <img src="Familia.jpg" alt="Familia" class="center-image" width="10%" height="10%">
        <h2>Usuario</h2>
        <h2>Es un placer Atenderte</h2>

        <!-- Formulario para ingresar documento y agendar cita -->
        <form id="agendarCitaForm" action="AgendarCitaServlet" method="post">
            <label for="documento">Número de Documento:</label>
            <input type="text" id="documento" name="documento" required>

            <!-- Ubicación -->
            <label for="ubicacion">Ubicación:</label>
            <select id="ubicacion" name="ubicacion" required>
                <option value="">Seleccione una Ubicación</option>
                <option value="Kennedy">Kennedy</option>
                <option value="Venecia">Venecia</option>
            </select>

            <!-- Especialista -->
            <label for="especialista">Especialista:</label>
            <select id="especialista" name="especialista" required>
                <option value="">Seleccione un Especialista</option>
                <option value="Dr. Juan Pérez">Dr. Juan Pérez (Esp: Oncología)</option>
                <option value="Dra. Ana Martínez">Dra. Ana Martínez (Esp: Pediatría)</option>
                <option value="Dr. Mario Andretti">Dr. Mario Andretti (Esp: Gastroenterología)</option>
                <option value="Dra. Francy Reyes">Dra. Francy Reyes (Esp: Neurología)</option>
                <option value="Dra. Manuela Beltran">Dra. Manuela Beltran (Esp: Psiquiatría)</option>
                <option value="Dr. Carlos Estupiñan">Dr. Carlos Estupiñan (Esp: Toxicología)</option>
                <option value="Dr. Fabio Espitia">Dr. Fabio Espitia (Medico General)</option>
                <option value="Dra. Ramona Lafaurie">Dra. Ramona Lafaurie (Médico General)</option>


            </select>

            <!-- Especialidad -->
            <label for="especialidad">Especialidad:</label>
            <select id="especialidad" name="especialidad" required>
                <option value="">Seleccione una Especialidad</option>
                <option value="Oncología">Oncología</option>
                <option value="Pediatría">Pediatría</option>
                <option value="Gastroenterología">Gastroenterología</option>
                <option value="Neurología">Neurología</option>
                <option value="Psiquiatría">Psiquiatría</option>
                <option value="Toxicología">Toxicología</option>
                <option value="Médico General">Médico General</option>

            </select>

            <!-- Fecha y Hora -->
            <label for="fecha">Fecha:</label>
            <input type="date" id="fecha" name="fecha" required>

            <label for="hora">Hora:</label>
            <input type="time" id="hora" name="hora" required>

            <button type="submit">Agendar una Cita</button>
        </form>
    </div>

    <footer>
        <div class="footer-content">
            <p>&copy; 2024 - Aplicación de Citas Médicas</p>
            <p>Línea nacional: 01 8000 91 52 02</p>
            <p>Línea de atención EPS Bogotá y Cundinamarca: 601 4441234</p>
            <div class="social-media">
                <a href="https://www.facebook.com/Compensarinfo"><img src="Facebook.png" alt="Facebook" width="30" height="30"></a>
                <a href="https://x.com/Compensar_info"><img src="x.png" alt="Twitter" width="30" height="30"></a>
                <a href="https://www.youtube.com/user/Compensarinfo"><img src="Youtube.png" alt="YouTube" width="30" height="30"></a>
            </div>
        </div>
    </footer>

    <script>
        // Script para mostrar el resto del formulario después de validar el documento
        document.getElementById('documento').addEventListener('input', function() {
            if (this.value.trim() !== '') {
                document.getElementById('formularioCita').style.display = 'block';
            } else {
                document.getElementById('formularioCita').style.display = 'none';
            }
        });
    </script>
</body>
</html>