<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@	page import="java.util.ArrayList"  %>
<%
	String uname=(String)session.getAttribute("uname");
	String upass=(String)session.getAttribute("upass");
	if(uname==null){
		response.sendRedirect("index.html");
	}
%>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald:400,700|Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
  
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/jquery.fancybox.min.css">
    

    <link rel="stylesheet" href="css/style.css">

</head>
<body>
<h1>Welcome <% out.print(upass); %></h1>
<a href="userView.jsp">USER&nbsp;</a>
<a href="feedbackView.jsp">FEEDBACK&nbsp;</a>
<a href="messageAdmin.jsp">MESSAGE&nbsp;</a>
<a href="logoutAction.jsp">LOGOUT</a>
</body>
</html>