<%-- 
    Document   : login
    Created on : 13 Aug, 2010, 5:40:42 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
        <link rel="STYLESHEET" href="./private/style.css" type="text/css">
    </head>




    <body>
        
<p align="right"><a href="readme.jsp" title="Click Here to Read Documentation">Help / Readme</a></p>

        <%
                    String myname = (String) session.getAttribute("username");

                    if (myname != null) {
                        out.println("Welcome  " + myname + "  , <a href=\"logout.jsp\" >Logout</a>");
                    } else {
        %>
        <H1 align="center">ONLINE CLASSROOM BOOKING APPLICATION</H1><h3 align="center">LOGIN FORM</h3><br />
        <form action="process.jsp" method="POST">
            <center>  <table align="center">
                    <tr>
                        <td align="left"> Username  : </td><td> <input name="username" size=25 type="text" /> </td>
                    </tr>
                    <tr>
                        <td align="left"> Password  : </td><td> <input name="password" size=25 type="password" /> </td>
                    </tr>
                    <tr><td align="left">Select Your Role:</td><td align="right">
                            <select name="select_role">
                                <option value="Head Of Department">Head of Department</option>
                                <option value="Time Table In-Charge">Time Table In-Charge</option>
                                <option value="Faculty">Faculty</option>
                                <option value="Student">Student</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right"></td>

                        <td align="right"> <input type="reset" value="Reset" /><input type="submit" value="Login" /></td>

                    </tr><br /><br />
                    <tr><td></td><td align="right"><a href="forgot-password.jsp">Forgot password?</a> &nbsp; <a href="register.jsp">Register!</a></td></tr> 
                </table>

            </center>
        </form>
        <%                    }
        %>


    </body>
</html>
