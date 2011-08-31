<%-- 
    Document   : addroomprocess
    Created on : 14 Aug, 2010, 10:48:26 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adding a Room in Progress</title>
        <link rel="STYLESHEET" href="./private/style.css" type="text/css">
    </head>
    <body>
        <%@page import="java.util.*,java.io.*,java.net.*"  %>
        <%
                    String hostport=null;
                    String databasename=null;
                    String dbuser=null,dbpassword=null;
                    Properties props = new Properties();
                    URL myURL=application.getResource("database.properties");


                    //try retrieve data from file
                   
                    try {
                        InputStream in = myURL.openStream();
                        props.load(in);//new FileInputStream("database.properties"));
                        hostport = props.getProperty("hostport");
                        databasename=props.getProperty("databasename");
                        dbuser=props.getProperty("dbuser");
                        dbpassword=props.getProperty("dbpassword");



                    } //catch exception in case properties file does not exist
                    catch (IOException e) {
                        e.printStackTrace();
                    }
        %>
        <%@page language="java" import="java.sql.*" errorPage="" %>
        <%
                    String roomname = request.getParameter("roomname");

                    Connection con = null;
                    Statement stmt = null;
                    try {
                        String command = "insert into rooms value(\'"+roomname+"\')";
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        String conn="jdbc:mysql://"+hostport+"/"+databasename+"";
                        con = DriverManager.getConnection(conn, ""+dbuser+"", ""+dbpassword+"");
                        stmt = con.createStatement();

                        if (!con.isClosed()) {
                            stmt.executeUpdate(command);
                            out.println("<h1>Entry Submitted into Database</h1>");
                            out.println("<a href=\"addroom.jsp\">Add Room</a> or Go to <a href=\"index.jsp\">Home</a>");
                            stmt.close();
                        }
                        else{
                            out.println("Duplicate Data Submitted <a href=\"addroom.jsp\">Add Room</a> or Go to <a href=\"index.jsp\">Home</a>");
                        }
                    } catch (Exception e) {
                         
                            out.println("<br /><br /><center><h3><font color=\"red\">Error! Duplicate Data Submitted </font></h3>Go to <a href=\"addroom.jsp\">Add Room</a> or Go to <a href=\"index.jsp\">Home</a></center>");

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
