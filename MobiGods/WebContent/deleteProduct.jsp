<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.mobigod.beans.CompanyBean"%>
<%@ page import="com.mobigod.dao.LoginDAO"%>
<%
int id=Integer.parseInt(request.getParameter("id"));
CompanyBean companyBean=new CompanyBean();
companyBean.setId(id);

LoginDAO.deleteProduct(companyBean);
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