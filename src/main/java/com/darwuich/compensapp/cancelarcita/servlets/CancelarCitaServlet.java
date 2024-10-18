package com.darwuich.compensapp.cancelarcita.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CancelarCitaServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/proyecto_generales";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idCita = request.getParameter("idCita");

        if (idCita == null || idCita.isEmpty()) {
            response.getWriter().println("Error: No se especificó una cita para cancelar.");
            return;
        }

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "DELETE FROM citas_usuarios WHERE id_cita = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(idCita));

            int rowsDeleted = statement.executeUpdate();
            if (rowsDeleted > 0) {
                response.sendRedirect("confirmacionCancelacionExitosa.jsp");
            } else {
                response.getWriter().println("Error: No se pudo cancelar la cita.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: Problema con la base de datos.");
        }
    }
}