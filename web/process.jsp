<%-- 
    Document   : checkLogin
    Created on : 13 Aug, 2010, 5:42:58 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Process</title>
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

                    if (myname != null) {
                        out.println("Welcome  " + myname + "  , Your logged is as " + role1 + " <a href=\"logout.jsp\" >Logout</a>");
                        out.println("You already logged in.." + "<a href=\"index.jsp\"> Home</a>");
                    } else {
        %>
        <%
                        String username = request.getParameter("username");
                        String password = request.getParameter("password");
                        //String role=request.getParameter("select_role");
                        out.println("Checking login<br>");
                        if (username == null || password == null) {

                            out.print("Invalid paramters ");

                        }
 //out.print(hostport+databasename+dbuser+dbpassword);

                        String role = request.getParameter("select_role");
                        Connection con = null;
                        try {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            String conn="jdbc:mysql://"+hostport+"/"+databasename+"";                            
                            con = DriverManager.getConnection(conn, ""+dbuser+"", ""+dbpassword+"");
                            Statement stmt = con.createStatement();
                            ResultSet rs = null;
                            if (!con.isClosed()) {
                                String add = "select * from user where username='" + username + "' AND password='" + password + "' AND functional_role='" + role + "'";
                                rs = stmt.executeQuery(add);
                                if (rs.next() == true) {
                                    out.print("Welcome " + rs.getString("username") + "!");
                                    session.setAttribute("username", username);
                                    session.setAttribute("role", role);
                                    out.println("<h2>You are logged in now go to home for change &nbsp;<a href=\"index.jsp\" style=\"text-decoration: none\">Home</a></h2>");

                                }
                                else{
                                     out.println("<h2><font color=\"red\">Login Incorrect! Username Password and Role does not match :) </font><a href=\"index.jsp\" style=\"text-decoration: none\">Go Back</a></h2>");
                                }
                                rs.close();
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

                    }
        %>

        <%

                    // Here you put the check on the username and password
                  /*  if (username.toLowerCase().trim().equals("admin") && password.toLowerCase().trim().equals("admin")) {
                    out.println("Welcome " + username + " <a href=\"index.jsp\">Back to main</a>");
                    session.setAttribute("username", username);
                    } else {
                    out.println("Invalid username and password");
                    }*/
        %>
    </body>
</html>
