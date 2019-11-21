<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
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
int id=LoginDAO.getCompanyId(loginBean);
%>
<html lang="en">
  <head>
    <title>MobiGods</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
  
  <div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> <!-- .site-mobile-menu -->
    
    
    <div class="site-navbar-wrap">
      
      <div class="site-navbar site-navbar-target js-sticky-header">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-6 col-lg-3">

              <h1 class="my-0 site-logo"><a href="index.html" >MobiGods</a></h1>
            </div>
            <div class="col-6 col-lg-9">
              <nav class="site-navigation text-right" role="navigation">
                <div class="container">

                  <div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3 "><a href="#" class="site-menu-toggle js-menu-toggle text-black">
                    <span class="icon-menu h3"></span>
                  </a></div>

                  <ul class="site-menu main-menu js-clone-nav d-none d-lg-block">
                    <li><a href="product.jsp" class="nav-link">Product</a></li>
                    <li><a href="launchProduct.jsp" class="nav-link">Launch Product</a></li>
                    <li><a href="addOffer.jsp" class="nav-link">Add Offers</a></li>
                    <li><a href="companyReport.jsp" class="nav-link">Report</a></li>
                    <li><a href="logout.jsp" class="nav-link">Logout</a></li>
                    <li><a href="#" class="nav-link"></a></li>
                  </ul>
                </div>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div> <!-- END .site-navbar-wrap -->
    
    <%
		CompanyBean companyBean = new CompanyBean();
		companyBean.setUname(uname);
		companyBean.setC_id(id);
		ArrayList<CompanyBean> cb = LoginDAO.productViewCompany(companyBean);
		int size = 0;
		size = cb.size();
		if (size == 0) {
	%>

      
        
          <h3 align="center">NO DATA TO SHOW</h3>
	<%
		} else {
	%>
	<table width="700" border="0" align="center" bgcolor="white">

		<tr>
			<th align="center">Sl.No</th>

			<th align="center">Product Name</th>

			<th align="center">Price</th>
			
			<th align="center">Offer Price</th>
			
			<th align="center">Add Offer</th>

			<th align="center">MarkUp/Down</th>

			<th align="center">Delete Product</th>


		</tr>
		<%
			int i = 1;
			int update_price=0;
			String up_price="";
				for (CompanyBean it : cb) {
					update_price=it.getUp_price();
					System.out.println("Up"+it.getUp_price());
					if(update_price>0){
					up_price=String.valueOf(it.getUp_price());
					}else if(update_price==0||update_price<0)
						up_price="No offer";
		%>


		<tr>

			<td width="12" height="20" align="center"><span
				style="font-size: 14"><%=i++%></span></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><%=it.getName()%> </span>
				</div></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><%=it.getPrice()%>/-</span>
				</div></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><%=up_price%>/-</span>
				</div></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><p><a
						href="addOffer.jsp?name=<%=it.getName()%>&price=<%=it.getPrice()%>&id=<%=it.getId() %>" class="btn btn-white px-4 py-3">Offer</a></p></span>
				</div></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><p><a
						href="editProduct.jsp?name=<%=it.getName()%>&price=<%=it.getPrice()%>&id=<%=it.getId()%>" class="btn btn-white px-4 py-3">Edit</a></p></span>
				</div></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><p><a
						href="deleteProduct.jsp?name=<%=it.getName()%>&price=<%=it.getPrice()%>&id=<%=it.getId()%>" class="btn btn-white px-4 py-3">Delete</a></p></span>
				</div></td>

		</tr>

		<%
			}
			}
		%>

	</table>

     
    

      

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.sticky.js"></script>
  <script src="js/stickyfill.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/isotope.pkgd.min.js"></script>
  
  <script src="js/jquery.fancybox.min.js"></script>
  <script src="js/main.js"></script>

     
  </body>
</html>