<%-- 
    Document   : createdb
    Created on : 21 Aug, 2010, 4:24:43 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Creating Database</title>
    </head>
    <body>
        <%@page import="java.util.*,java.io.*,java.sql.*,java.net.*"  %>
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
        <%
                    Connection con = null;
                    ResultSet rs = null;
                    try {

                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        String conn = "jdbc:mysql://" + hostport + "/" + databasename + "";
                        con = DriverManager.getConnection(conn, "" + dbuser + "", "" + dbpassword + "");
                        Statement stmt = con.createStatement();
                        String ct = "create table if not exists time_table (id INT not null AUTO_INCREMENT primary key,timing VARCHAR(25),room VARCHAR(25),class VARCHAR(25),user VARCHAR(25),duration VARCHAR(25),available boolean default 1,day VARCHAR(25) not null,year VARCHAR(25) not null,session VARCHAR(25) not null,role VARCHAR(25) not null,singledate DATE,bookfrom DATE,bookto DATE)";
                        String wt = "create table if not exists waiting_list (user_booked_by VARCHAR(25) not null,on_date DATE not null,room VARCHAR(25) not null,timing VARCHAR(25) not null,type_booking VARCHAR(25) not null,datefrom DATE,role VARCHAR(25) not null,duration VARCHAR(25) not null,dateto DATE)";
                        String cu="  create table if not exists user ( functional_role VARCHAR(25) not null, password VARCHAR(25) not null, username VARCHAR(25) unique not null primary key, name VARCHAR(25), email VARCHAR(25) )";
                        String cr="create table if not exists rooms ( room VARCHAR(25) unique not null )";
                        String cs="  create table if not exists classes ( class VARCHAR(25) unique not null )  ";
                        String ii[]=new String[3];
                         ii[0]="insert into user values('Head of Department','hod','hod','Head of Dept','hod.cse@nitc.ac.in')";
                         ii[1]="insert into classes values('FIS')";
                         ii[2]="insert into rooms values('Seminar Hall')";
                        
                        if (!con.isClosed()) {
                            int i = stmt.executeUpdate(ct);
                            int j = stmt.executeUpdate(wt);
                            int k=stmt.executeUpdate(cu);
                            int l=stmt.executeUpdate(cr);
                            int m=stmt.executeUpdate(cs);
                        }
                         out.println("<center>");
                         for(int o=0;o<ii.length;o++){
                            stmt.executeUpdate(ii[o]);
                            out.println("<br />Data Inserted using Command: "+ii[o]);
                         }
                         out.println("<h1><a href=\"index.jsp\" style=\"text-decoration:none\">Go to Home for Booking!</h1><br /><font color=\"red\">Waring! Don not Run This page Again! Else Duplicate Data will store!</center>");

                    } catch (Exception e) {
                        out.print(e);
                    }
        %>
       
    </body>
</html>
