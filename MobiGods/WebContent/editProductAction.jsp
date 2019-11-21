<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@	page import="java.util.ArrayList"%>
<%@ page import="com.mobigod.beans.CompanyBean"%>
<%@ page import="com.mobigod.beans.LoginBean"%>
<%@ page import="com.mobigod.dao.LoginDAO"%>
<%
String pname=request.getParameter("pname");
int price=Integer.parseInt(request.getParameter("price"));
String mark=request.getParameter("mark");
int upPrice=Integer.parseInt(request.getParameter("upPrice"));
String uname = (String) session.getAttribute("uname");
String upass = (String) session.getAttribute("upass");
LoginBean loginBean=new LoginBean();


loginBean.setUname(uname);
loginBean.setUpass(upass);
int c_id=LoginDAO.getCompanyId(loginBean);

CompanyBean companyBean=new CompanyBean();
companyBean.setC_id(c_id);
companyBean.setP_name(pname);
companyBean.setPrice(price);
companyBean.setMark(mark);
companyBean.setUp_price(upPrice);

int i=LoginDAO.updateProduct(companyBean);
	response.sendRedirect("product.jsp");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Product Action</title>
</head>
<body>

</body>
</html>