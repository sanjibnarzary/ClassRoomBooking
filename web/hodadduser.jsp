<%-- 
    Document   : register
    Created on : 13 Aug, 2010, 9:05:09 PM
    Author     : Sanjib Narzary
    Email      : o-._.-o@live.com
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="STYLESHEET" href="./private/style.css" type="text/css">

    </head>
    <body>
        <%
                    String myname = (String) session.getAttribute("username");
                    String role = (String) session.getAttribute("role");
                    if (!(myname==null)&&(role.equalsIgnoreCase("Head of Department") || role.equalsIgnoreCase("Time Table Incharge"))) {
                        out.println("Welcome  " + myname + " You are logged in as " + role + " , <a href=\"logout.jsp\" >Logout</a>");

        %>
        <h1 align="center"><a href="index.jsp" style="text-decoration:none">Online Classroom Booking Center!</a></h1>
        <h2>Registration Form</h2>
        <form action="add.jsp" method="POST">
            <table>

                <tr><td>Name:</td><td><input type="text" name="name" size="25"></td></tr>
                <tr><td>
                        Username: </td><td><input type="text" name="username" size="25" /><td><tr>
                <tr><td>
                        Password:</td><td> <input type="password" name="password" size="25"></td><tr>               
                <tr><td >Select Your Role:</td><td align="right">
                        <select name="select_role">
                            <option value="Head Of Department">Head of Department</option>
                            <option value="Time Table In-Charge">Time Table In-Charge</option>
                            <option value="Faculty">Faculty</option>
                            <option value="Student">Student</option>
                        </select>
                    </td>
                </tr>
                <tr><td>Email:</td><td><input type="text" name="email" size="25" /></td></tr>
                <tr><td></td><td><input type="reset" value="   Clear   " size="10" /> &nbsp;<input type="submit" value="Add User" size="10" /></td></tr>

            </table>
        </form>
        <%                    } else {
                                out.println("<h2>Not Permission here </h2><br /><a href=\"index.jsp\">Home</a>");
                                }
        %>

    </body>
</html>
