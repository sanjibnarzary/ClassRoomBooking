<%--
    Document   : deletearoomprocess
    Created on : 14 Aug, 2010, 11:42:21 PM
    Author     : Sanjib Narzary
    Email      : o-._.-o@live.com
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete A User Process</title>
        <link rel="STYLESHEET" href="./private/style.css" type="text/css">
    </head>
    <body>
        <h1>Deleting User Now!</h1>
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
        <%@page language="java" import="java.sql.*" %>
        <%
                    String username = request.getParameter("user");
                    Connection con = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        String conn = "jdbc:mysql://" + hostport + "/" + databasename + "";
                        con = DriverManager.getConnection(conn, "" + dbuser + "", "" + dbpassword + "");
                        Statement stmt = con.createStatement();

                        if (!con.isClosed()) {
                            String delroom = "DELETE FROM user where username=\'" + username + "\'";
                            String delbook = "DELETE FROM time_table where username=\'" + username + "\'";
                            int i = stmt.executeUpdate(delroom);
                            if (i == 1) {
                                out.println("<font color=\"red\"><h2>Deleted User  " + username + " Successfully..</h2></font>");
                                int j = stmt.executeUpdate(delbook);
                                if (j == 1) {
                                    out.println("<font color=\"cyan\"><br /><br />All the Booked records associated with  " + username + " Successfully.. cancelled </font><a href=\"removeuser.jsp\">Delete More Users</a> or Go to Home<a href=\"index.jsp\">Go Home</a>");
                                } else {
                                    out.println("<font color=\"cyan\"><br /><br />There was no booked associated with: " + username + ".. </font><a href=\"removeuser.jsp\">Delete More Rooms</a> or <a href=\"index.jsp\">Go Home</a>");
                                }
                            } else {
                                out.println("<font color=\"red\"><br />Error! " + username + " User Not Deleted! Successfully.. </font><a href=\"removeuser.jsp\">Back</a> or Go to Home<a href=\"index.jsp\">Go Home</a>");
                            }
                            stmt.close();
                        }

                    } catch (Exception e) {
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
