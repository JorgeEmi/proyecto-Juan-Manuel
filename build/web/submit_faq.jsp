<%@page import="java.sql.*"%>
<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String question_faq = request.getParameter("question");
            String answer_faq = request.getParameter("answer");
            String redirectURL = "editor_table.jsp";
            Integer usr_id = Integer.valueOf(request.getParameter("usr_id"));
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection dbConnection = null;
            try {
                String url = "jdbc:mysql://localhost:3308/elet";
                String SQLQuery = "INSERT INTO tbl_faq (admin_id,question_faq,answer_faq) VALUES (?,?,?);";
                Properties info = new Properties();
                info.put("user", "root");
                info.put("password", "n0m3l0");
                dbConnection = DriverManager.getConnection(url, info);

                PreparedStatement prepared_statement = dbConnection.prepareStatement(SQLQuery);
                prepared_statement.setInt(1, usr_id);
                prepared_statement.setString(2, question_faq);
                prepared_statement.setString(3, answer_faq);
                prepared_statement.executeUpdate();
                prepared_statement.close();
                
                response.sendRedirect(redirectURL);

            } catch (SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
            }
        %>
    </body>
</html>
