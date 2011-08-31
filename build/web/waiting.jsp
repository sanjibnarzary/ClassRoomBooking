<%-- 
    Document   : waiting
    Created on : 21 Aug, 2010, 2:37:16 PM
    Author     : root
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book A Room Process</title>
        <link rel="STYLESHEET" href="./private/style.css" type="text/css">
    </head>
    <body>
        <h3><font color="grey">Waiting List Progress..</font></h3>
        <%@page import="java.util.*,java.io.*,java.net.*"  %>
        <%
                    String hostport = null;
                    String databasename = null;
                    String dbuser = null, dbpassword = null;
                    Properties props = new Properties();
                    URL myURL = application.getResource("database.properties");

                    // out.println(myURL);
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
        <%@page language="java" import="java.sql.*,java.text.SimpleDateFormat,java.util.Date" %>

        <%
                    String timing = request.getParameter("timing");
                    String room = request.getParameter("room");
                    String username = request.getParameter("user");
                    String duration = request.getParameter("duration");
                    //String username = (String) session.getAttribute("username");
                    String ondate = request.getParameter("ondate");
                    String type_booking = request.getParameter("type-booking");

                    String bookfrom = request.getParameter("datefrom");
                    String bookto = request.getParameter("dateto");
                    String role = request.getParameter("role");
                    //String singledate = request.getParameter("singledate");
                    // out.println("Month: " + month + " Day: " + day + " Year: " + year + " Book From: " + bookfrom + " Book To: " + bookto + " Session: " + sesseionofyear);
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    //Need For Some Time Waiting List
                    java.util.Date nnn = new java.util.Date();
                    java.sql.Date nnnn = new java.sql.Date(nnn.getTime());
                    // String ondate = nnnn.toString();

                    Connection con = null;
                    ResultSet rs = null;
                    try {

                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        String conn = "jdbc:mysql://" + hostport + "/" + databasename + "";
                        con = DriverManager.getConnection(conn, "" + dbuser + "", "" + dbpassword + "");
                        Statement stmt, stmt1 = con.createStatement();
                        //String str = "select * from time_table where room=\'" + room + "\' AND timing=\'" + timing + "\' && duration=\'" + duration + "\'";

                        //String str1="insert into time_table(timing,room,class,user,role,duration,available,singledate,day,year,bookfrom,bookto,session) values('"+
                        // timing+"','"+room+"','"+class1+"','"+username+"','"+role+"','"+duration+"',false,'"+singledate+"','"+day+"','"+year+"','"+bookfrom+"','"+bookto+"','"+sessionofyear+"')";
                        // ResultSet rs = null;
                        //out.println(str1);
                        //out.println(querry);
                        stmt = con.createStatement();
                        if (!con.isClosed()) {
                            //String querry = null;
                            if (duration.equalsIgnoreCase("Single Day")) {

                                //boolean b = true;
                                
                                String querry = "insert into waiting_list(user_booked_by,on_date,room,timing,type_booking,datefrom,role,duration) values('" + username + "','" + ondate + "','" + room + "','" + timing + "','" + type_booking + "','" + bookfrom + "','" + role + "','" + duration + "')";

                                int i = stmt.executeUpdate(querry);
                                if (i == 1) {
                                    out.println("Added In to Waiting List! <a href=\"bookaroom.jsp\">Go Back</a>");
                                } else {
                                    out.println("Something Wrong!");
                                }

                            } else if (duration.equalsIgnoreCase("One Month") || duration.equalsIgnoreCase("Mass Booking")) {
                                // String querry = "insert into waiting_lis(user_booked_by,on_date,room,timing,type_booking,datefrom,role,duration) values('" + username + "','" + ondate + "','" + room + "','" + timing + "','" + type_booking + "','" + bookfrom + "','" + role + "','" + duration + "')";
                                
                                String querry = "insert into waiting_list values('" + username + "','" + ondate + "','" + room + "','" + timing + "','" + type_booking + "','" + bookfrom + "','" + role + "','" + duration + "','" + bookto + "')";
                                int i = stmt.executeUpdate(querry);
                                if (i == 1) {
                                    out.println("Added In to Waiting List! <a href=\"bookaroom.jsp\">Go Back</a>");
                                } else {
                                    out.println("Something Wrong!");
                                }


                            }

                        }

                        out.println();
                        //rs = stmt1.executeQuery(str);

                        stmt.close();
                        //stmt1.close();
                    } catch (Exception e) {
                        out.print(e);
                        out.println("<font color=\"red\">Error! Entry not Submitted!Check The Entries and Date Format </font><a href=\"index.jsp\">Go Home</a>");
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

</html>
</body>
</html>
