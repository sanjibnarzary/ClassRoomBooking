/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author root
 */
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class mySQLconnectionTest {

    public static void main(String args[]) {
        Connection con = null;
        Statement stmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost/users",
                    "root", "abc@123");
            stmt = con.createStatement();
            ResultSet rs = null;
            if (!con.isClosed()) {
                String str = "select * from user";// where username=\"sanjib\" ";
                rs=stmt.executeQuery(str);
                while(rs.next()==true){
                    System.out.println("Name"+rs.getString("username"));
                }
                System.out.println("Successfully connected to "
                        + "MySQL server using TCP/IP...");
            }

        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        } finally {
            try {
                if (con != null) {
                    stmt.close();
                    con.close();
                }
            } catch (SQLException e) {
            }
        }
    }
}
