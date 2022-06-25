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
                PreparedStatement selectActors = null;
                ResultSet resultSet = null;

                public Actor() {
                    try {
                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                        selectActors = connection.prepareStatement(
                                "SELECT actor_id, first_name, last_name FROM actor");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public ResultSet getActors() {
                    try {
                        resultSet = selectActors.executeQuery();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return resultSet;
                }
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
