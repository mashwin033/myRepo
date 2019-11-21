<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.html"></jsp:include>
<html lang="en">
<head>
<jsp:include page="FormFile.html"></jsp:include>
</head>
<body>
	<div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo">
		<div class="wrapper wrapper--w680">
			<div class="card card-1">
				
				<div class="card-body">
					<h2 class="title">Registration Info</h2>
					<form method="POST" action="companyRegisterAction.jsp">
						
						<div class="row row-space">
							<div class="col-6">
								<div class="input-group">
									<input class="input--style-1" type="text" placeholder="COMPANY NAME" name="cname">
								</div>
							</div>
							<div class="col-6">
								<div class="input-group">
									<input class="input--style-1" type="text" placeholder="COMPANY HEADQUARTERS" name="chq">
								</div>
							</div>
							
						<div class="col-6">
							<div class="input-group">
							<input class="input--style-1" type="text" placeholder="EMAIL/USERNAME" name="email">
							</div>
						</div>
						<div class="col-6">
							<div class="input-group">
							<input class="input--style-1" type="password" placeholder="PASSWORD" name="upass">
							</div>
						</div>
						<div class="col-12">
							<div class="input-group">
							<input class="input--style-1" type="text" placeholder="PHONE NUMBER" name="mob">
							</div>
						</div>
						<div class="p-t-20">
							<button class="btn btn--radius btn--green" type="submit">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
