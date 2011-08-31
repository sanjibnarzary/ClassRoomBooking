<%-- 
    Document   : deletearoom
    Created on : 14 Aug, 2010, 11:07:54 PM
    Author     : Sanjib Narzary
    Email      : o-._.-o@live.com
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete A Room</title>
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
      
        <%       
                    String myname = (String) session.getAttribute("username");
                    String role1 = (String) session.getAttribute("role");

                    if ((myname != null)&&role1.equalsIgnoreCase("Head of Department")) {
                        out.println("Welcome  " + myname + "! You are logged in as " + role1 + "!  , <a href=\"logout.jsp\" >Logout</a>");
        %>
        <%@page language="java" import="java.sql.*" %><br /><br /><br />
        <font color="red">Warning!</font>
            <p>By deleting a room name all booked records corresponding to that room will
            also be deleted. So be carefull :)
            </p>
        <%
                   out.println("  <h1>Delete A Room</h1>");
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
                            String del = "select room from rooms";
                            rs = stmt.executeQuery(del);
        %>
        <form method="POST" action="deletearoomprocess.jsp">
            <table><tr><td>Select Room to Delete</td><td>
                        <select name="room">
                            <%
                                                        while (rs.next() == true) {


                                                            out.println("<option>"+rs.getString("room")+"</option>");


                                                        }
                             
                            %>
                        </select>
                    </td><td><input type="submit" value="Delete Room" /></td></tr>
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
