<%--
    Document   : bookaroomprocess
    Created on : 15 Aug, 2010, 5:36:38 PM
    Author     : Sanjib Narzary
    Email      : o-._.-o@live.com
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
        <h3><font color="grey">Booking Room Progress..</font></h3>
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
                    String class1 = request.getParameter("class-name");
                    String duration = request.getParameter("duration");
                    String username = (String) session.getAttribute("username");
                    String role = (String) session.getAttribute("role");
                    String month = request.getParameter("month");
                    String day = request.getParameter("day");
                    String year = request.getParameter("year");
                    String bookfrom = request.getParameter("bookfrom");
                    String bookto = request.getParameter("bookto");
                    String sessionofyear = request.getParameter("session");
                    String singledate = request.getParameter("singledate");
                    // out.println("Month: " + month + " Day: " + day + " Year: " + year + " Book From: " + bookfrom + " Book To: " + bookto + " Session: " + sesseionofyear);
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    //Need For Some Time Waiting List
                    java.util.Date nnn = new java.util.Date();
                    java.sql.Date nnnn = new java.sql.Date(nnn.getTime());
                    String ondate = nnnn.toString();
                    Connection con = null;
                    ResultSet rs = null;
                    if (timing.equalsIgnoreCase("Select Your Timing") || room.equalsIgnoreCase("Select Your Room") || class1.equalsIgnoreCase("Select Your Class") || duration.equalsIgnoreCase("Select Duration") || duration.equalsIgnoreCase("--------------")) {
                        out.println("<center><br /><br /><br /><h1><font color=\"red\">Error !Wrong You Must Select from the List</font></h1><br>");
                        out.println("You need to &nbsp;<a href=\"bookingsearch.jsp\">Go Back</a> or Go <a href=\"index.jsp\">Home</a></center>");
                    } else {
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
                                String querry = null;
                                if (duration.equalsIgnoreCase("Single Day")) {
                                    //here
                                    if (sdf.parse(singledate).before(sdf.parse(ondate))) {
                                        out.println("<center><font color=\"red\"><h1>Outdated Date! No need to search for previous dates!</h1></font><br /><a href=\"bookingsearch.jsp\">Go Back</a></center>");
                                    } else {
                                        String sng = "select * from time_table where timing='" + timing + "' AND room='" + room + "' AND day='" + day + "'";// where singledate='" + singledate + "' OR bookfrom='" + bookfrom + "' OR bookto='" + bookto + "'";
                                        rs = stmt.executeQuery(sng);
                                        // if (rs.next() == true) {
                                        //out.println("Hello");
                                        boolean b = true;
                                        while (rs.next() == true) {
                                            //out.println(rs.getString("singledate"));
                                            //out.print("SDFSFFS"+sd);
                                            if (rs.getString("singledate") != null) {
                                                //if (timing.equalsIgnoreCase(rs.getString("timing")) && class1.equalsIgnoreCase(rs.getString("class")) && day.equalsIgnoreCase(rs.getString("day"))) {
                                                if (sdf.parse(singledate).equals(sdf.parse(rs.getString("singledate")))) {
                                                    out.println("Sorry your booking Search at " + timing + " , on room " + room + " at " + day + " and date " + singledate + "! Already Booked.");
                                                    b = false;
                                                } else {
                                                    //out.println("Hello");
                                                }

                                                // }
                                            } else if (!(rs.getDate("bookto") == null || rs.getDate("bookto") == null)) {
                                                if (sdf.parse(singledate).equals(sdf.parse(rs.getString("bookfrom"))) || sdf.parse(singledate).equals(sdf.parse(rs.getString("bookto")))) {
                                                    b = false;
                                                    out.println("Sorry your booking Search at " + timing + " , on room " + room + " at " + day + " and date " + singledate + "! fall in a Mass Book " + rs.getString("bookfrom") + " to " + rs.getString("bookto") + " Which is not allowed.");
                                                } else if (sdf.parse(singledate).after(sdf.parse(rs.getString("bookfrom"))) && sdf.parse(singledate).before(sdf.parse(rs.getString("bookto")))) {
                                                    out.println("Sorry your booking Search at " + timing + " , on room " + room + " at " + day + " and date " + singledate + "! fall in a Mass Book " + rs.getString("bookfrom") + " to " + rs.getString("bookto") + " Which is not allowed.");
                                                    b = false;
                                                }
                                            } else {
                                                //out.println("???????????");
                                            }

                                        }
                                        if (b == true) {
                                            out.println("<fornt color=\"green\"><h3>Available!</h3></font>");
                                            out.println("<form action=\"bookaroomprocess.jsp\" method=\"POST\">");
                                            out.println("<input type=\"hidden\" name=\"timing\" value=\"" + timing + "\">");
                                            out.println("<input type=\"hidden\" name=\"room\" value=\"" + room + "\">");
                                            out.println("<input type=\"hidden\" name=\"class-name\" value=\"" + class1 + "\">");
                                            out.println("<input type=\"hidden\" name=\"user\" value=\"" + username + "\">");
                                            out.println("<input type=\"hidden\" name=\"singledate\" value=\"" + singledate + "\">");
                                            out.println("<input type=\"hidden\" name=\"type-booking\" value=\"Single Day\">");
                                            out.println("<input type=\"hidden\" name=\"bookfrom\" value=\"" + bookfrom + "\">");
                                            out.println("<input type=\"hidden\" name=\"bookto\" value=\"" + bookto + "\">");
                                            out.println("<input type=\"hidden\" name=\"role\" value=\"" + role + "\">");
                                            out.println("<input type=\"hidden\" name=\"day\" value=\"" + day + "\">");
                                            out.println("<input type=\"hidden\" name=\"duration\" value=\"" + duration + "\">");
                                            out.println("<input type=\"submit\"  value=\"Book It Now\">");
                                            out.println("</form>");
                                        } else {
                                            //Waiting List Implementation during Single Book
                                            out.println("<br /><font color=\"red\">Enter for Waiting List</font>");
                                            out.println("<form action=\"waiting.jsp\" method=\"POST\">");
                                            out.println("<input type=\"hidden\" name=\"timing\" value=\"" + timing + "\">");
                                            out.println("<input type=\"hidden\" name=\"room\" value=\"" + room + "\">");
                                            out.println("<input type=\"hidden\" name=\"user\" value=\"" + username + "\">");
                                            out.println("<input type=\"hidden\" name=\"ondate\" value=\"" + ondate + "\">");
                                            out.println("<input type=\"hidden\" name=\"type-booking\" value=\"Single Day\">");
                                            out.println("<input type=\"hidden\" name=\"datefrom\" value=\"" + singledate + "\">");
                                            //out.println("<input type=\"hidden\" name=\"dateto\">");
                                            out.println("<input type=\"hidden\" name=\"duration\" value=\"" + duration + "\">");
                                            out.println("<input type=\"hidden\" name=\"role\" value=\"" + role + "\">");
                                            out.println("<input type=\"submit\"  value=\"Add To Waiting List\">");
                                            out.println("</form>");
                                        }
                                        //here
                                    }

                                } else if (duration.equalsIgnoreCase("One Month") || duration.equalsIgnoreCase("Mass Booking")) {

                                    //here
                                    if (sdf.parse(bookfrom).before(sdf.parse(ondate)) || sdf.parse(bookto).before(sdf.parse(ondate))) {
                                        out.println("<center><font color=\"red\"><h1>Outdated Date! No need to search for previous dates!</h1></font><br /><a href=\"bookingsearch.jsp\">Go Back</a></center>");
                                    } else if (sdf.parse(bookto).before(sdf.parse(bookfrom))) {
                                        out.println("<center><font color=\"red\"><h1>Book upto date must be greater than book from.!</h1></font><br /><a href=\"bookaroom.jsp\">Go Back</a></center>");

                                    } else {

                                        String sng = "select * from time_table where timing='" + timing + "' AND room='" + room + "' AND day='" + day + "'";// where singledate='" + singledate + "' OR bookfrom='" + bookfrom + "' OR bookto='" + bookto + "'";
                                        rs = stmt.executeQuery(sng);

                                        boolean b = true;
                                        while (rs.next() == true) {

                                            if (rs.getString("singledate") != null) {
                                                if (sdf.parse(bookfrom).equals(sdf.parse(rs.getString("singledate"))) || sdf.parse(bookto).equals(sdf.parse(rs.getString("singledate")))) {
                                                    out.println("<br />Sorry your booking search at " + timing + " , on room " + room + " at " + day + " and date " + bookfrom + " to " + bookto + " fall in Single day Booking " + rs.getString("singledate") + "<br>");
                                                    b = false;
                                                } else {
                                                }

                                            } else if (!(rs.getDate("bookto") == null || rs.getDate("bookto") == null)) {
                                                if (sdf.parse(bookfrom).equals(sdf.parse(rs.getString("bookfrom"))) || sdf.parse(bookto).equals(sdf.parse(rs.getString("bookto"))) || sdf.parse(bookto).equals(sdf.parse(rs.getString("bookfrom")))) {
                                                    b = false;
                                                    out.println("<br />Sorry your booking search at " + timing + " , on room " + room + " at " + day + " and date " + bookfrom + " to " + bookto + " your Book fall in a Mass Book " + rs.getString("bookfrom") + " to " + rs.getString("bookto") + " Which is not allowed.<br />");
                                                } else if (sdf.parse(bookfrom).after(sdf.parse(rs.getString("bookfrom"))) && sdf.parse(bookfrom).before(sdf.parse(rs.getString("bookto"))) || sdf.parse(bookto).after(sdf.parse(rs.getString("bookfrom"))) && sdf.parse(bookto).before(sdf.parse(rs.getString("bookto")))) {
                                                    out.println("<br />Sorry your booking search at " + timing + " , on room " + room + " at " + day + " and date " + bookfrom + " to " + bookto + " your Book fall in a Mass Book " + rs.getString("bookfrom") + " to " + rs.getString("bookto") + " Which is not allowed.<br />");
                                                    b = false;
                                                }
                                            } else {
                                                //out.println("???????????");
                                            }
                                        }
                                        if (b == true) {
                                            /*  querry = "insert into time_table(timing,room,class,user,role,duration,available,singledate,day,year,bookfrom,bookto,session) values('"
                                            + timing + "','" + room + "','" + class1 + "','" + username + "','" + role + "','" + duration + "',false,'" + singledate + "','" + day + "','N/A',null,null,'N/A')";*/

                                            out.println("<fornt color=\"green\"><h3>Available!</h3></font>");
                                            out.println("<form action=\"bookaroomprocess.jsp\" method=\"POST\">");
                                            out.println("<input type=\"hidden\" name=\"timing\" value=\"" + timing + "\">");
                                            out.println("<input type=\"hidden\" name=\"room\" value=\"" + room + "\">");
                                            out.println("<input type=\"hidden\" name=\"class-name\" value=\"" + class1 + "\">");
                                            out.println("<input type=\"hidden\" name=\"user\" value=\"" + username + "\">");
                                            out.println("<input type=\"hidden\" name=\"singledate\" value=\"" + singledate + "\">");
                                            out.println("<input type=\"hidden\" name=\"type-booking\" value=\"Mass Booking\">");
                                            out.println("<input type=\"hidden\" name=\"bookfrom\" value=\"" + bookfrom + "\">");
                                            out.println("<input type=\"hidden\" name=\"bookto\" value=\"" + bookto + "\">");
                                            out.println("<input type=\"hidden\" name=\"role\" value=\"" + role + "\">");
                                            out.println("<input type=\"hidden\" name=\"day\" value=\"" + day + "\">");
                                            out.println("<input type=\"hidden\" name=\"duration\" value=\"" + duration + "\">");
                                            out.println("<input type=\"submit\"  value=\"Book It Now\">");
                                            out.println("</form>");
                                        } else {
                                            //Waiting List Implementation for One Month or Multiple Book

                                            out.println("<br /><font color=\"red\">Not Availablable! Enter for Waiting List</font>");
                                            out.println("<form action=\"waiting.jsp\" method=\"POST\">");
                                            out.println("<input type=\"hidden\" name=\"timing\" value=\"" + timing + "\">");
                                            out.println("<input type=\"hidden\" name=\"room\" value=\"" + room + "\">");
                                            out.println("<input type=\"hidden\" name=\"user\" value=\"" + username + "\">");
                                            out.println("<input type=\"hidden\" name=\"ondate\" value=\"" + ondate + "\">");
                                            out.println("<input type=\"hidden\" name=\"type-booking\" value=\"Mass Book\">");
                                            out.println("<input type=\"hidden\" name=\"datefrom\" value=\"" + bookfrom + "\">");
                                            out.println("<input type=\"hidden\" name=\"dateto\" value=\"" + bookto + "\">");
                                            out.println("<input type=\"hidden\" name=\"role\" value=\"" + role + "\">");
                                            out.println("<input type=\"hidden\" name=\"duration\" value=\"" + duration + "\">");
                                            out.println("<input type=\"submit\"  value=\"Add To Waiting List\">");
                                            out.println("</form>");
                                        }
                                    }
                                    //here
                                } else if (duration.equalsIgnoreCase("Entire Semester")) {
                                    String sng = "select * from time_table where timing='" + timing + "' AND room='" + room + "' AND day='" + day + "'";
                                    rs = stmt1.executeQuery(sng);
                                    boolean b = true;
                                    while (rs.next() == true) {
                                        if (year.equalsIgnoreCase(rs.getString("year")) && sessionofyear.equalsIgnoreCase(rs.getString("session"))) {
                                            b = false;
                                        }
                                    }
                                    if (b == true) {
                                        out.println("<fornt color=\"green\"><h3>By Default All Entire Semester Booking and Year Booking is Available!</h3></font>");
                                    } else {
                                        out.println("<fornt color=\"green\"><h3>By Default All Entire Semester Booking and Year Booking is Available!</h3></font>");
                                    }

                                } else if (duration.equalsIgnoreCase("Entire Year")) {
                                    String sng = "select * from time_table where timing='" + timing + "' AND room='" + room + "' AND day='" + day + "'";
                                    rs = stmt1.executeQuery(sng);
                                    boolean b = true;
                                    while (rs.next() == true) {
                                        if (year.equalsIgnoreCase(rs.getString("year"))) {
                                            b = false;
                                        }
                                    }

                                    if (b == true) {
                                        out.println("<fornt color=\"green\"><h3>By Default All Entire Semester Booking and Year Booking is Available!</h3></font>");
                                    } else {
                                        out.println("<fornt color=\"green\"><h3>By Default All Entire Semester Booking and Year Booking is Available!</h3></font>");
                                    }
                                }

                                out.println();
                                //rs = stmt1.executeQuery(str);

                                stmt.close();
                                //stmt1.close();
                            }
                        } catch (Exception e) {
                            //out.print(e);
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
                    }
        %>
    </body>
</html>