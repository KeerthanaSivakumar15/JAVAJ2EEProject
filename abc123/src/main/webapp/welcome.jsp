<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.text.*" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Insert & Update</title>
<style>
#output
{
height:200px;
width:80%;
border:2px solid red;
text-align:center;
background-color:#8ef788;
margin:auto;
}
</style>
</head>
<body>

<%

    String FirstName = request.getParameter("FirstName");
    String LastName = request.getParameter("LastName");
    String Age = request.getParameter("Age");
    String PhoneNumber = request.getParameter("PhoneNumber");
    String join_date_str = request.getParameter("join_date");

    
%>
<c:set var="FirstName" value="<%=FirstName%>" />
<c:set var="LastName" value="<%=LastName%>" />
<c:set var="Age" value="<%=Age%>" />
<c:set var="PhoneNumber" value="<%=PhoneNumber%>" />
<c:set var="join_date" value="<%=join_date_str%>" />

<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" 
    url="jdbc:mysql://localhost:3307/my-scheme" 
    user="root" password="Rajesh@23" />

<sql:update dataSource="${myDB}" var="insert">
    INSERT INTO employees(FirstName, LastName, Age, PhoneNumber, join_date)
    VALUES (?, ?, ?, ?, ?)
    <sql:param value="${FirstName}" />
    <sql:param value="${LastName}" />
    <sql:param value="${Age}" />
    <sql:param value="${PhoneNumber}" />
    <sql:param value="${join_date}" />
</sql:update>

<h1>Record inserted successfully!</h1>


</body>
</html>
