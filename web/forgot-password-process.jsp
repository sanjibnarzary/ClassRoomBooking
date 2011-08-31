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
        <title>Password Request!</title>
        <link rel="STYLESHEET" href="./private/style.css" type="text/css">
    </head>
    <body><center>
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

        <%
                    String myname = (String) session.getAttribute("username");
                    String role1 = (String) session.getAttribute("role");

                    if ((myname == null) || (role1 == null)) {

        %>
        <%@page language="java" import="java.sql.*" %>
        <%
                                
                                Connection con = null;
                                try {
                                    String[] room = null;
                                    String username = request.getParameter("username");
                                    String email = request.getParameter("email");
                                    
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    String conn = "jdbc:mysql://" + hostport + "/" + databasename + "";
                                    con = DriverManager.getConnection(conn, "" + dbuser + "", "" + dbpassword + "");
                                    
                                    ResultSet rs = null;
                                    if (!con.isClosed()) {
                                        Statement stmt = con.createStatement();
                                        String fgt = "select * from user where username='" + username + "' and email='" + email + "'";
                                       
                                        rs = stmt.executeQuery(fgt);
                                        if(rs.next()==true){
                                            out.println("  <h3>This is your Password</h3>");
                                            out.println("Your Name: "+rs.getString("name")+" and Username: "+rs.getString("username")+"<br />Your request password is <strong>"+rs.getString("password")+"</strong>");
                                            out.println("<br />Go to <a href=\"index.jsp\">login</a>");
                                        }
                                        else{
                                            out.println("<font color=\"red\">No Entry Found! </font><a href=\"index.jsp\">Home</a>");
                                        }
                                        rs.close();
                                        stmt.close();
                                    }

                                } catch (Exception e) {
                                    out.println("Problem! ");
                                    out.print("Contact ensilage@gmail.com");
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
        </center>
        <%
                    } else {
                        out.println("<center><h1><font color=\"blue\">You Already logged in!</h1></font>&nbsp <h3>back to go <a href=\"index.jsp\">Home</a></h3></center>");
                        out.println("Welcome  " + myname + "! You are logged in as " + role1 + "!  , <a href=\"logout.jsp\" >Logout</a>");
                    }
        %>
    </body>
</html>
