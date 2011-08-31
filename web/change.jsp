<%-- 
    Document   : change
    Created on : 16 Aug, 2010, 8:50:06 PM
    Author     : Sanjib Narzary
    Email      : o-._.-o@live.com
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify </title>
        <link rel="STYLESHEET" href="./private/style.css" type="text/css">

        <script type="text/javascript">
            function showUser(str)
            {
                if (str=="")
                {
                    document.getElementById("txtHint").innerHTML="";
                    return;
                }
                if (window.XMLHttpRequest)
                {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp=new XMLHttpRequest();
                }
                else
                {// code for IE6, IE5
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange=function()
                {
                    if (xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
                    }
                }
                xmlhttp.open("GET","months_2.jsp?duration="+str,true);
                xmlhttp.send();
            }
        </script>
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
        <%@page language="java" import="java.sql.*" %>
        <%
                    String timing1 = request.getParameter("timing");
                    String room1 = request.getParameter("room");
                    String class1 = request.getParameter("class");
                    String duration1 = request.getParameter("duration");
                    String username = (String) session.getAttribute("username");
                    String role = (String) session.getAttribute("role");
                    String singledate = request.getParameter("singledate");
                    String bookfrom = request.getParameter("bookfrom");
                    String bookto = request.getParameter("bookto");


                    //out.println(username);
                    if (timing1.equalsIgnoreCase("Select Your Timing") || room1.equalsIgnoreCase("Select Your Room") || class1.equalsIgnoreCase("Select Your Class") || duration1.equalsIgnoreCase("Select Duration") || duration1.equalsIgnoreCase("--------------")) {
                        out.println("<center><br /><br /><br /><h1><font color=\"red\">Error !Wrong You Must Select from the List</font></h1><br>");
                        out.println("You need to &nbsp;<a href=\"cancellation.jsp\">Go Back</a> or Go <a href=\"index.jsp\">Home</a></center>");
                    } else {
                        Connection con = null;
                        try {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            String conn = "jdbc:mysql://" + hostport + "/" + databasename + "";
                            con = DriverManager.getConnection(conn, "" + dbuser + "", "" + dbpassword + "");
                            Statement stmt = null;
                            String assetvalues = timing1 + "," + room1 + "," + class1 + "," + duration1+","+singledate+","+bookfrom+","+bookto;
                            //, stmt1 = con.createStatement();
                            String[] duration = {"--------------", "Single Day", "--------------", "Mass Booking", "--------------", "One Month", "--------------","Choose the ^"
                            };
                            String[] timing = {"8AM-9AM", "9AM-10AM", "10:15AM-11:15AM", "11:15AM-12:15AM", "1PM-2PM", "2PM-3PM", "3PM-5PM"};
                            ResultSet st = null, bt = null;
                            if (!con.isClosed()) {
                                stmt = con.createStatement();

                                String room = "select * from rooms";
                                String classes = "select * from classes";
                                out.println("<h3>You are about to change <br /> Time: \"" + timing1 + "\" Room: \"" + room1 + "\" Class: \"" + class1 + "\" Booking Type: \"" + duration1 + "\"....:)");
                                //here some
                                if(duration1.equalsIgnoreCase("Entire Semester")||duration1.equalsIgnoreCase("Entire Year")){
                                    out.println("<font color=\"green\"><h1>Sorry Not Applicable :)</h1> For Entire Semester and Entire Year Booking<br />If You Need to Modify it Just Cancel it and then Re Book It :) <br /></font> <a href=\"cancellation.jsp\">Go Back</a><br />");
                                }
                                else{
                                    if(duration1.equalsIgnoreCase("Single Day")){
                                        out.println(" On \""+singledate+"\"</h3>");
                                    }
                                    else{
                                    out.println(" From \""+bookfrom+"\" to \""+ bookto+"\"</h3>");
                                    }
                                out.println("<form action=\"modifyprocess.jsp\" method=\"POST\">");
                                out.println("<br /><table><tr><td></td><td>&nbsp;&nbsp;Select Timing</td><td>&nbsp;&nbsp;Select Room</td>"
                                        + "<td>&nbsp;&nbsp;Select Subject</td><td>&nbsp;&nbsp;</td><td></td></tr>" + "");
                                out.print("<tr><td>Select Your Choice:</td>");
                                out.println("<td>");
                                //rs = stmt.executeQuery(add);                               
                                out.print("<select name=\"timing\">");
                                out.println("<option>Select Your Timing</option>");
                                for (int j = 0; j < timing.length; j++) {
                                    out.println("<option>" + timing[j] + "</option>");
                                }
                                out.print("</select>");
                                //for room
                                out.println("</td><td>");
                                st = stmt.executeQuery(room);
                                out.print("<select name=\"room\">");
                                out.println("<option>Select Your Room</option>");
                                while (st.next() == true) {
                                    out.println("<option>" + st.getString("room") + "</option>");
                                }
                                out.print("</select>");
                                out.println("</td><td>");
                                //class
                                bt = stmt.executeQuery(classes);
                                out.print("<select name=\"class-name\">");
                                out.println("<option>Select Your Class</option>");
                                while (bt.next() == true) {
                                    out.println("<option>" + bt.getString("class") + "</option>");
                                }
                                out.print("</select>");
                                //jjsajdjalsdsa
                                out.println("</td></tr><tr></table><br /><br /><table><td>");
                                out.print("Select Type of Booking: <select name=\"duration\" onchange=\"showUser(this.value)\">");
                                out.println("<option>Select Duration</option>");
                                for (int i = 0; i < duration.length; i++) {
                                    out.println("<option>" + duration[i] + "</option>");
                                }
                                out.print("</select>");
                                out.print("</td><td>");
                                out.print("<input type=\"hidden\" name=\"assetvalues\" value=\"" + assetvalues + "\" />");
                                
                                //rs.close();
                                out.println("</td><td><div id=\"txtHint\"></div><td></tr></table></form>");
                                //out.println(assetvalues);
                                ////
                                }
                                out.println("<br /><br /><br /><br /><br /><br /><br /><br />Note: Modification of Booking from Single Day Booking to Mass Booking and vice versa May not Work<br />");
                                out.println("Works fine with same type of booking like Single Day booking from this date to that date or mass booking from this group of date to that group of date will work.");
                                st.close();
                                bt.close();

                            } else {            //rs.close ();

                                stmt.close();
                            }
                        } catch (Exception e) {
                            out.println("<font color=\"red\">Error! </font><a href=\"index.jsp\">Go Home</a>");
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
