<%-- 
    Document   : index
    Created on : Jun 25, 2022, 12:24:56 PM
    Author     : mafan
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserting Data Into a Database</title>
    </head>
    <body>
        <h1>Inserting Data Into a Database</h1>
        <%!
            public class Actor {

                String URL = "jdbc:mysql://localhost:3306/sakila";
                String USERNAME = "root";
                String PASSWORD = "Moharram98";

                Connection connection = null;
                PreparedStatement insertActors = null;
                ResultSet resultSet = null;

                public Actor() {
                    try {
                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                        insertActors = connection.prepareStatement(
                                "INSERT INTO actor (first_name, last_name, last_update)"
                                + " VALUES (?, ?, ?)");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public int setActors(String first, String last, Timestamp timeStamp) {
                    int result = 0;
                    try {
                        insertActors.setString(1, first);
                        insertActors.setString(2, last);
                        insertActors.setTimestamp(3, timeStamp);
                        result = insertActors.executeUpdate();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return result;
                }
            }
        %>
        <%
            int result = 0;
            
            // This `if` condition is to see if the "submit" button has been pushed, and don't execute the code if not 
            if (request.getParameter("submit") != null) {
                String firstName = new String();
                String lastName = new String();

                if (request.getParameter("first") != null) {
                    firstName = request.getParameter("first");
                }

                if (request.getParameter("last") != null) {
                    lastName = request.getParameter("last");
                }

                Date date = new Date();
                Timestamp timeStamp = new Timestamp(date.getTime());

                Actor actor = new Actor();
                result = actor.setActors(firstName, lastName, timeStamp);
            }
        %>
        <form name="myForm" action="index.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>First Name: </td>
                        <td><input type="text" name="first" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Last Name: </td>
                        <td><input type="text" name="last" value="" size="50" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="submit" name="submit" />
        </form>
    </body>
</html>
