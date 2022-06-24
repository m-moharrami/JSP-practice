<%-- 
    Document   : index
    Created on : Jun 24, 2022, 5:12:40 PM
    Author     : mafan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using Forms</title>
    </head>
    <body>
        <h1>Using Forms</h1>
        <form name="myForm" action="display.jsp" method="POST">
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
                    <tr>
                        <td>Email Address: </td>
                        <td><input type="text" name="email" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Gender: </td>
                        <td><select name="gender">
                                <option>Male</option>
                                <option>Female</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Date of Birth: </td>
                        <td><input type="text" name="dob" value="DD/MM/YYYY" size="15" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="Submit" name="submit" />
        </form>
    </body>
</html>
