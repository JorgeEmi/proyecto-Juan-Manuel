<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Connection conn = null;
        String case_status = request.getParameter("case_statusM");
        String case_area = request.getParameter("case_areaM");
        Integer id_user = Integer.parseInt(request.getParameter("id_user"));        
        Integer id = Integer.parseInt(request.getParameter("id_case"));
        PreparedStatement stmt1 = null;
        PreparedStatement stmt2 = null;
        try {
          Class.forName("com.mysql.jdbc.Driver");
          conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/elet", "root", "n0m3l0");
          
          String query1 = "INSERT INTO tbl_case_admin (case_id, admin_id) VALUES (?, ?)";
            stmt1 = conn.prepareStatement(query1);
            stmt1.setInt(1, id);
            stmt1.setInt(2, id_user);
            try{
            int rowsInserted = stmt1.executeUpdate();
            }catch(SQLException e){
                System.out.println(e);
            }
          
          String query2 = "UPDATE tbl_cases SET case_status=?, case_area=? WHERE id_case=?";
                stmt2 = conn.prepareStatement(query2);
                stmt2.setString(1, case_status);
                stmt2.setString(2, case_area);
                stmt2.setInt(3, id);
            int rowsUpdated = stmt2.executeUpdate();
            
             // Confirmar la transacción
        
          
        } catch (SQLException ex) {
          ex.printStackTrace();
        } finally {
          if (stmt1 != null) {
            stmt1.close();
          }
          if (stmt2 != null) {
            stmt2.close();
          }
          if (conn != null) {
            conn.close();
            response.sendRedirect("rep_req.jsp");
          }
        }
%>
    </body>
</html>