<%--
    Document   : add.jsp
    Created on : 13 Aug, 2010, 6:25:15 PM
    Author     : Sanjib Narzary
    Email      : o-._.-o@live.com
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adding User</title>
        <link rel="STYLESHEET" href="./private/style.css" type="text/css">
    </head>
    <body>
        <%@page import="java.util.*,java.io.*,java.net.*"  %>
        <%
                    String hostport = null;
                    String databasename = null;
                    String dbuser = null, dbpassword = null;
                    Properties props = new Properties();
                    URL myURL = application.getResource("database.properties");


                    //try retrieve data from file

                    try {
                        InputStream in = myURL.openStream();
                        props.load(in);//new FileInputStream("database.properties"));
                        hostport = props.getProperty("hostport");
                        databasename = props.getProperty("databasename");
                        dbuser = props.getProperty("dbuser");
                        dbpassword = props.getProperty("dbpassword");



                    } //catch exception in case properties file does not exist
                    catch (IOException e) {
                        e.printStackTrace();
                    }
        %>
        <%@page language="java" import="java.sql.*" errorPage="" %>
        <%
                    String name = request.getParameter("name");
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    String role = request.getParameter("select_role");
                    String email = request.getParameter("email");
                    Connection con = null;
                    Statement stmt = null;
                    try {
                        String command = "insert into user (name,username,password,functional_role,email) values(\'" + name + "\',\'" + username + "\',\'" + password + "\',\'" + role + "\',\'" + email + "\' )";
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        String conn = "jdbc:mysql://" + hostport + "/" + databasename + "";
                        con = DriverManager.getConnection(conn, "" + dbuser + "", "" + dbpassword + "");
                        stmt = con.createStatement();

                        if (!con.isClosed()) {
                            if (username.equals("") || role.equals("")) {
                                out.println("You Must Enter Username and Password");
                            } else {
                                int i = stmt.executeUpdate(command);
                                if (i == 1) {
                                    out.print("<h1>Entry Submitted into Database</h1><br />");
                                    out.println("Go back to <a href=\"index.jsp\">Home page</a>");
                                } else {
                                    out.println("<font color=\"red\">Error </font>Username with " + username + " already registered!");
                                    out.println("Go back to <a href=\"index.jsp\">Home page</a>");
                                }
                            }
                            stmt.close();
                        }
                    } catch (Exception e) {
                        out.println("<font color=\"red\">Error </font>Username with " + username + " already registered!");
                        out.println("Go back to <a href=\"index.jsp\">Home page</a>");
                        e.printStackTrace();
                    } finally {
                        try {
                            if (con != null) {
                                con.close();
                            }
                        } catch (SQLException e) {
                        }
                    }
        %>
    </body>
</html>
