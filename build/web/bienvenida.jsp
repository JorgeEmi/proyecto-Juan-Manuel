<%-- 
    Document   : bienvenida
    Created on : 3 abr 2023, 09:47:52
    Author     : alumno
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            // Obtener la variable de sesión del ID de administrador

            int adminId = (int) session.getAttribute("admin_id");

            // Obtener el rol del usuario a partir de la tabla de roles de administrador
            String rol = null;
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                // Establecer la conexión a la base de datos
                Class.forName("com.mysql.jdbc.Driver");
                String dbURL = "jdbc:mysql://localhost:3308/elet";
                String dbUser = "root";
                String dbPwd = "n0m3l0";
                conn = DriverManager.getConnection(dbURL, dbUser, dbPwd);

                // Obtener el rol del usuario a partir del ID de administrador
                String sql = "SELECT rol FROM tbl_admin_rol WHERE admin_id=?";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, adminId);
                rs = stmt.executeQuery();
                if (rs.next()) {
                    rol = rs.getString("rol");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try {
                    rs.close();
                } catch (SQLException e) {
                }
                if (stmt != null) try {
                    stmt.close();
                } catch (SQLException e) {
                }
                if (conn != null) try {
                    conn.close();
                } catch (SQLException e) {
                }
            }

            // Redirigir a la página correspondiente según el rol del usuario
            if (rol == null) {
                // Si no se encontró el rol del usuario, redirigir a una página de error
                response.sendRedirect("error.jsp");
            } else if (rol.equals("Ingeniero")) {
                response.sendRedirect("pen_rep.jsp");
            } else if (rol.equals("Editor")) {
                response.sendRedirect("editor_table.jsp");
            } else if (rol.equals("Asistente")) {
                response.sendRedirect("asistente.jsp");
            } else if (rol.equals("Gerente")) {
                response.sendRedirect("indexgs.jsp");
            } else {
                // Si el rol del usuario no es válido, redirigir a una página de error
                response.sendRedirect("error.jsp");
            }
        %>

    </body>
</html>
