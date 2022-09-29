<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 9/29/2022
  Time: 3:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Calculator</title>
</head>
<body>
<h1> Simple Calculator</h1>
<form action="/calculate" method="post">
    <fieldset>
        <legend>Calculator</legend>
        <table>
            <tr>
                <td> First operand</td>
                <td><input name="first-operand" value="${firstOperand}" type="text"></td>
            </tr>
            <tr>
                <td> Operator</td>
                <td>
                    <select name="operator" value="operator">
                        <option value="+">Addition</option>
                        <option value="-">Subtraction</option>
                        <option value="*">Multiplication</option>
                        <option value="/">Division</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td> Second operand</td>
                <td><input name="second-operand" value="${secondOperand}" type="text"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Calculate"></td>
            </tr>
        </table>

    </fieldset>
</form>
<c:if test="${result !=null}">
    <h3>${result}</h3>
</c:if>
</body>
</html>
