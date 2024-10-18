package com.darwuich.compensapp.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.darwuich.compensapp.models.Cita;

public class CargarModificarCitaServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/proyecto_generales";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener el id de la cita seleccionada
        String idCita = request.getParameter("idCita");

        if (idCita == null || idCita.isEmpty()) {
            response.getWriter().println("Error: El ID de la cita es obligatorio.");
            return;
        }

        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Buscar la cita seleccionada en la base de datos
            String sql = "SELECT * FROM citas_usuarios WHERE id_cita = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, idCita);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                Cita cita = new Cita();
                cita.setIdCita(resultSet.getInt("id_cita"));
                cita.setFecha(resultSet.getString("fecha"));
                cita.setHora(resultSet.getString("hora"));
                cita.setUbicacion(resultSet.getString("ubicacion"));
                cita.setEspecialista(resultSet.getString("especialista"));
                cita.setEspecialidad(resultSet.getString("especialidad"));

                // Pasar los datos de la cita al formulario de modificación
                request.setAttribute("idCita", cita.getIdCita());
                request.setAttribute("fecha", cita.getFecha());
                request.setAttribute("hora", cita.getHora());
                request.setAttribute("ubicacion", cita.getUbicacion());
                request.setAttribute("especialista", cita.getEspecialista());
                request.setAttribute("especialidad", cita.getEspecialidad());

                // Redirigir al formulario de modificación
                RequestDispatcher dispatcher = request.getRequestDispatcher("modificarCita.jsp");
                dispatcher.forward(request, response);
            } else {
                response.getWriter().println("Error: No se encontró la cita.");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}