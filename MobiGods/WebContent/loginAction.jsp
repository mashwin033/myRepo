<%-- 
    Document   : Login Action
    Created on : October 30, 2019, 10:43:05 AM
    Author     : Ashwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mobigod.beans.LoginBean" %>
<%@page import="com.mobigod.dao.LoginDAO" %>

<%
	String uname=request.getParameter("uname");
	String upass=request.getParameter("upass");
	
	LoginBean loginbean=new LoginBean();
	loginbean.setUname(uname);
	loginbean.setUpass(upass);
	
	int check=LoginDAO.loginUser(loginbean);
	
	if(check==2){
		session.setAttribute("uname",uname);
		session.setAttribute("upass",upass);
		response.sendRedirect("userProfileAction.jsp");
	}else if(check==1){
		int status=LoginDAO.checkStatus(loginbean);
		session.setAttribute("uname",uname);
		session.setAttribute("upass",upass);
		if(status==1){
		response.sendRedirect("companyProfile.jsp");
		}else{
			response.sendRedirect("companyConfirmation.jsp");
		}
	}else
		response.sendRedirect("index.html");
%>
