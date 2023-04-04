package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Timestamp;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;

public final class update_005feng_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>JSP Page</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");

        Connection conn = null;
        String case_status = request.getParameter("case_statusM");
        String case_area = request.getParameter("case_areaM");
        Integer id_user = Integer.parseInt(request.getParameter("id_user"));        
        Integer id = Integer.parseInt(request.getParameter("id_case"));
        PreparedStatement stmt1 = null;
        PreparedStatement stmt2 = null;
        try {
          Class.forName("com.mysql.jdbc.Driver");
          conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/elet", "root", "n0m3l0");
          
          String query1 = "INSERT INTO tbl_case_admin (case_id, admin_id, case_admin_creation_date) VALUES (?, ?, ?)";
            stmt1 = conn.prepareStatement(query1);
            stmt1.setInt(1, id);
            stmt1.setInt(2, id_user);
            stmt1.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            
            int rowsInserted = stmt1.executeUpdate();
          
          String query2 = "UPDATE tbl_cases SET case_status=?, case_area=?, case_last_update_date = ? WHERE id_case=?";
                stmt2 = conn.prepareStatement(query2);
                stmt2.setString(1, case_status);
                stmt2.setString(2, case_area);
                stmt2.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
                stmt2.setInt(4, id);
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

      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
