<%-- 
    Document   : months
    Created on : 18 Aug, 2010, 5:07:16 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Months and Days May not Run Directly</title>

    </head>
    <body>
        <%
                    String str = request.getParameter("duration");
                    String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
                    String[] days={"Monday","Tuesday","Wednesday","Thursday","Friday","All The Days"};
                    try {
                        if (str.equalsIgnoreCase("Entire Semester")) {
                            out.println(" Session: <select name=\"session\"><option>Monsoon</option><option>Summer</option></select>"
                                    + " Year: <select name=\"year\"><option>2010</option><option>2011</option><option>2012</option><option>2013</option><option>2014</option></select>");
                            out.println(" Which Day: <select name=\"day\">");
                            for(int j=0;j<days.length;j++){
                                out.println("<option>"+days[j]+"</option>");
                            }
                            out.println("</select>");
                            out.println("<input type=\"submit\" value=\"Search for Availability!\" />");
                        } else if (str.equalsIgnoreCase("Entire Year")) {
                            out.println(" Year: <select name=\"year\"><option>2010</option><option>2011</option>"
                                    + "<option>2012</option><option>2013</option><option>2014</option></select>");
                            out.println(" Which Day: <select name=\"day\">");
                            for(int j=0;j<days.length;j++){
                                out.println("<option>"+days[j]+"</option>");
                            }
                            out.println("</select>");
                            out.println("<input type=\"submit\" value=\"Search for Availability!\" />");
                        } /*else if (str.equalsIgnoreCase("One Month")) {
                            out.println("Month: <select name=\"month\">");
                            for (int i = 0; i < months.length; i++) {
                                out.println("<option>" + months[i] + "<option>");
                            }
                            out.println("</select>"
                                    + " Year: <select name=\"year\"><option>2010</option><option>2011</option><option>2012</option><option>2013</option><option>2014</option></select>");
                            out.println(" Which Day: <select name=\"day\">");
                            for(int j=0;j<days.length;j++){
                                out.println("<option>"+days[j]+"</option>");
                            }
                            out.println("</select>");
                            out.println("<input type=\"submit\" value=\"Book Now!\" />");
                        } *//* else if(str.equalsIgnoreCase("One Week")){

                        }
                        else if(str.equalsIgnoreCase("Two Weeks")){}
                        else if(str.equalsIgnoreCase("Three Weeks")){}
                        else if(str.equalsIgnoreCase("Four Weeks")){}*/
                        else if (str.equalsIgnoreCase("Single Day")) {
                            // out.println("<select name=\"month\">");
                            out.println(" Enter: <input type=\"text\" size=\"10\" name=\"singledate\"/>(YYYY-MM-DD)");
                            out.println(" Which Day: <select name=\"day\">");
                            for(int j=0;j<days.length;j++){
                                out.println("<option>"+days[j]+"</option>");
                            }
                            out.println("</select>");
                            out.println("<input type=\"submit\" value=\"Search for Availability!\" />");
                            //out.println("</select>");
                        } else if (str.equalsIgnoreCase("Mass Booking")||str.equalsIgnoreCase("One Month")) {
                            out.println("<table><tr>&nbsp;&nbsp;&nbsp;<td>From:</td><td align=\"right\"> <input type=\"text\" size=\"10\" name=\"bookfrom\"/>(YYYY-MM-DD)<br />");
                            out.println("<tr>&nbsp;&nbsp;&nbsp;<td></td><td></td><td><td>");
                            out.println(" Which Day: <select name=\"day\">");
                            for(int j=0;j<days.length;j++){
                                out.println("<option>"+days[j]+"</option>");
                            }
                            out.println("</select>");
                            out.println("</td>&nbsp;&nbsp;&nbsp;<input type=\"submit\" value=\"Search for Availability!\" /></td></td>");
                            out.println("<tr>&nbsp;&nbsp;&nbsp;<td>To:</td> <td align=\"right\"><input type=\"text\" size=\"10\" name=\"bookto\"/>(YYYY-MM-DD)</td></tr></table>");
                            out.println("&nbsp;&nbsp;&nbsp;");
                        }
                        else{
                            out.println("<----- || Select Atleast One Option..!");
                        }
                    } catch (Exception e) {
                        out.println(e);
                    }
        %>
    </body>
</html>
