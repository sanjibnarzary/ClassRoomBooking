<%-- 
    Document   : addclass
    Created on : 15 Aug, 2010, 5:40:35 PM
    Author     : Sanjib Narzary
    Email      : o-._.-o@live.com
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a Class</title>
        <link rel="STYLESHEET" href="./private/style.css" type="text/css">
    </head>
    <body>
        <%
                    String myname = (String) session.getAttribute("username");
                    String role1 = (String) session.getAttribute("role");

                    if (!(role1.equalsIgnoreCase("Student"))) {
                        out.println("Welcome  " + myname + "! You are logged in as " + role1 + "!  , <a href=\"logout.jsp\" >Logout</a>");
        %>
        <h1>Add A Subject</h1>
        <form action="addclassrocess.jsp" method="POST">
            <table><tr><td>Subject Name:</td><td><input type="text" size="25" name="classname" /></td><td><input type="submit" value="Add Class" /></td></tr>

            </table>
        </form>
         <%
        }
        else{
            out.println("<center><h1><font color=\"red\">Limited Access!</h1></font>&nbsp <h3>back to go <a href=\"index.jsp\">Home</a></h3></center>");
        }
        %>
    </body>
</html>
