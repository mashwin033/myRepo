<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- 
    Document   : SignUp Action
    Created on : 11-12-2019, 2019, 10:51:05 PM
    Author     : ARCHA LAL
--%>

<%@page import="com.mobigod.beans.LoginBean" %>
<%@page import="com.mobigod.dao.LoginDAO" %>


<%
    String cname=request.getParameter("cname");
	String chq=request.getParameter("chq");
	String upass=request.getParameter("upass");
	String mob=request.getParameter("mob");
    String email=request.getParameter("email");
 	LoginBean loginBean=new LoginBean();
    loginBean.setCname(cname);
    loginBean.setChq(chq);
    loginBean.setUpass(upass);
    loginBean.setPhone(mob);
    loginBean.setEmail(email);
    
    int flag=LoginDAO.insertCompany(loginBean);
    if(flag!=0){
    	response.sendRedirect("companyConfirmation.jsp");
    }else{
    	response.sendRedirect("signup.jsp");
    }
    
  %>