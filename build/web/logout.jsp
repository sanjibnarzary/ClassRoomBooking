<%-- 
    Document   : logout
    Created on : 13 Aug, 2010, 5:41:46 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
        <link rel="STYLESHEET" href="./private/style.css" type="text/css">
    </head>
    <body>
        <%

                    String username = (String) session.getAttribute("username");
                    //String role1=(String) session.getAttribute("role1");
                    if (username != null) {
                        out.println(username + " loged out, <a href=\"index.jsp\">Back</a>");
                        session.removeAttribute("username");
                        session.removeAttribute("role");

                    } else {
                        out.println("You are already not login <a href=\"index.jsp\">Back</a>");
                    }
        %>
    </body>
</html>
