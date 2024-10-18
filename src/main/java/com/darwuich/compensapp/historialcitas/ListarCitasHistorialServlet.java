package com.darwuich.compensapp.historialcitas; // Asegúrate de que este sea el paquete correcto

import com.darwuich.compensapp.models.HistorialCita;
import com.darwuich.compensapp.models.HistorialCita;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ListarCitasHistorialServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/proyecto_generales";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String documento = request.getParameter("documento");
        System.out.println("Documento recibido: " + documento);
        List<HistorialCita> citas = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
    String sql = "SELECT fecha, hora, ubicacion, especialista, especialidad FROM citas_usuarios WHERE numeroDocumento = ?";
    PreparedStatement statement = conn.prepareStatement(sql);
    statement.setString(1, documento);
    ResultSet resultSet = statement.executeQuery();

    if (!resultSet.isBeforeFirst()) {  
        System.out.println("No se encontraron citas para el documento: " + documento);
    } else {
        System.out.println("Citas encontradas para el documento: " + documento);
        while (resultSet.next()) {
            System.out.println("Cita: Fecha=" + resultSet.getString("fecha") + ", Hora=" + resultSet.getString("hora"));
            HistorialCita cita = new HistorialCita();
            cita.setFecha(resultSet.getString("fecha"));
            cita.setHora(resultSet.getString("hora"));
            cita.setUbicacion(resultSet.getString("ubicacion"));
            cita.setEspecialista(resultSet.getString("especialista"));
            cita.setEspecialidad(resultSet.getString("especialidad"));
            citas.add(cita);
        }
    }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("citas", citas);
request.setAttribute("documento", documento);  // Añade esta línea
request.getRequestDispatcher("listarCitasHistorial.jsp").forward(request, response);
    }
}
