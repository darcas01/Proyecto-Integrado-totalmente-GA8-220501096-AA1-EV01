package com.darwuich.compensapp.cerrarsesion.servlets;

import com.darwuich.compensapp.login.Servlets.*;
import com.darwuich.compensapp.cerrarsesion.servlets.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class CerrarSesionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate(); // Invalida la sesión actual
        response.sendRedirect("login.html"); // Redirige al formulario de login
    }
}