<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.mobigod.beans.CompanyBean"%>
<%@ page import="com.mobigod.dao.LoginDAO"%>
<%
String pname=request.getParameter("pname");
int price=Integer.parseInt(request.getParameter("price"));
String desc=request.getParameter("desc");
int id=Integer.parseInt(request.getParameter("c_id"));

CompanyBean companyBean=new CompanyBean();
companyBean.setP_name(pname);
companyBean.setPrice(price);
companyBean.setDesc(desc);
companyBean.setC_id(id);

LoginDAO.launchProduct(companyBean);
response.sendRedirect("product.jsp");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>