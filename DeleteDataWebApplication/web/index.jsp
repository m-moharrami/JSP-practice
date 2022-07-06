<%-- 
    Document   : index
    Created on : Jul 5, 2022, 6:29:38 PM
    Author     : mafan
--%>

<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deleting Data From A DataBase</title>
    </head>
    <body onLoad="displayResults()">
        <h1>Deleting Data From A DataBase</h1>
        <%!
            public class Actor {

                String URL = "jdbc:mysql://localhost:3306/sakila";
                String USERNAME = "root";
                String PASSWORD = "Moharram98";

                Connection connection = null;
                PreparedStatement selectActors = null;
                PreparedStatement deleteActor = null;
                ResultSet resultSet = null;

                public Actor() {
                    try {
                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        selectActors = connection.prepareStatement(
                                "SELECT actor_id, first_name, last_name FROM actor");

                        deleteActor = connection.prepareStatement(
                                "DELETE FROM actor WHERE actor_id = ?");
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

                public int deleteActor(Integer id) {
                    int result = 0;
                    try {
                        deleteActor.setInt(1, id);
                        result = deleteActor.executeUpdate();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }

                    return result;
                }
            }
        %>
        <%
            int result = 0;

            Actor actor = new Actor();
            ResultSet actors = actor.getActors();

            Integer actorId = new Integer(0);

            if (request.getParameter("submit") != null) {
                actorId = Integer.parseInt(request.getParameter("actor"));
                result = actor.deleteActor(actorId);
            }
        %>
        <form name="myForm" action="index.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Actor Name: </td>
                        <td><select name="actor">
                                <% while (actors.next()) {%>
                                <option value="<%= actors.getInt("actor_id")%>"><%= actors.getString("first_name")%> <%= actors.getString("last_name")%></option>
                                <% }%>
                            </select></td>
                    </tr>
                </tbody>
            </table>
            <input type="hidden" name="hidden" value="<%= result%>" />
            <input type="submit" value="Submit" name="submit" />
        </form>
        <script>
            function displayResults() {
                if (document.myForm.hidden.value === 1) {
                    alert("Data Deleted!");
                }
            }
        </script>
    </body>
</html>