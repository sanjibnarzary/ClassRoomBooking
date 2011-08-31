<%-- 
    Document   : addclassrocess
    Created on : 15 Aug, 2010, 5:42:12 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a Class Progress</title>
        <link rel="STYLESHEET" href="./private/style.css" type="text/css">
    </head>
    <body>
        <h1>Add Subject Process</h1>
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
                    String classname = request.getParameter("classname");

                    Connection con = null;
                    Statement stmt = null;
                    try {
                        String command = "insert into classes value(\'" + classname + "\')";
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        String conn = "jdbc:mysql://" + hostport + "/" + databasename + "";
                        con = DriverManager.getConnection(conn, "" + dbuser + "", "" + dbpassword + "");
                        stmt = con.createStatement();

                        if (!con.isClosed()) {
                            int i = stmt.executeUpdate(command);
                            if (i == 1) {
                                out.println("<h1>Entry Submitted into Database</h1>");
                                out.println("<a href=\"addclass.jsp\">Add More Subjects</a> or Go to <a href=\"index.jsp\">Home</a>");
                            } else {
                                out.println("<br /><br /><center><h3><font color=\"red\">Error! Duplicate Data Submitted </font></h3>Go to <a href=\"addclass.jsp\">Add Subject</a> or Go to <a href=\"index.jsp\">Home</a></center>");
                            }
                            stmt.close();
                        } else {
                            out.println("Connection to database is refused. Check whether database server is running or not. <a href=\"addclass.jsp\">Add Subject</a> or Go to <a href=\"index.jsp\">Home</a>");
                        }
                    } catch (Exception e) {
                        out.println("<font color=\"red\"><h3>Error! Either this room is already in the database or you have enter a long room name. <br />Room name should not exceed 25 character. Put Other Room name. </h3></font><a href=\"addclass.jsp\">Add Subject</a> or Go to <a href=\"index.jsp\">Home</a>");
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
