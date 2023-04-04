<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>JSP Page</title>
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
                                    <h1 class="text-white">Alknos Support</h1>
                                </div>
                            </div>
                        </div>
                        <div class="hidden md:block">
                            <div class="ml-4 flex items-center md:ml-6">

                            </div>
                        </div>
                        <div class="-mr-2 flex md:hidden">
                            <!-- Mobile menu button -->
                            <button type="button" class="inline-flex items-center justify-center rounded-md bg-stone-900 p-2 text-stone-200 hover:bg-stone-500 hover:bg-opacity-75 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-stone-600" aria-controls="mobile-menu" aria-expanded="false">
                                <span class="sr-only">Open main menu</span>

                                <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
                                </svg>

                                <svg class="hidden h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </nav>
        
        <section class="mx-auto max-w-md divide-y-2 divide-blue-gray-200 py-24 px-4 sm:max-w-3xl sm:px-6 lg:max-w-7xl lg:py-32 lg:px-8" aria-labelledby="faq-heading">
            <h2 class="text-3xl font-bold tracking-tight text-blue-gray-900" id="faq-heading">Frequently asked questions</h2>
            <div class="mt-6 pt-10">
                <dl class="space-y-10 md:grid md:grid-cols-2 md:grid-rows-2 md:gap-x-8 md:gap-y-12 md:space-y-0">

                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection connection = null;
                            Statement statement = null;
                            ResultSet rs = null;
                            String connectionURL = "jdbc:mysql://localhost:3308/elet", USER = "root", PWD = "n0m3l0";

                            connection = DriverManager.getConnection(connectionURL, USER, PWD);
                            statement = connection.createStatement();
                            String getUserByUserNameSQLQuery = "SELECT * from tbl_faq;";
                            rs = statement.executeQuery(getUserByUserNameSQLQuery);

                            while (rs.next()) {
                                String question_faq = rs.getString("question_faq");
                                String answer_faq = rs.getString("answer_faq");

                    %> 

                    <div>
                        <dt class="text-lg font-medium text-blue-gray-900"><%=question_faq%></dt>
                        <dd class="mt-2 text-base text-blue-gray-500"><%=answer_faq%></dd>
                    </div>		  
                    <%
                            }

                            statement.close();
                            connection.close();
                        } catch (SQLException e) {
                            out.println("SQLException caught: " + e.getMessage());
                        }
                    %>

                </dl>
            </div>
        </section>
    </body>
</html>