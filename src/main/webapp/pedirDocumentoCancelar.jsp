<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Cancelar Cita</title>
    <style>
        /* Estilos en línea para personalización */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #fc640c;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 600px;
        }

        h2 {
            color: #007BFF;
            margin-bottom: 20px;
        }

        label {
            font-size: 18px;
            color: #333;
        }

        input[type="text"] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
            margin-bottom: 20px;
        }

        button {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
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