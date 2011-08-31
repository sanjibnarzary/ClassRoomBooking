<%-- 
    Document   : cancellation
    Created on : 16 Aug, 2010, 11:00:34 AM
    Author     : Sanjib Narzary
    Email      : o-._.-o@live.com
--%>

<%@page import="sun.swing.PrintColorUIResource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
               <link rel="STYLESHEET" href="./private/style.css" type="text/css">

        <title>Change (Modify) / Cancel Booking</title>
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
                    String user = (String) session.getAttribute("username");
                    String role = (String) session.getAttribute("role");
                    if(user!=null&&role!=null){
                    Connection con = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        String conn="jdbc:mysql://"+hostport+"/"+databasename+"";
                        con = DriverManager.getConnection(conn, ""+dbuser+"", ""+dbpassword+"");
                        Statement stmt = con.createStatement();
                        String str = null;
                        ResultSet rs = null;
                        if (!con.isClosed()) {
                            if (role.equalsIgnoreCase("Head of Department") || role.equalsIgnoreCase("Time Table In-Charge")) {
                                str = "select * from time_table";
                            } else if (role.equalsIgnoreCase("Faculty")) {
                                str = "select * from time_table where user=\'" + user + "\' OR role=\'Student\'";
                            } else {
                                str = "select * from time_table where user=\'" + user + "\'";
                            }
                            rs = stmt.executeQuery(str);
                            out.print("<center>");
                            out.println(" <h1>Cancellation or Modification of Booked Rooms or Slots!</h1>");
                            out.println("<h1>Displaying Booked</h1>");
                            out.println("<table border=\"1\"><tr><td>Time</td><td>Room Name</td><td>Class Subject</td><td>Type of Booking</td><td>User Booked By</td><td>Day</td><td>Year</td><td>Session</td><td>Date for<br />Single Booking</td><td>Date From</td><td>Date To</td><td>Action</td></tr>");
                            while (rs.next() == true) {
                                out.println("<tr><td>" + rs.getString("timing") + "</td><td>" + rs.getString("room") + "</td><td>" + rs.getString("class") + "</td><td>" + rs.getString("duration") + "</td><td>" + rs.getString("user") +"</td><td>" + rs.getString("day") +"</td><td>" + rs.getString("year") +"</td><td>" + rs.getString("session") +"</td><td>" + rs.getString("singledate") +"</td><td>" + rs.getString("bookfrom") +"</td><td>" + rs.getString("bookto") + "</td><td><form action=\"change.jsp\" method=\"POST\"><input type=\"hidden\" name=\"timing\" value=\"" + rs.getString("timing") + "\" /><input type=\"hidden\" value=\"" + rs.getString("room") + "\" name=\"room\" /><input type=\"hidden\" value=\"" + rs.getString("class") + "\" name=\"class\" /><input type=\"hidden\" value=\"" + rs.getString("duration") + "\" name=\"duration\" /><input type=\"hidden\" value=\"" + rs.getString("singledate") + "\" name=\"singledate\" /><input type=\"hidden\" value=\"" + rs.getString("bookfrom") + "\" name=\"bookfrom\" /><input type=\"hidden\" value=\"" + rs.getString("bookto") + "\" name=\"bookto\" /><input type=\"submit\" value=\"  Modify &nbsp\" title=\"Click Here To Modify Your Booking!\" /></form><form action=\"cancel.jsp\" method=\"POST\"><input type=\"hidden\" value=\"" + rs.getString("timing") + "\" name=\"timing\" /><input type=\"hidden\" value=\"" + rs.getString("room") + "\" name=\"room\" /><input type=\"hidden\" value=\"" + rs.getString("class") + "\" name=\"class\" /><input type=\"hidden\" value=\"" + rs.getString("duration") + "\" name=\"duration\" /><input type=\"submit\" value=\"&nbsp Cancel &nbsp\" title=\"Click Here To Cancel Your Booking!\"/></form></td></tr>");
                            }
                            out.println("</table>");
                            out.println("<br /><br /><br /> Note: null or N/A stands for not applicable to that box using the specified booking type.");
                            out.print("</center>");
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
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><table>
            <font color="grey"><tr><td><font color="grey">&copy; 2010 NIT Calicut, CSE Dept. Online Class Room Booking System. Web Based Application</font><td><td></td></tr><tr><td></td><td align="right"><font color="grey">Sanjib Narzary (M100355CS)</font></td></tr></font>
        </table>
    </body>
</html>
