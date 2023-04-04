<%@page import="java.util.Properties"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-full bg-gray-100">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editor Table | Support</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="h-full">
        <div class="min-h-full">
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

            <header class="bg-white shadow">
                <div class="mx-auto max-w-7xl py-6 px-4 sm:px-6 lg:px-8">
                    <h1 class="text-3xl font-bold leading-tight tracking-tight text-gray-900">Página del Editor</h1>
                </div>
            </header>
            <main>
                <div class="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
                    <!-- Replace with your content -->
                    <div class="px-4 py-4 sm:px-0">
                        <div class="px-4 sm:px-6 lg:px-8">
                            <div class="sm:flex sm:items-center">
                                <div class="sm:flex-auto">
                                    <h1 class="text-xl font-semibold text-gray-900">Reportes</h1>
                                    <p class="mt-2 text-sm text-gray-700">Aquí se mostrarán todos los reportes cerrados o solucionados para su redacción en formato FAQ</p>
                                </div>
                                <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">

                                </div>
                            </div>
                            <%
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection dbConnection = null;
                                try {
                                    String url = "jdbc:mysql://localhost:3308/elet";
                                    Properties info = new Properties();
                                    info.put("user", "root");
                                    info.put("password", "n0m3l0");
                                    dbConnection = DriverManager.getConnection(url, info);
                                    Statement statement = null;
                                    ResultSet rs = null;

                                    statement = dbConnection.createStatement();
                                    String SQLQuery = "SELECT usr_id,case_id,user_name,case_name,case_status,case_last_update_date FROM tbl_case_admin "
                                            + " INNER JOIN tbl_users ON tbl_case_admin.admin_id = tbl_users.id_user"
                                            + " INNER JOIN tbl_cases ON tbl_case_admin.case_id = tbl_cases.id_case WHERE case_status='Cerrado';";
                                    rs = statement.executeQuery(SQLQuery);

                                    if (!rs.isBeforeFirst()) {
                            %>
                            <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 p-5">No existen registros</h1>
                            <%
                            } else {
                            %>
                            <div class="mt-8 flex flex-col">
                                <div class="-my-2 -mx-4 overflow-x-auto sm:-mx-6 lg:-mx-8">
                                    <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
                                        <div class="overflow-hidden shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">
                                            <table class="min-w-full divide-y divide-gray-300">
                                                <thead class="bg-gray-50">
                                                    <tr>
                                                        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6">ID de Usuario</th>
                                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Nombre de usuario</th>
                                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Nombre del Caso</th>
                                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Status</th>
                                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900">Fecha de finalización</th>

                                                        <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                                                            <a href="">
                                                                <span class="sr-only">Redactar</span>
                                                            </a>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody class="divide-y divide-gray-200 bg-white">
                                                    <%
                                                        while (rs.next()) {

                                                            Integer id_user = rs.getInt("usr_id");
                                                            Integer id_case = rs.getInt("case_id");
                                                            String username_report = rs.getString("user_name");
                                                            String report_name = rs.getString("case_name");
                                                            String status_report = rs.getString("case_status");
                                                            String last_update_date = rs.getString("case_last_update_date");
                                                    %>
                                                    <tr>
                                                        <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6"><%=id_user%></td>
                                                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%=username_report%></td>
                                                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%=report_name%></td>
                                                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%=status_report%></td>
                                                        <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500"><%=last_update_date%></td>
                                                        <td class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6">
                                                            <a href="editor_form.jsp?usr_id=<%=id_user%>&case_id=<%=id_case%>&report_name=<%=report_name%>&last_update_date=<%=last_update_date%>&status_report=<%=status_report%>&username_report=<%=username_report%>" class="text-indigo-600 hover:text-indigo-900">Redactar<span class="sr-only"></span></a>
                                                        </td>
                                                    </tr>                
                                                    <%
                                                                }
                                                                statement.close();
                                                                dbConnection.close();
                                                            }
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
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>
