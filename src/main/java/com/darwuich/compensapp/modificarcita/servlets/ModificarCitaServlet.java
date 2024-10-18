package com.darwuich.compensapp.modificarcita.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ModificarCitaServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/proyecto_generales";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtener parámetros del formulario
        String idCita = request.getParameter("idCita");
        String documento = request.getParameter("documento");
        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        String ubicacion = request.getParameter("ubicacion");
        String especialista = request.getParameter("especialista");
        String especialidad = request.getParameter("especialidad");

        // Verificación campo por campo
        if (idCita == null || idCita.isEmpty()) {
            response.getWriter().println("Error: El ID de la cita es obligatorio.");
            return;
        }
        if (documento == null || documento.isEmpty()) {
            response.getWriter().println("Error: El número de documento es obligatorio.");
            return;
        }
        if (fecha == null || fecha.isEmpty()) {
            response.getWriter().println("Error: La fecha es obligatoria.");
            return;
        }
        if (hora == null || hora.isEmpty()) {
            response.getWriter().println("Error: La hora es obligatoria.");
            return;
        }
        if (ubicacion == null || ubicacion.isEmpty()) {
            response.getWriter().println("Error: La ubicación es obligatoria.");
            return;
        }
        if (especialista == null || especialista.isEmpty()) {
            response.getWriter().println("Error: El especialista es obligatorio.");
            return;
        }
        if (especialidad == null || especialidad.isEmpty()) {
            response.getWriter().println("Error: La especialidad es obligatoria.");
            return;
        }

        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Agregar una consulta SQL para actualizar la cita seleccionada por su id
            String sql = "UPDATE citas_usuarios SET fecha = ?, hora = ?, ubicacion = ?, especialista = ?, especialidad = ? WHERE id_cita = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, fecha);
            statement.setString(2, hora);
            statement.setString(3, ubicacion);
            statement.setString(4, especialista);
            statement.setString(5, especialidad);
            statement.setInt(6, Integer.parseInt(idCita)); // Asegurar que idCita sea un entero

            // Ejecutar la consulta
            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("confirmacionModificacion.jsp?documento=" + documento + "&ubicacion=" + ubicacion + "&especialista=" + especialista + "&especialidad=" + especialidad + "&hora=" + hora + "&fecha=" + fecha);
            } else {
                response.getWriter().println("Error: No se pudo modificar la cita.");
            }

        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(ModificarCitaServlet.class.getName()).log(Level.SEVERE, null, e);
            response.getWriter().println("Error: Problema con la base de datos. " + e.getMessage());
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    Logger.getLogger(ModificarCitaServlet.class.getName()).log(Level.SEVERE, null, e);
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para modificar citas médicas";
    }
}