<%--
    Document   : bookaroom
    Created on : 15 Aug, 2010, 5:03:28 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking a Room</title>
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
                xmlhttp.open("GET","months_1.jsp?duration="+str,true);
                xmlhttp.send();
            }
        </script>
    </head>
    <body>
        <h3><a href="index.jsp">Home</a>&nbsp;Search for Availability!</h3>
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

        <form action="bookingsearchprogress.jsp" method="POST">
            <h3>To Search for Availability You need to Select:</h3><br />

            <p align="right"><a href="viewwaitinglist.jsp">View Waiting List</a></p>
            <%
                        Connection con = null;
                        try {
                            /* "01", "02", "03"," 04","05","06","07","08","09","10","11","12","13","14","15",
                            "17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","--------------", "One Week", "Two Weeks", "Three Weeks",
                            "Four Weeks", "--------------"*/

                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            String conn = "jdbc:mysql://" + hostport + "/" + databasename + "";
                            con = DriverManager.getConnection(conn, "" + dbuser + "", "" + dbpassword + "");
                            String[] duration = {"--------------", "Single Day", "--------------", "Mass Booking", "--------------", "One Month", "--------------", "Entire Semester", "Entire Year"
                            };
                            String[] timing = {"8AM-9AM", "9AM-10AM", "10:15AM-11:15AM", "11:15AM-12:15AM", "1PM-2PM", "2PM-3PM", "3PM-5PM"};

                            Statement stmt = con.createStatement();
                            ResultSet st = null, bt = null;
                            if (!con.isClosed()) {
                                //String add = "select * from timetable"; //where username='" + username + "' AND password='" + password + "'";
                                String room = "select * from rooms";
                                String classes = "select * from classes";
                                out.println("<br /><table><tr><td></td><td>&nbsp;&nbsp;Select Timing</td><td>&nbsp;&nbsp;Select Room</td>"
                                        + "<td>&nbsp;&nbsp;Select Subject</td><td></td></tr>" + "");
                                out.print("<tr><td>Select Your Choice:</td><td>");

                                //rs = stmt.executeQuery(add);

                                out.print("<select name=\"timing\">");
                                out.println("<option>All of The Time</option>");
                                /*while (rs.next() == true) {
                                out.println("<option>" + rs.getString("daytime") + "</option>");
                                }*/
                                for (int j = 0; j < timing.length; j++) {
                                    out.println("<option>" + timing[j] + "</option>");
                                }
                                out.print("</select></td>");
                                //for room
                                out.println("<td>");
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
                                out.println("<option>Select The Subject</option>");
                                while (bt.next() == true) {
                                    out.println("<option>" + bt.getString("class") + "</option>");
                                }
                                out.print("</select>");
                                //
                                out.println("</td></tr></table><br>");
                                out.print("<table><tr><td>Duration:</td><td> <select name=\"duration\" onchange=\"showUser(this.value)\">");
                                out.println("<option>Select Duration</option>");
                                for (int i = 0; i < duration.length; i++) {
                                    out.println("<option>" + duration[i] + "</option>");
                                }
                                out.print("</select></td><td>");
                                out.print("<div id=\"txtHint\"></div></td><td><div></div></td></tr></table>");
                                //out.print("<p align=\"right\"><input type=\"submit\" value=\"Book Now!\" /></p>");
                                //rs.close();
                                out.println("");
                                st.close();
                                bt.close();
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

            %>
        </form>
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

       
    </body>
</html>
