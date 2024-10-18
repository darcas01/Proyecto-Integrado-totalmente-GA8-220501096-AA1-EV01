package com.darwuich.compensapp.login.Servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONObject;

@WebServlet(name = "LoginServlets", urlPatterns = {"/login"})
public class LoginServlets extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/proyecto_generales?useSSL=false&serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";  // Pon tu contraseña correcta aquí

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Invalidar cualquier sesión existente antes de iniciar una nueva
        HttpSession session = request.getSession(false);  // Obtener la sesión existente sin crear una nueva
        if (session != null) {
            session.invalidate();  // Invalidar la sesión si existe
        }

        // Crear una nueva sesión después de invalidar la anterior
        session = request.getSession(true);

        // Leer el cuerpo de la solicitud (JSON)
        BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream(), "UTF-8"));
        StringBuilder jsonBuffer = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonBuffer.append(line);
        }

        // Parsear el JSON recibido
        JSONObject jsonRequest = new JSONObject(jsonBuffer.toString());
        String usuario = jsonRequest.getString("usuario");
        String contraseña = jsonRequest.getString("contraseña");

        boolean loginExitoso = false;

        // Verificación de login por API (si aplica)
        try {
            System.out.println("Intentando login con la API para usuario: " + usuario);
            
            URL url = new URL("http://localhost:5000/auth/login");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json; utf-8");
            conn.setDoOutput(true);

            String jsonInputString = "{\"username\": \"" + usuario + "\", \"password\": \"" + contraseña + "\"}";
            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }

            int responseCode = conn.getResponseCode();
            System.out.println("Código de respuesta de la API: " + responseCode);

            if (responseCode == 200) {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
                StringBuilder responseBuilder = new StringBuilder();
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    responseBuilder.append(responseLine.trim());
                }
                JSONObject jsonResponse = new JSONObject(responseBuilder.toString());
                System.out.println("Respuesta de la API: " + jsonResponse.toString());

                if (jsonResponse.has("message") && jsonResponse.getString("message").contains("Bienvenido")) {
                    session.setAttribute("usuario", usuario);
                    session.setAttribute("loginAPI", true);  // Marcar que este usuario proviene de la API
                    loginExitoso = true;
                }
            } else {
                System.out.println("Error en la API, no se pudo autenticar el usuario.");
            }

        } catch (IOException ex) {
            Logger.getLogger(LoginServlets.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Excepción al intentar conectar con la API: " + ex.getMessage());
        }

        // Si el login por API falla, intentamos con la base de datos
        if (!loginExitoso) {
            try {
                System.out.println("Intentando login con la base de datos para usuario: " + usuario);
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

                // Consulta a la base de datos
                String sql = "SELECT * FROM registro_usuarios WHERE email = ? AND contraseña = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, usuario);
                stmt.setString(2, contraseña);
                ResultSet rs = stmt.executeQuery();

                JSONObject jsonResponse = new JSONObject();
                if (rs.next()) {
                    session.setAttribute("usuario", usuario);
                    session.setAttribute("loginAPI", false);  // Marcar que este usuario proviene de la base de datos
                    jsonResponse.put("success", true);  // Éxito en JSON
                    System.out.println("Login exitoso con la base de datos.");
                } else {
                    jsonResponse.put("success", false);  // Credenciales incorrectas
                    System.out.println("Credenciales incorrectas en la base de datos.");
                }
                conn.close();

                // Configurar la respuesta como JSON
                response.setContentType("application/json");
                response.getWriter().write(jsonResponse.toString());
                
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(LoginServlets.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Error al intentar autenticar con la base de datos: " + ex.getMessage());
                response.setContentType("application/json");
                response.getWriter().write("{\"success\": false, \"error\": \"Error de autenticación\"}");
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
        return "LoginServlets";
    }
}