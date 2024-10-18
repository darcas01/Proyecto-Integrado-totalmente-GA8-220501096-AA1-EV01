package com.darwuich.compensapp.modificarcita.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.darwuich.compensapp.models.Cita;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ListarCitasServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/proyecto_generales";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String documento = request.getParameter("documento");

        if (documento == null || documento.isEmpty()) {
            response.getWriter().println("Error: El número de documento es obligatorio.");
            return;
        }

        Connection connection = null;
        List<Cita> listaCitas = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT id_cita, fecha, hora, ubicacion, especialista, especialidad FROM citas_usuarios WHERE numeroDocumento = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, documento);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Cita cita = new Cita();
                cita.setIdCita(resultSet.getInt("id_cita"));
                cita.setFecha(resultSet.getString("fecha"));
                cita.setHora(resultSet.getString("hora"));
                cita.setUbicacion(resultSet.getString("ubicacion"));
                cita.setEspecialista(resultSet.getString("especialista"));
                cita.setEspecialidad(resultSet.getString("especialidad"));

                listaCitas.add(cita);
            }

            request.setAttribute("citas", listaCitas);
            request.setAttribute("documento", documento);
            
            // Redirigir al formulario para modificar cita en lugar de enviar al ModificarCitaServlet directamente
            RequestDispatcher dispatcher = request.getRequestDispatcher("listarCitas.jsp");
            dispatcher.forward(request, response);

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}