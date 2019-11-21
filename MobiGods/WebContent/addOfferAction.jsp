<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@	page import="java.util.Date"%>
<%@	page import="java.util.Calendar"%>
<%@	page import="java.util.ArrayList"%>
<%@ page import="com.mobigod.beans.CompanyBean"%>
<%@ page import="com.mobigod.beans.LoginBean"%>
<%@ page import="com.mobigod.dao.LoginDAO"%>
<%
String uname = (String) session.getAttribute("uname");
String upass = (String) session.getAttribute("upass");
LoginBean loginBean=new LoginBean();


loginBean.setUname(uname);
loginBean.setUpass(upass);
int c_id=LoginDAO.getCompanyId(loginBean);

String pname=request.getParameter("pname");
int price=Integer.parseInt(request.getParameter("price"));
int offer=Integer.parseInt(request.getParameter("offer"));

int p_id=Integer.parseInt(request.getParameter("id"));

CompanyBean companyBean=new CompanyBean();
companyBean.setP_name(pname);
companyBean.setPrice(price);
companyBean.setOffer(offer);
companyBean.setC_id(c_id);
companyBean.setP_id(p_id);

int i=LoginDAO.addOffer(companyBean);
if(i!=0){
	response.sendRedirect("product.jsp");	
}else{
	out.print("Update Unsuccessfull");
	response.sendRedirect("addOffer.jsp");
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>