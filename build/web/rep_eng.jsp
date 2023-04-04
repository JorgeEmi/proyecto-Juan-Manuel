<%@page import="java.util.Properties"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-full bg-gray-100">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerente</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="h-full">
        <div class="min-h-full">
            <header class="bg-white shadow">
                <div class="mx-auto max-w-7xl py-6 px-4 sm:px-6 lg:px-8">
                    <h1 class="text-3xl font-bold leading-tight tracking-tight text-gray-900">Página del Gerente de Soporte</h1>
                </div>
            </header>
            <main>
                 <%
                    // Almacenar el id_case con el que fue mandado
                    String ids = request.getParameter("id_case");
                    
                  
                    // Conectarse a la base de datos
                    String url = "jdbc:mysql://localhost:3306/elet";
                    String usuario = "root";
                    String password = "n0m3l0";
                    
                    Class.forName("com.mysql.jdbc.Driver"); 
                    
                    //String de conexión
                    Connection conn = DriverManager.getConnection(url, usuario, password);
                    //Realizar consulta a la tabla cases
                    PreparedStatement ps = conn.prepareStatement("SELECT id_case, case_name, usr_id, case_area, case_status, case_creation_date, case_last_update_date, case_desc FROM tbl_cases where id_case=?");
                    ps.setString(1, ids);
                    ResultSet rs = ps.executeQuery();
                    
                    while (rs.next()) {
                    Integer id_case = rs.getInt("id_case");
                    String case_name = rs.getString(2);
                    String usr_id = rs.getString(3);
                    String case_area = rs.getString(4);
                    String case_status = rs.getString(5);
                    String case_creation_date = rs.getString(6);
                    String case_last_update_date = rs.getString(7);
                    String case_desc = rs.getString(8);
                                             
                    %>
                    <div class="mx-auto max-w-8xl py-6 sm:px-6 lg:px-8">
                    <!-- Replace with your content -->
                    <div class="px-4 py-4 sm:px-0">
                        <div class="px-4 sm:px-6 lg:px-8">
                            <div class="sm:flex sm:items-center">
                                <div class="sm:flex-auto">
                                    <h1 class="text-xl font-semibold text-gray-900">Asignación de reportes a un ingeniero de soporte</h1>
                                    <p class="mt-2 text-sm text-gray-700">Aquí se mostrará los ingenieros de soporte disponibles para su asignación</p>
                                </div>
                                <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
                                </div>
                            </div>
                            <div class="mt-8 flex flex-col">
                                <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">                                    
                                    <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">

                                        <table class="table-fixed border-spacing-2">
                                            <tbody>
                                                <tr>
                                                    <td>

                                                         <div class="overflow-hidden bg-white shadow sm:rounded-lg max-w-5xl">
                                                            <div class="px-4 py-5 sm:px-6">
                                                                <h3 class="text-base font-semibold leading-6 text-gray-900">Reporte</h3>
                                                                <p class="mt-1 max-w-2xl text-sm text-gray-500">Identificador del Reporte: <%=id_case%></p>
                                                            </div>
                                                            <div class="border-t border-gray-200">
                                                                <dl>
                                                                    <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Nombre del Reporte</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%=case_name%></dd>
                                                                    </div>

                                                                    
                                                                    
                                                                    <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Area que va seleccionada</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%=case_area%></dd>
                                                                    </div>
                                                                              
                                                                    <div class="bg-gray px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Estatus del Reporte</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%=case_status%></dd>
                                                                    </div>
                                                                </dl>
                                                            </div>
                                                        </div>
                                                    <%
                                                        }
                                                        %>
                                                    </td>
                                                    <td>
                                                        <div class='p-8'></div>
                                                    </td>
                                                    <td>
                                                        <div class="sm:flex-auto">
                                                            <h1 class="text-xl font-semibold text-gray-900">Ingenieros de Soporte disponibles</h1>
                                                        </div><br>
                                                        <form action="update_eng.jsp" method="post">
                                                        <input type="hidden" name="id_case" value="<%= request.getParameter("id_case")%>">  
                                                        <input type="hidden" name="case_statusM" value="En Soporte">
                                                        <input type="hidden" name="case_areaM" value="Soporte">
                                                        <label for="id_user">Seleccione un ingeniero de Soporte:</label>
                                                        <select id="id_user" name="id_user">
                                                            <% 
                                                                PreparedStatement ps2 = conn.prepareStatement("SELECT id_user,user_name FROM tbl_users INNER JOIN tbl_admin_rol ON tbl_users.id_user = tbl_admin_rol.admin_id WHERE tbl_admin_rol.rol = 'Ingeniero de Soporte';");
                                                                ResultSet rs2 = ps2.executeQuery();
                                                                while (rs2.next()) {
                                                                    int userId = rs2.getInt("id_user");
                                                                    String userName = rs2.getString("user_name");
                                                            %>
                                                            <option value="<%=userId%>"><%=userName%></option>
      
                                                            <% 
                                                                }
                                                            %>
                                                        </select><br><br>
                                                        <button type="submit" class="rounded-md bg-stone-600 py-2 px-3 text-sm font-semibold text-white shadow-sm hover:bg-stone-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-stone-600" >Asignar</button>
                                                      </form><br><br><br><br>
                                                         <div>
                                                                <button type="button" value="Regresar">
                                                                <a href="rep_vya.jsp?id_case=<%= ids%>" class="rounded-md bg-stone-600 py-2 px-3 text-sm font-semibold text-white shadow-sm hover:bg-stone-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-stone-600">Regresar</a>
                                                                </button>  
                                                        </div>
                                                    </td>
                                                    <% 
                                                                rs.close();
                                                                ps.close();
                                                                rs2.close();
                                                                ps2.close();
                                                                conn.close();
                                                                // Cerrar el ResultSet y la conexión a la base de datos
                                                            %>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>          
                                </div>
                            </div>  
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>