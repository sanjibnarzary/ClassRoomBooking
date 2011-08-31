<%-- 
    Document   : index
    Created on : 13 Aug, 2010, 5:27:15 PM
    Author     : Sanjib Narzary
    @email     : o-._.-o@live.com
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="STYLESHEET" href="./private/style.css" type="text/css">
    </head>
    <body>
        <%
                    String myname = (String) session.getAttribute("username");
                    String role1 = (String) session.getAttribute("role");

                    if (myname != null) {
                        out.println("Welcome  " + myname + "! You are logged in as " + role1 + "!  , <a href=\"logout.jsp\" >Logout</a>");
        %>
        <br />
        <% if (role1.equalsIgnoreCase("Head of Department") || role1.equalsIgnoreCase("Time Table In-Charge")) {%>
        <blockquote><br /><br />
            <p align="right"><a href="readme.jsp" title="Click Here to Read Documentation">Help / Readme</a></p>
            <h2>Select Your Options</h2>
            <blockquote>
                <ul>
                    <li><a href="bookingsearch.jsp">Search for Available Time Slots</a> </li><br />
                    <li><a href="bookaroom.jsp">Book A Room</a></li><br /> 
                    <li><a href="cancellation.jsp">Change (Modify) / Cancel Your Booked</a></li><br />
                    <li><a href="viewwaitinglist.jsp">View Status</a></li><br /></ul>
                <blockquote><blockquote><blockquote>
                            <blockquote><blockquote> <blockquote><blockquote><strong>Add / Remove Operation</strong> <br />
                                    <ul>
                                        <li><a href="addroom.jsp">Add Rooms</a></li><br />
                                        <ul> <li><a href="deletearoom.jsp">Delete A Room</a></li></ul><br />
                                        <li><a href="addclass.jsp">Add A Subject</a></li><br />
                                        <ul><li><a href="deleteaclass.jsp">Delete A Subject</a></li></ul><br />
                                        <li><a href="hodadduser.jsp">Add User</a></li><br />
                                        <ul><li><a href="removeuser.jsp">Remove User</a></li></ul>
                                    </ul>
                                </blockquote></blockquote></blockquote></blockquote></blockquote>
                        </blockquote></blockquote>
            </blockquote>


        </blockquote>
        <% } else {
        %>
        <blockquote><br /><br /><p align="right"><a href="readme.jsp" title="Click Here to Read Documentation">Help / Readme</a></p>
            <h2>Select Your Options</h2>
            <ul>
                <li><a href="bookingsearch.jsp">Search for Available Time Slots</a> </li><br />
                <li><a href="bookaroom.jsp">Book A Room</a></li><br />

                <li><a href="cancellation.jsp">Change (Modify) / Cancel Your Booked</a></li><br />
                <li><a href="viewwaitinglist.jsp">View Status</a></li><br />
            </ul>

        </blockquote>
        <br /><br /><br /><br /><br /><br /><br /><br /><br />
        <% }%>
        <%
                            } else {
        %>
        <jsp:forward page="login.jsp" />
        <%                    }
        %>
        <br /><br /><br /><br /><table>
            <font color="grey"><tr><td><font color="grey">&copy; 2010 NIT Calicut, CSE Dept. Online Class Room Booking System. Web Based Application</font><td><td></td></tr><tr><td></td><td align="right"><font color="grey">Sanjib Narzary (M100355CS)</font></td></tr></font>
        </table>
    </body>
</html>
