<%-- 
    Document   : readme
    Created on : 16 Aug, 2010, 5:50:46 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Readme Help Manual</title>
        <link rel="STYLESHEET" href="./private/style.css" type="text/css">
    </head>
    <body><%
                String myname = (String) session.getAttribute("username");
                String role1 = (String) session.getAttribute("role");

                if (myname != null) {
                    out.println("Welcome  " + myname + "! You are logged in as " + role1 + "!  , <a href=\"logout.jsp\" >Logout</a>");
                } else {
                }
        %>
        <font color="grey">

            <p>
            <br><center><h1>README<br />DOCUMENTATION</h1></center>
            <p align="right">Name: Sanjib Narzary<br />Roll No: M100355CS, Branch: CSE(CS/IS)</p>
            <h2>Welcome to <strong>Online Classroom Booking Web Based Application!</strong></h2>
            <h3>Topics</h3>
            <blockquote>
                <ul>
                    <li><a href="#installtion">Installation and Configuration</a></li>
                    <li><a href="#database">Database Configuration</a></li>
                    <ul><li><a href="#setting-database">Setting the Values</a></li></ul>
                    <li><a href="#deployment">Deployment</a></li>
                    <li><a href="#user-role">User Role</a></li>
                    <li><a href="#role">Role Based Access</a></li>
                    <li><a href="#summary">Summary</a></li>
                </ul>
            </blockquote>
            <h3 id="installation">Installation and Configuration</h3>
            <blockquote>
                To Run this project Successfully one should have...
                <ul>
                    <li>Java 2 SE 1.6 or Higher (Both Runtime and Development)</li>
                    <li>Netbeans IDE 6.9 or higher for Development only</li>
                    <li>A JVM Enabled Operating System Desktop/Server</li>
                    <li>MySQL Server version 5.1 or Higher</li>
                    <li>MySQL JDBC Connector J5.1 or Higher for Database Connectivity</li>
                    <li>Glassfish 3.0 or Apache Tomcat 5.0 or Higher</li>
                    <li>Internet Explorer 8.0 or Mozilla Firefox 3.6.3 or Higher</li>
                </ul>
            </blockquote>
        </p>
        <p>


        <h3 id="database">Database Configuration</h3>
        <blockquote>
            There is a <strong>database.properties</strong> file in the parent directory of this project classroom. Open it with any text
            editor like (gedit for Linux or Notepad for windows).<br />
            There you will find four lines <br />
            <ul>
                <li>hostport</li>
                <li>databasename</li>
                <li>dbuser</li>
                <li>dbpassword</li>
            </ul>
            <ul>
                <h3 id="setting-database">Setting the Values</h3>
                <li><h4>hostport:</h4></li>
                Here you need to specify the host name and port number of your mysql database. Suppose
                for example your mysql database is on localhost having port number 3206 then you should enter
                <strong>hostport=localhost:3206</strong>. If you have no idea what is the port number of mysql
                server running on local machine then just put <strong>hostport=localhost</strong>. If the mysql database
                server is somewhere like in mysql.nitc.ac.in and running in port 8190 then you should enter
                <strong>hostport=mysql.nitc.ac.in:8190</strong>.<br />
                Examples: <br /><strong>hostport=localhost:3206</strong> or <strong>hostport=localhost</strong><br />
                <strong>hostport=mysql.nitc.ac.in:8190</strong> etc.
                <li>
                    <h4>databasename:</h4>
                </li>
                The name of database that we are going to create will be the databasename where we will create lots of tables on there. It should be created
                before running this application. Please note that if you create the database remember by which user
                of mysql you are creating. To create a database on your localhost machine you must run the mysql server first
                and open the terminal generally (Command Prompt for windows and terminal for *nix or *BSD
                Systems). After opening terminal type on the terminal <br />
                <strong>$mysql -uUSERNAME -pPASSWORD</strong><br />
                It will connect to the mysql server..if successfully login then you will get a prompt...<br />
                <strong>mysql></strong><br />
                Then type the following code on that prompt ..<br />
                <strong>mysql>CREATE DATABASE mydatabase;</strong> <br />and then press Enter or Return.
                If this command is successfully executed the you will get a message on terminal
                <strong>Query OK, 1 row affected (0.00 sec)</strong> <br />example..
                <br><strong>mysql> CREATE DATABASE mydatabase;<br />
                    Query OK, 1 row affected (0.00 sec)<br>

                    mysql> </strong><br />
                The mydatabase name will be our property value in <strong>databasename=mydatabase</strong>.
                <li>
                    <h4>dbuser:</h4>
                </li>
                This is the user name of the mysql database you have created earlier. Put that user
                in this e.g., <strong>dbuser=root</strong>

                <li><h4>dbpassword:</h4>
                </li>
                This is the password field of the database. Put that password in to this field if
                there is no password of the database keep it blank e.g., <strong>dbpassword=&nbsp;</strong> for user having
                no password and put <strong>dbpassword=password</strong> for the user having password as <strong>password</strong>.

            </ul>
            <code></code>
        </blockquote>
        <h3 id="deployment">Deployment:</h3>
        <blockquote><h4>If You Did The Above Configuration Then Click Here For Easy Installation. <a href="createdb.jsp">Click Only One Time Here</a></h4>
            <br /><br />The following Tables Need To be Created before Using this Application
            <br /><br />
            For Creating Table for Booking...<br /><br />
            <code style="color: cadetblue;">create table time_table ( timing VARCHAR(25), room VARCHAR(25), class VARCHAR(25), user VARCHAR(25), duration VARCHAR(25), available boolean not null default 1, day VARCHAR(25) not null, year VARCHAR(25) not null, session VARCHAR(25) not null, role VARCHAR(25) not null, singledate DATE, bookfrom DATE, bookto DATE );
            </code><br /><br />
            For Creating table for Users:
            <br /><br />
            <code style="color: cadetblue;">
                create table user
                (
	functional_role VARCHAR(25) not null,
	password VARCHAR(25) not null,
	username VARCHAR(25) unique not null primary key,
	name VARCHAR(25),
	email VARCHAR(25)
                );</code><br /><br />
            For Creating Table for rooms

            <br /><br /><code style="color: cadetblue;">create table rooms
                (
	room VARCHAR(25) unique not null
                );</code><br /><br />
            Create Table for Waiting list
            <br /><br />

            <code style="color: cadetblue;">
                create table waiting_list ( user_booked_by VARCHAR(25) not null, on_date DATE not null, room VARCHAR(25) not null, timing VARCHAR(25) not null, type_booking VARCHAR(25) not null, datefrom DATE, role VARCHAR(25) not null, duration VARCHAR(25) not null, dateto DATE );


            </code>
            <br /><br />

            Create Table for Subjects
            <br /><br />
            <code style="color: cadetblue;">
                create table classes
                (
	class VARCHAR(25) unique not null
                );</code>
        </blockquote>
        <h3 id="user-role">User Role:</h3>
        <blockquote>
            <ul>Highest Priority<br />
                <li>Head Of Department</li>
                <li>Time table In-Charge</li>
                <ul><br />Medium Priority<br />
                    <li>Faculty</li>
                    <ul><br />
                        Low Priority<br />
                        <li>Student</li>
                    </ul>
                </ul>
            </ul>
        </blockquote>

        <h3 id="role">Role Based Access:</h3>
        <blockquote>
            There is a strict access rule in this project. The users having the role as <strong>Head of
                Department</strong> and <strong>Time Table In-Charge</strong> have given the same rights
            and has got the highest access rights and priority as of users having role <strong>Faculty</strong>
            and <strong>Student</strong>. They can modify or delete the records whichever the users having role <strong>Faculty</strong>
            and <strong>Student</strong> have booked as well as their same level role users. The users having
            the second highest priority i.e., in the role <strong>Faculty</strong> can modify or updates their
            lower level as well as their own level role but can not modify or delete their higher level role.
            They can view whichever they have booked or which ever the higher level user have booked as well as
            viewing, deletion and modification of their lower level user. The users having role <strong>Student</strong>
            has got the lowest priority and limited rights. They can modify and delete only their own level and can
            only view the status of their higher level users booking status and not other. They can not modify
            other than own record.
        </blockquote>
        <h3 id="default-values">Default Values:</h3>
        <blockquote>
            On Running the Automatic Database Creation Wizard some default users,subjects and rooms are created these are<br />
            <ul>
                <li>Users
                    <ul><li>Username: hod</li>
                        <li>Password: hod</li>
                        <li>email:hod.cse@nitc.ac.in</li>
                        <li>Name: Head of Dept.</li>
                        <li>Role: Head of Department</li>
                    </ul>
                </li>
                <li>Subjects:
                    <ul><li>FIS</li></ul>
                </li>
                <li>Rooms:
                    <ul><li>Seminar Hall</li></ul></li>
            </ul>
            <br />
            HOD can add or remove subjects, rooms and users etc. after logging in.
        </blockquote>
    </p>
    <p>
        <h3 id="summary">Summary</h3>
        <blockquote>
            The Complete project is written in JSP(Java Server Pages). Portion of code are from AJAX and SQL.
            Thanks for w3schools.com and jsptut.com for tutorial.<br><p align="right">Submitted By: <br />Name: Sanjib Narzary<br />Roll Number: M100355CS<br />E-Mail: ensilage@googlemail.com</p>
        </blockquote>
        </p>

</font>
</body>
</html>
