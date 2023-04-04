<%-- 
    Document   : validate_login
    Created on : 3 abr 2023, 09:39:18
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Conectar a la base de datos
            String url = "jdbc:mysql://localhost:3308/elet";
            String user = "root";
            String pass = "n0m3l0";
            Connection conn = DriverManager.getConnection(url, user, pass);

            // Buscar al usuario en la base de datos
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM tbl_users WHERE user_name = ? AND user_pwd = ?");
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Si el usuario y la contraseña son válidos, establecer la variable de sesión
                //HttpSession session = request.getSession();
                int admin_id = rs.getInt("id_user");
                session.setAttribute("admin_id", admin_id);

                // Redirigir a la página de bienvenida
                response.sendRedirect("bienvenida.jsp");
            } else {
                // Si el usuario y la contraseña son inválidos, mostrar un mensaje de error
                out.println("<p>Usuario o contraseña inválidos</p>");
            }

            // Cerrar la conexión a la base de datos
            rs.close();
            stmt.close();
            conn.close();
        %>

    </body>
</html>

