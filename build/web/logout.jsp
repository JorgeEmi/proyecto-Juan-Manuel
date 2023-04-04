<%-- 
    Document   : logout
    Created on : 3 abr 2023, 10:17:19
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            // Invalidar la sesión
            if (session != null) {
                session.invalidate();
            }

            // Redirigir a la página de inicio de sesión
            response.sendRedirect("login.jsp");
        %>
    </body>
</html>
