<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Flight Add Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">

</head>
<body>
<h1>Pilot Add Form</h1>
	<form action="/pilot/addPilot"  method="post" name="frm" class="container">
		<div>
			<label for="piFirstName">Pilot First Name</label> 
			<input type="text"	name="piFirstName" length=15 required/>
		</div>

		<div>
			<label for="piLastName">Pilot Last Name</label> 
			<input type="text"	name="piLastName" length=15 required/>
		</div>

		<div>
			<label for="piEmail">Pilot Email</label> 
			<input type="email"	name="piEmail" length=20 required/>
		</div>
<!--  ToDo = Checking on existing eMail allredy -->

		<div>
			<label for="piPw">Pilot Login Password</label> 
			<input type="password"	name="piPw" length=20 required/>
		</div>

		<div>
			<label for="piPhone">Pilot Phone No.</label> 
			<input type="text"	name="piPhone" length=15 />
		</div>

		<input type="submit" value="New" name="frm" /> <a href="/">Cancel</a>
	</form>
</body>
</html>
