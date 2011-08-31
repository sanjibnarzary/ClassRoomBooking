package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class readme_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.apache.jasper.runtime.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.apache.jasper.runtime.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("    \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Readme Help Manual</title>\n");
      out.write("        <link rel=\"STYLESHEET\" href=\"./private/style.css\" type=\"text/css\">\n");
      out.write("    </head>\n");
      out.write("    <body>");

                String myname = (String) session.getAttribute("username");
                String role1 = (String) session.getAttribute("role");

                if (myname != null) {
                    out.println("Welcome  " + myname + "! You are logged in as " + role1 + "!  , <a href=\"logout.jsp\" >Logout</a>");
                } else {
                }
        
      out.write("\n");
      out.write("        <font color=\"grey\">\n");
      out.write("\n");
      out.write("            <p>\n");
      out.write("            <br><center><h1>README<br />DOCUMENTATION</h1></center>\n");
      out.write("            <p align=\"right\">Name: Sanjib Narzary<br />Roll No: M100355CS, Branch: CSE(CS/IS)</p>\n");
      out.write("            <h2>Welcome to <strong>Online Classroom Booking Web Based Application!</strong></h2>\n");
      out.write("            <h3>Topics</h3>\n");
      out.write("            <blockquote>\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"#installtion\">Installation and Configuration</a></li>\n");
      out.write("                    <li><a href=\"#database\">Database Configuration</a></li>\n");
      out.write("                    <ul><li><a href=\"#setting-database\">Setting the Values</a></li></ul>\n");
      out.write("                    <li><a href=\"#deployment\">Deployment</a></li>\n");
      out.write("                    <li><a href=\"#user-role\">User Role</a></li>\n");
      out.write("                    <li><a href=\"#role\">Role Based Access</a></li>\n");
      out.write("                    <li><a href=\"#summary\">Summary</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </blockquote>\n");
      out.write("            <h3 id=\"installation\">Installation and Configuration</h3>\n");
      out.write("            <blockquote>\n");
      out.write("                To Run this project Successfully one should have...\n");
      out.write("                <ul>\n");
      out.write("                    <li>Java 2 SE 1.6 or Higher (Both Runtime and Development)</li>\n");
      out.write("                    <li>Netbeans IDE 6.9 or higher for Development only</li>\n");
      out.write("                    <li>A JVM Enabled Operating System Desktop/Server</li>\n");
      out.write("                    <li>MySQL Server version 5.1 or Higher</li>\n");
      out.write("                    <li>MySQL JDBC Connector J5.1 or Higher for Database Connectivity</li>\n");
      out.write("                    <li>Glassfish 3.0 or Apache Tomcat 5.0 or Higher</li>\n");
      out.write("                    <li>Internet Explorer 8.0 or Mozilla Firefox 3.6.3 or Higher</li>\n");
      out.write("                </ul>\n");
      out.write("            </blockquote>\n");
      out.write("        </p>\n");
      out.write("        <p>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <h3 id=\"database\">Database Configuration</h3>\n");
      out.write("        <blockquote>\n");
      out.write("            There is a <strong>database.properties</strong> file in the parent directory of this project classroom. Open it with any text\n");
      out.write("            editor like (gedit for Linux or Notepad for windows).<br />\n");
      out.write("            There you will find four lines <br />\n");
      out.write("            <ul>\n");
      out.write("                <li>hostport</li>\n");
      out.write("                <li>databasename</li>\n");
      out.write("                <li>dbuser</li>\n");
      out.write("                <li>dbpassword</li>\n");
      out.write("            </ul>\n");
      out.write("            <ul>\n");
      out.write("                <h3 id=\"setting-database\">Setting the Values</h3>\n");
      out.write("                <li><h4>hostport:</h4></li>\n");
      out.write("                Here you need to specify the host name and port number of your mysql database. Suppose\n");
      out.write("                for example your mysql database is on localhost having port number 3206 then you should enter\n");
      out.write("                <strong>hostport=localhost:3206</strong>. If you have no idea what is the port number of mysql\n");
      out.write("                server running on local machine then just put <strong>hostport=localhost</strong>. If the mysql database\n");
      out.write("                server is somewhere like in mysql.nitc.ac.in and running in port 8190 then you should enter\n");
      out.write("                <strong>hostport=mysql.nitc.ac.in:8190</strong>.<br />\n");
      out.write("                Examples: <br /><strong>hostport=localhost:3206</strong> or <strong>hostport=localhost</strong><br />\n");
      out.write("                <strong>hostport=mysql.nitc.ac.in:8190</strong> etc.\n");
      out.write("                <li>\n");
      out.write("                    <h4>databasename:</h4>\n");
      out.write("                </li>\n");
      out.write("                The name of database that we are going to create will be the databasename where we will create lots of tables on there. It should be created\n");
      out.write("                before running this application. Please note that if you create the database remember by which user\n");
      out.write("                of mysql you are creating. To create a database on your localhost machine you must run the mysql server first\n");
      out.write("                and open the terminal generally (Command Prompt for windows and terminal for *nix or *BSD\n");
      out.write("                Systems). After opening terminal type on the terminal <br />\n");
      out.write("                <strong>$mysql -uUSERNAME -pPASSWORD</strong><br />\n");
      out.write("                It will connect to the mysql server..if successfully login then you will get a prompt...<br />\n");
      out.write("                <strong>mysql></strong><br />\n");
      out.write("                Then type the following code on that prompt ..<br />\n");
      out.write("                <strong>mysql>CREATE DATABASE mydatabase;</strong> <br />and then press Enter or Return.\n");
      out.write("                If this command is successfully executed the you will get a message on terminal\n");
      out.write("                <strong>Query OK, 1 row affected (0.00 sec)</strong> <br />example..\n");
      out.write("                <br><strong>mysql> CREATE DATABASE mydatabase;<br />\n");
      out.write("                    Query OK, 1 row affected (0.00 sec)<br>\n");
      out.write("\n");
      out.write("                    mysql> </strong><br />\n");
      out.write("                The mydatabase name will be our property value in <strong>databasename=mydatabase</strong>.\n");
      out.write("                <li>\n");
      out.write("                    <h4>dbuser:</h4>\n");
      out.write("                </li>\n");
      out.write("                This is the user name of the mysql database you have created earlier. Put that user\n");
      out.write("                in this e.g., <strong>dbuser=root</strong>\n");
      out.write("\n");
      out.write("                <li><h4>dbpassword:</h4>\n");
      out.write("                </li>\n");
      out.write("                This is the password field of the database. Put that password in to this field if\n");
      out.write("                there is no password of the database keep it blank e.g., <strong>dbpassword=&nbsp;</strong> for user having\n");
      out.write("                no password and put <strong>dbpassword=password</strong> for the user having password as <strong>password</strong>.\n");
      out.write("\n");
      out.write("            </ul>\n");
      out.write("            <code></code>\n");
      out.write("        </blockquote>\n");
      out.write("        <h3 id=\"deployment\">Deployment:</h3>\n");
      out.write("        <blockquote><h4>If You Did The Above Configuration Then Click Here For Easy Installation. <a href=\"createdb.jsp\">Click Only One Time Here</a></h4>\n");
      out.write("            <br /><br />The following Tables Need To be Created before Using this Application\n");
      out.write("            <br /><br />\n");
      out.write("            For Creating Table for Booking...<br /><br />\n");
      out.write("            <code style=\"color: cadetblue;\">create table time_table ( timing VARCHAR(25), room VARCHAR(25), class VARCHAR(25), user VARCHAR(25), duration VARCHAR(25), available boolean not null default 1, day VARCHAR(25) not null, year VARCHAR(25) not null, session VARCHAR(25) not null, role VARCHAR(25) not null, singledate DATE, bookfrom DATE, bookto DATE );\n");
      out.write("            </code><br /><br />\n");
      out.write("            For Creating table for Users:\n");
      out.write("            <br /><br />\n");
      out.write("            <code style=\"color: cadetblue;\">\n");
      out.write("                create table user\n");
      out.write("                (\n");
      out.write("\tfunctional_role VARCHAR(25) not null,\n");
      out.write("\tpassword VARCHAR(25) not null,\n");
      out.write("\tusername VARCHAR(25) unique not null primary key,\n");
      out.write("\tname VARCHAR(25),\n");
      out.write("\temail VARCHAR(25)\n");
      out.write("                );</code><br /><br />\n");
      out.write("            For Creating Table for rooms\n");
      out.write("\n");
      out.write("            <br /><br /><code style=\"color: cadetblue;\">create table rooms\n");
      out.write("                (\n");
      out.write("\troom VARCHAR(25) unique not null\n");
      out.write("                );</code><br /><br />\n");
      out.write("            Create Table for Waiting list\n");
      out.write("            <br /><br />\n");
      out.write("\n");
      out.write("            <code style=\"color: cadetblue;\">\n");
      out.write("                create table waiting_list ( user_booked_by VARCHAR(25) not null, on_date DATE not null, room VARCHAR(25) not null, timing VARCHAR(25) not null, type_booking VARCHAR(25) not null, datefrom DATE, role VARCHAR(25) not null, duration VARCHAR(25) not null, dateto DATE );\n");
      out.write("\n");
      out.write("\n");
      out.write("            </code>\n");
      out.write("            <br /><br />\n");
      out.write("\n");
      out.write("            Create Table for Subjects\n");
      out.write("            <br /><br />\n");
      out.write("            <code style=\"color: cadetblue;\">\n");
      out.write("                create table classes\n");
      out.write("                (\n");
      out.write("\tclass VARCHAR(25) unique not null\n");
      out.write("                );</code>\n");
      out.write("        </blockquote>\n");
      out.write("        <h3 id=\"user-role\">User Role:</h3>\n");
      out.write("        <blockquote>\n");
      out.write("            <ul>Highest Priority<br />\n");
      out.write("                <li>Head Of Department</li>\n");
      out.write("                <li>Time table In-Charge</li>\n");
      out.write("                <ul><br />Medium Priority<br />\n");
      out.write("                    <li>Faculty</li>\n");
      out.write("                    <ul><br />\n");
      out.write("                        Low Priority<br />\n");
      out.write("                        <li>Student</li>\n");
      out.write("                    </ul>\n");
      out.write("                </ul>\n");
      out.write("            </ul>\n");
      out.write("        </blockquote>\n");
      out.write("\n");
      out.write("        <h3 id=\"role\">Role Based Access:</h3>\n");
      out.write("        <blockquote>\n");
      out.write("            There is a strict access rule in this project. The users having the role as <strong>Head of\n");
      out.write("                Department</strong> and <strong>Time Table In-Charge</strong> have given the same rights\n");
      out.write("            and has got the highest access rights and priority as of users having role <strong>Faculty</strong>\n");
      out.write("            and <strong>Student</strong>. They can modify or delete the records whichever the users having role <strong>Faculty</strong>\n");
      out.write("            and <strong>Student</strong> have booked as well as their same level role users. The users having\n");
      out.write("            the second highest priority i.e., in the role <strong>Faculty</strong> can modify or updates their\n");
      out.write("            lower level as well as their own level role but can not modify or delete their higher level role.\n");
      out.write("            They can view whichever they have booked or which ever the higher level user have booked as well as\n");
      out.write("            viewing, deletion and modification of their lower level user. The users having role <strong>Student</strong>\n");
      out.write("            has got the lowest priority and limited rights. They can modify and delete only their own level and can\n");
      out.write("            only view the status of their higher level users booking status and not other. They can not modify\n");
      out.write("            other than own record.\n");
      out.write("        </blockquote>\n");
      out.write("        <h3 id=\"default-values\">Default Values:</h3>\n");
      out.write("        <blockquote>\n");
      out.write("            On Running the Automatic Database Creation Wizard some default users,subjects and rooms are created these are<br />\n");
      out.write("            <ul>\n");
      out.write("                <li>Users\n");
      out.write("                    <ul><li>Username: hod</li>\n");
      out.write("                        <li>Password: hod</li>\n");
      out.write("                        <li>email:hod.cse@nitc.ac.in</li>\n");
      out.write("                        <li>Name: Head of Dept.</li>\n");
      out.write("                        <li>Role: Head of Department</li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li>Subjects:\n");
      out.write("                    <ul><li>FIS</li></ul>\n");
      out.write("                </li>\n");
      out.write("                <li>Rooms:\n");
      out.write("                    <ul><li>Seminar Hall</li></ul></li>\n");
      out.write("            </ul>\n");
      out.write("            <br />\n");
      out.write("            HOD can add or remove subjects, rooms and users etc. after logging in.\n");
      out.write("        </blockquote>\n");
      out.write("    </p>\n");
      out.write("    <p>\n");
      out.write("        <h3 id=\"summary\">Summary</h3>\n");
      out.write("        <blockquote>\n");
      out.write("            The Complete project is written in JSP(Java Server Pages). Portion of code are from AJAX and SQL.\n");
      out.write("            Thanks for w3schools.com and jsptut.com for tutorial.<br><p align=\"right\">Submitted By: <br />Name: Sanjib Narzary<br />Roll Number: M100355CS<br />E-Mail: ensilage@googlemail.com</p>\n");
      out.write("        </blockquote>\n");
      out.write("        </p>\n");
      out.write("\n");
      out.write("</font>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
