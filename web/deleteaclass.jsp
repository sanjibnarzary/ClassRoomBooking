<%-- 
    Document   : deleteaclass
    Created on : 15 Aug, 2010, 5:47:02 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete A Subject Class</title>
        <link rel="STYLESHEET" href="private/style.css" type="text/css">
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

        <%
                    String myname = (String) session.getAttribute("username");
                    String role1 = (String) session.getAttribute("role");

                    if ((myname != null)&&(role1.equalsIgnoreCase("Head of Department")||role1.equalsIgnoreCase("Time Table In-Charge"))) {
                        out.println("Welcome  " + myname + "! You are logged in as " + role1 + "!  , <a href=\"logout.jsp\" >Logout</a>");
        %>
         <%@page language="java" import="java.sql.*" %>
         <br /><br /><br />
         <font color="red">Warning!</font>
            <p>By deleting a subject name all booked records corresponding to that subject will
            also be deleted. So be carefull :)
            </p>
        <%
                    out.println(" <h1>Delete A Subject!</h1>");
                    Connection con = null;
                    try {
                        String[] room = null;
                        int i = 0;
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        String conn="jdbc:mysql://"+hostport+"/"+databasename+"";
                        con = DriverManager.getConnection(conn, ""+dbuser+"", ""+dbpassword+"");
                        Statement stmt = con.createStatement();
                        ResultSet rs = null;
                        if (!con.isClosed()) {
                            String del = "select class from classes";
                            rs = stmt.executeQuery(del);
        %>
        <form method="POST" action="deleteaclassprocess.jsp">
            
            <table><tr><td>Select Subject Name to Delete</td><td>
                        <select name="class">
                            <%
                                                        while (rs.next() == true) {


                                                            out.println("<option>"+rs.getString("class")+"</option>");


                                                        }

                            %>
                        </select>
                    </td><td><input type="submit" value="Delete Class" /></td></tr>
            </table>
        </form>
                        <br />Or go to <a href="index.jsp">Return Home</a>
        <%

                            rs.close();
                            stmt.close();
                        }

                    } catch (Exception e) {
                        out.println("Problem");
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
        <%
        }
        else{
            out.println("<center><h1><font color=\"red\">Limited Access!</h1></font>&nbsp <h3>back to go <a href=\"index.jsp\">Home</a></h3></center>");
        }
        %>
    </body>
</html>
