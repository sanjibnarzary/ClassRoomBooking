<%-- 
    Document   : viewwaitinglist
    Created on : 21 Aug, 2010, 3:27:47 PM
    Author     : Sanjib Narzary
    Email      : o-._.-o@live.com
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Waiting List</title>
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
            <%@page import="java.sql.*" language="java" %>
            <%
                        String myname = (String) session.getAttribute("username");
                        String role1 = (String) session.getAttribute("role");

                        if (myname != null) {
                            out.println("Welcome  " + myname + "  , You are logged is as " + role1 + " <a href=\"logout.jsp\" >Logout</a>");
                            out.println("Or go to" + "<a href=\"index.jsp\"> Home</a>");
                            out.println("&nbsp");
                            out.println("<center>");
                            Connection con = null;
                            try {
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                String conn = "jdbc:mysql://" + hostport + "/" + databasename + "";
                                con = DriverManager.getConnection(conn, "" + dbuser + "", "" + dbpassword + "");
                                Statement stmt = con.createStatement();
                                ResultSet rs = null;
                                if (!con.isClosed()) {
                                    String str = "select * from waiting_list where user_booked_by='"+myname+"'";
                                    rs = stmt.executeQuery(str);
                                    out.println("<h1>Waiting List</h1>");
                                    out.println("<table border=\"1\"><tr><td>Time</td><td>Room Name</td><td>Enter to Book On</td><td>Booking Type</td><td>User Booked By</td><td>Date On/From</td><td>Date To</td><td>Position:</td></tr>");
                                    int j=1;
                                    while (rs.next() == true) {
                                        out.println("<tr><td>" + rs.getString("timing") + "</td><td>" + rs.getString("room") + "</td><td>" + rs.getString("on_date") + "</td><td>" + rs.getString("duration") + "</td><td>" + rs.getString("user_booked_by") + "</td><td>" + rs.getString("datefrom")+"</td><td>"+rs.getString("dateto")+"</td><td>"+j+"</td></tr>");
                                        j++;
                                        }
                                    if(rs.previous()==false){
                                        out.println("<font color=\"red\"><h3>Sorry No Items To Display</h3></font>");
                                    }
                                    out.println("</table>");
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
                        out.println("<br /><br /><br /><br /><br /><center>Note: if null or N/A is printed on the specified box then it shows Not Applicable for that.");
                        } else {

            %>
            <!-- <h2>You are logged in now go to home for change<a href="index.jsp" style="text-decoration: none">Home</a></h2> //-->
            <%                    }
            %>
    </body>
</html>
