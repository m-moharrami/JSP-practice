<%-- 
    Document   : index
    Created on : Jun 25, 2022, 12:24:56 PM
    Author     : mafan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserting Data Into a Database</title>
    </head>
    <body>
        <h1>Inserting Data Into a Database</h1>
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
