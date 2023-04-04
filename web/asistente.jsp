<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>

    </head>
    <body>
<nav class="bg-stone-900">
                <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <div class="flex h-16 items-center justify-between">
                        <div class="flex items-center">
                            <div class="flex-shrink-0">

                            </div>
                            <div class="hidden md:block">
                                <div class="ml-10 flex items-baseline space-x-4">
                                    <!-- Current: "bg-indigo-700 text-white", Default: "text-white hover:bg-indigo-500 hover:bg-opacity-75" -->
                                    <h1 class="text-white">Alknos Support</h1>
                                </div>
                            </div>
                        </div>
                        <div class="hidden md:block">
                            <div class="ml-4 flex items-center md:ml-6">
                                <form action="logout.jsp">
                                <button type="submit" id="btnSubmit" name="btnSubmit" class="rounded-md bg-stone-600 py-2 px-3 text-sm font-semibold text-white shadow-sm hover:bg-stone-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-stone-600">Cerrar Sesión</button>
                                </form>
                            </div>
                        </div>
                        <div class="-mr-2 flex md:hidden">
                            <!-- Mobile menu button -->
                            <button type="button" class="inline-flex items-center justify-center rounded-md bg-stone-900 p-2 text-indigo-200 hover:bg-stone-500 hover:bg-opacity-75 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-indigo-600" aria-controls="mobile-menu" aria-expanded="false">
                                <span class="sr-only">Open main menu</span>
                                <!--
                                  Heroicon name: outline/bars-3
                    
                                  Menu open: "hidden", Menu closed: "block"
                                -->
                                <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
                                </svg>
                                <!--
                                  Heroicon name: outline/x-mark
                    
                                  Menu open: "block", Menu closed: "hidden"
                                -->
                                <svg class="hidden h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </nav>
        <%
            if (request.getMethod().equalsIgnoreCase("post")) {
                String name = request.getParameter("name");
                String user = request.getParameter("user");
                String about = request.getParameter("about");

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = null;
                    Statement statement = null;
                    ResultSet rs = null;
                    String connectionURL = "jdbc:mysql://localhost:3308/elet", USER = "root", PWD = "n0m3l0";

                    connection = DriverManager.getConnection(connectionURL, USER, PWD);
                    statement = connection.createStatement();
                    String getUserByUserNameSQLQuery = "SELECT * from tbl_users where user_name='" + user + "';";
                    rs = statement.executeQuery(getUserByUserNameSQLQuery);

                    if (rs.next()) {
                        int usr_id = rs.getInt("id_user");
                        String createNewCaseSQLQuery = "insert into tbl_cases (case_name, case_desc, usr_id) values ('" + name + "', '" + about + "'," + usr_id + ");";
                        statement.executeUpdate(createNewCaseSQLQuery);

                        response.sendRedirect(request.getRequestURI());
                        return;
                    } else {
        %>
        <div class="rounded-md bg-red-50 p-4 mx-12 mt-6">
            <div class="flex">
                <div class="flex-shrink-0">
                    <svg class="h-5 w-5 text-red-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                    </svg>
                </div>
                <div class="ml-3">
                    <h3 class="text-sm font-medium text-red-800">Ocurrio un error</h3>
                    <div class="mt-2 text-sm text-red-700">
                        <ul role="list" class="list-disc pl-5 space-y-1">
                            <li>El usuario no existe</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <%
            }

            statement.close();
            connection.close();
        } catch (SQLException e) {

            if (e.getMessage().contains("Duplicate entry")) {
        %>
        <div class="rounded-md bg-red-50 p-4 mx-12 mt-6">
            <div class="flex">
                <div class="flex-shrink-0">
                    <svg class="h-5 w-5 text-red-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                    </svg>
                </div>
                <div class="ml-3">
                    <h3 class="text-sm font-medium text-red-800">Ocurrio un error</h3>
                    <div class="mt-2 text-sm text-red-700">
                        <ul role="list" class="list-disc pl-5 space-y-1">
                            <li>Ya existe un caso con ese nombre</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <%
                    } else {
                        out.println(e.getMessage());
                    }
                }

            }
        %>

        <div>
            <div class="m-12">
                <form method="post" action="<%= request.getRequestURI()%>">
                    <div class="space-y-12">
                        <div class="border-b border-gray-900/10 pb-12"> 
                            <h2 class="max-w-6xl mt-8 mb-6 text-lg leading-6 font-medium text-gray-900">Nuevo caso</h2>

                            <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                                <div class="sm:col-span-4">
                                    <label for="name" class="block text-sm font-medium leading-6 text-gray-900">Nombre</label>
                                    <div class="mt-2">
                                        <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                            <input type="text" name="name" id="name" value="<%= (request.getParameter("name") != null) ? request.getParameter("name") : ""%>" autocomplete="name" class="ml-1 block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6" placeholder="Fallo en modulo de deteccion" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="sm:col-span-4">
                                    <label for="user" class="block text-sm font-medium leading-6 text-gray-900">Usuario</label>
                                    <div class="mt-2">
                                        <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                            <span class="flex select-none items-center pl-3 text-gray-500 sm:text-sm">alknos.com/</span>
                                            <input type="text" name="user" id="user" value="<%= (request.getParameter("user") != null) ? request.getParameter("user") : ""%>" autocomplete="user" class="-ml-1 block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6" placeholder="username" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-span-full">
                                    <label for="about" class="block text-sm font-medium leading-6 text-gray-900">Descripcion</label>
                                    <div class="mt-2">
                                        <textarea id="about" name="about" rows="3" value="<%= (request.getParameter("about") != null) ? request.getParameter("about") : ""%>" class="block w-full rounded-md border-0 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:py-1.5 sm:text-sm sm:leading-6" required></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mt-6 flex items-center justify-end gap-x-6">
                        <button type="button" class="text-sm font-semibold leading-6 text-gray-900">Cancel</button>
                        <button type="submit" class="rounded-md bg-indigo-600 py-2 px-3 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Save</button>
                    </div>
                </form>
            </div>
        </div>

        <%
            // Borrar los datos del formulario y de la solicitud al refrescar la página
            if (request.getMethod().equalsIgnoreCase("get")) {
                request.removeAttribute("name");
                request.removeAttribute("user");
                request.removeAttribute("about");
            }
        %>

        <div>

            <h2 class="max-w-6xl mt-8 mb-6 text-lg leading-6 font-medium text-gray-900 px-12">Casos creados</h2>

            <div class="hidden sm:block">
                <div class="w-full px-12">
                    <div class="flex flex-col mt-2 mb-12">
                        <div class="align-middle min-w-full overflow-x-auto shadow overflow-hidden sm:rounded-lg">
                            <table class="max-w-full divide-y divide-gray-200">
                                <thead>
                                    <tr>
                                        <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                                        <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Nombre</th>
                                        <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Usuario</th>
                                        <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Area</th>
                                        <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Asignado a</th>
                                        <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                                        <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Creado</th>
                                        <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Ultima actualizacion</th>
                                    </tr>
                                </thead>

                                <tbody class="bg-white divide-y divide-gray-200">

                                    <!-- Database connection -->
                                    <%
                                        try {
                                            Class.forName("com.mysql.cj.jdbc.Driver");
                                            Connection connection = null;
                                            Statement statement = null;
                                            ResultSet rs = null;
                                            String connectionURL = "jdbc:mysql://localhost:3308/elet", USER = "root", PWD = "n0m3l0";

                                            connection = DriverManager.getConnection(connectionURL, USER, PWD);
                                            statement = connection.createStatement();
                                            String SQLQuery = "SELECT c.id_case, c.case_name, u.user_name as user_username,c.case_area, u2.user_name as admin_username, c.case_status, c.case_creation_date, c.case_last_update_date FROM tbl_cases c INNER JOIN tbl_users u ON c.usr_id = u.id_user LEFT JOIN tbl_case_admin ca ON c.id_case = ca.case_id LEFT JOIN tbl_users u2 ON ca.admin_id = u2.id_user order by c.id_case;";
                                            rs = statement.executeQuery(SQLQuery);

                                            while (rs.next()) {
                                                int id_case = rs.getInt("id_case");
                                                String case_name = rs.getString("case_name");
                                                String user_username = rs.getString("user_username");
                                                String case_area = rs.getString("case_area");
                                                String admin_username = rs.getString("admin_username");
                                                String case_status = rs.getString("case_status");
                                                String case_creation_date = rs.getString("case_creation_date");
                                                String case_last_update_date = rs.getString("case_last_update_date");
                                                if (case_last_update_date == null) {
                                                    case_last_update_date = "";
                                                }
                                                if (admin_username == null)
                                                    admin_username = "";
                                    %>


                                    <tr class="bg-white">
                                        <!-- id -->
                                        <td class="px-6 py-4 text-right whitespace-nowrap text-sm text-gray-500">
                                            <span class="text-gray-900 font-medium"><%=id_case%></span>
                                        </td>
                                        <!-- nombre -->
                                        <td class="max-w-0 w-full px-6 py-4 text-center whitespace-nowrap text-sm text-gray-900">
                                            <div class="flex">
                                                <a href="#" class="group inline-flex space-x-2 truncate text-sm">
                                                    <!-- Heroicon name: solid/cash -->
                                                    <svg class="flex-shrink-0 h-5 w-5 text-gray-400 group-hover:text-gray-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                    <path fill-rule="evenodd" d="M4 4a2 2 0 00-2 2v4a2 2 0 002 2V6h10a2 2 0 00-2-2H4zm2 6a2 2 0 012-2h8a2 2 0 012 2v4a2 2 0 01-2 2H8a2 2 0 01-2-2v-4zm6 4a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd" />
                                                    </svg>
                                                    <p class="text-gray-500 truncate group-hover:text-gray-900"><%=case_name%></p>
                                                </a>
                                            </div>
                                        </td>
                                        <!-- usuario -->
                                        <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                            <span class="text-gray-900 font-medium"><%=user_username%></span>
                                        </td>
                                        <!-- area -->
                                        <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                            <span><%=case_area%></span>
                                        </td>
                                        <!-- asignado a -->
                                        <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                            <span class="text-gray-900 font-medium"><%=admin_username%></span>
                                        </td>
                                        <!-- status -->
                                        <td class="hidden px-6 py-4 whitespace-nowrap text-sm text-gray-500 md:block">
                                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800 capitalize"> <%=case_status%> </span>
                                        </td>
                                        <!-- fecha de creacion -->
                                        <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                            <time><%=case_creation_date%></time>
                                        </td>
                                        <!-- fecha ultima actualizacion -->
                                        <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                            <time><%=case_last_update_date%></time>
                                        </td>
                                    </tr>


                                    <%
                                            }

                                            statement.close();
                                            connection.close();
                                        } catch (SQLException e) {
                                            out.println("SQLException caught: " + e.getMessage());
                                        }
                                    %>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

