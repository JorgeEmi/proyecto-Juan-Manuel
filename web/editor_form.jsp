<%@page import="java.util.Properties"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-full bg-gray-100">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editor Form | Support</title>
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
                <%
                    Integer usr_id = Integer.valueOf(request.getParameter("usr_id"));
                    Integer case_id = Integer.valueOf(request.getParameter("case_id"));
                    String report_name = request.getParameter("report_name");
                    String username_report = request.getParameter("username_report");
                    String status_report = request.getParameter("status_report");
                    String last_update_date = request.getParameter("last_update_date");

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
                        String SQLQuery = "SELECT case_area,case_solution,case_creation_date,case_desc from tbl_case_admin"
                                + " INNER JOIN tbl_users ON tbl_case_admin.admin_id = tbl_users.id_user"
                                + " INNER JOIN tbl_cases ON tbl_case_admin.case_id = tbl_cases.id_case "
                                + " WHERE case_id="+case_id+" ;";
                        rs = statement.executeQuery(SQLQuery);
                        while (rs.next()) {
                            String case_area = rs.getString("case_area");
                            String case_creation_date = rs.getString("case_creation_date");
                            String case_desc = rs.getString("case_desc");
                            String case_solution = rs.getString("case_solution");

                %>


                <div class="mx-auto max-w-8xl py-6 sm:px-6 lg:px-8">
                    <!-- Replace with your content -->
                    <div class="px-4 py-4 sm:px-0">
                        <div class="px-4 sm:px-6 lg:px-8">
                            <div class="sm:flex sm:items-center">
                                <div class="sm:flex-auto">
                                    <h1 class="text-xl font-semibold text-gray-900">Redacción de FAQ's</h1>
                                    <p class="mt-2 text-sm text-gray-700">Aquí se mostrará el reporte seleccionado junto con el formulario para subir a la base de datos dicha redacción</p>
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
                                                                <p class="mt-1 max-w-2xl text-sm text-gray-500">Identificador del Reporte: <%=case_id%></p>
                                                            </div>
                                                            <div class="border-t border-gray-200">
                                                                <dl>
                                                                    <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Nombre del Caso</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%=report_name%></dd>
                                                                    </div>

                                                                    <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Identificador del usuario</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%=usr_id%></dd>
                                                                    </div>

                                                                    <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Nombre del usuario</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%=username_report%></dd>
                                                                    </div>

                                                                    <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Departamento</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%=case_area%></dd>
                                                                    </div>

                                                                    <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Fecha de creación</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%=case_creation_date%></dd>
                                                                    </div>

                                                                    <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Fecha de la última modificación</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%=last_update_date%></dd>
                                                                    </div>

                                                                    <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Descripción</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%=case_desc%></dd>
                                                                    </div><div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                                        <dt class="text-sm font-medium text-gray-500">Solución</dt>
                                                                        <dd class="mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0"><%=case_solution%></dd>
                                                                    </div>
                                                                </dl>
                                                            </div>
                                                        </div>
                                                        <%}
                                                                statement.close();
                                                                dbConnection.close();
                                                            } catch (SQLException e) {
                                                                out.println("SQLException caught: " + e.getMessage());
                                                            }

                                                        %>    
                                                    </td>
                                                    <td>
                                                        <div class='p-8'></div>
                                                    </td>
                                                    <td>

                                                        <form method="get" action="submit_faq.jsp">
                                                            <div class="space-y-12">
                                                                <div class="border-b border-gray-900/10 pb-12">
                                                                    <h2 class="text-base font-semibold leading-7 text-gray-900">FAQ</h2>
                                                                    <p class="mt-1 text-sm leading-6 text-gray-600">Este formulario será usado para capturar la redacción en formato FAQ.</p>

                                                                    <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                                                                        <div class="sm:col-span-4">
                                                                            <label for="question" class="block text-sm font-medium leading-6 text-gray-900">Pregunta</label>
                                                                            <div class="mt-2">
                                                                                <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-stone-600 sm:max-w-md">
                                                                                    <input type="text" id="question" name='question' class="block flex-1 shadow-sm ring-1 ring-inset ring-gray-300 rounded-md border-0 border-0 py-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6" placeholder="¿.......?">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <input type="hidden" value="<%=usr_id%>" name="usr_id" id="usr_id">
                                                                        <div class="col-span-full">
                                                                            <label for="answer" class="block text-sm font-medium leading-6 text-gray-900">Respuesta</label>
                                                                            <div class="mt-2">
                                                                                <textarea id="answer" name="answer" rows="3" class="block w-full rounded-md border-0 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-stone-600 sm:py-1.5 sm:text-sm sm:leading-6"></textarea>
                                                                            </div>
                                                                            <p class="mt-3 text-sm leading-6 text-gray-600">Sé claro y explica detalladamente para evitar redundancias o algún otro problema.</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="mt-6 flex items-center justify-end gap-x-6">
                                                                <button type="button" class="text-sm font-semibold leading-6 text-gray-900">Cancelar</button>
                                                                <button type="submit" id="btnSubmit" name="btnSubmit" class="rounded-md bg-stone-600 py-2 px-3 text-sm font-semibold text-white shadow-sm hover:bg-stone-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-stone-600">Guardar y Subir</button>
                                                            </div>
                                                        </form>

                                                    </td>                                                   
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