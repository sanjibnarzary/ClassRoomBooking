<%-- 
    Document   : forgot-password
    Created on : 16 Aug, 2010, 8:39:19 PM
    Author     : Sanjib Narzary
    Email      : o-._.-o@live.com
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="STYLESHEET" href="./private/style.css" type="text/css">
        <title>Forgot Password</title>
    </head>
    <body><center>
        <h1>Forgot Password!</h1>
        <form action="forgot-password-process.jsp" method="post">
            <table><tr>
                    <td>Your Username:</td><td align="right"><input type="text" name="username" /></td></tr>
                <tr><td>Your Email:</td><td align="right"><input type="text" name="email" /></td><tr>
                <tr><td></td><td align="right"><input type="submit" value="Request Password!" /></td></tr>
                </table>
        </form>
        </center>
    </body>
</html>
