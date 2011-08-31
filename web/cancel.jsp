<%-- 
    Document   : change
    Created on : 16 Aug, 2010, 3:17:15 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change of Booking</title>
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
        <%@page language="java" import="java.sql.*" %>
        <%
                    String timing = request.getParameter("timing");
                    String room = request.getParameter("room");
                    String class1 = request.getParameter("class");
                    String duration = request.getParameter("duration");
                    String username = (String) session.getAttribute("username");
                    String role = (String) session.getAttribute("role");

                    //out.println(username);
                    if (timing.equalsIgnoreCase("Select Your Timing") || room.equalsIgnoreCase("Select Your Room") || class1.equalsIgnoreCase("Select Your Class") || duration.equalsIgnoreCase("Select Duration") || duration.equalsIgnoreCase("--------------")) {
                        out.println("<center><br /><br /><br /><h1><font color=\"red\">Error !Wrong You Must Select from the List</font></h1><br>");
                        out.println("You need to &nbsp;<a href=\"cancellation.jsp\">Go Back</a> or Go <a href=\"index.jsp\">Home</a></center>");
                    } else {
                        Connection con = null;
                        try {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            String conn="jdbc:mysql://"+hostport+"/"+databasename+"";
                        con = DriverManager.getConnection(conn, ""+dbuser+"", ""+dbpassword+"");
                            Statement stmt;//, stmt1 = con.createStatement();
                            String str = "select * from time_table where room=\'" + room + "\' AND timing=\'" + timing + "\' && duration=\'" + duration + "\'";
                            ResultSet rs = null;
                            if (!con.isClosed()) {
                                stmt = con.createStatement();
                                rs = stmt.executeQuery(str);
                                if (rs.next() == true) {
                                    out.println("Yummy<br />");
                                    //String insert = "update time_table set timing='"+timing+"',room='"+room+"',class='"+class1+"',user='"+username+"',duration='"+duration+"',available=false,role='"+role+"' where room=\'" + room + "\' AND timing=\'" + timing + "\' && duration=\'" + duration + "\'";
                                    String insert = "delete from time_table where room=\'" + room + "\' AND timing=\'" + timing + "\' && duration=\'" + duration + "\'";
                                    int i = stmt.executeUpdate(insert);
                                    if (i == 1) {
                                        out.print("Cancelled Successfully! <a href=\"cancellation.jsp\" onclick=\"javascript:location.href=\"cancellation.jsp\"\">Go Back</a>&nbsp;or Go <a href=\"index.jsp\">Home</a></center>");
                                    } else {
                                        out.println("Delete Not Updated!");
                                    }

                                } else {
                                    out.println("<font color=\"red\"><h1>Error! Can not Change! </h1></font><a href=\"cancellation.jsp\">Go Back</a>");

                                }
                                rs.close();
                                stmt.close();
                            }

                        } catch (Exception e) {
                            out.println("<font color=\"red\">Error! Entry not Submitted </font><a href=\"index.jsp\">Go Home</a>");
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
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><table>
            <font color="grey"><tr><td><font color="grey">&copy; 2010 NIT Calicut, CSE Dept. Online Class Room Booking System. Web Based Application</font><td><td></td></tr><tr><td></td><td align="right"><font color="grey">Sanjib Narzary (M100355CS)</font></td></tr></font>
        </table>
    </body>
</html>
