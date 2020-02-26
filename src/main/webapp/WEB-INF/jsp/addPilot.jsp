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

	<form action="/pilot/addPilot"  method="post" name="frm" class="container-fluid">
		<div class="row col-lg-4 table-responsive">
		<table class="table">
		<tr>
			<td><label class="col-1" for="piFirstName">Pilot First Name</label> 
			<td><input type="text"	name="piFirstName" length=15 required/>
		</tr>

		<tr>
			<td><label class="col-1" for="piLastName">Pilot Last Name</label> 
			<td><input class="col-2" type="text"	name="piLastName" length=15 required/>
		</tr>

		<tr>
			<td><label class="col-1" for="piEmail">Pilot Email</label> 
			<td><input class="col-2" type="email"	name="piEmail" length=20 required/>
		</tr>
<!--  ToDo = Checking on existing eMail allredy -->

		<tr>
			<td><label class="col-1" for="piPhone">Pilot Phone No.</label> 
			<td><input class="col-2" type="text"	name="piPhone" length=15 />
		</tr>
		</table>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

		<input type="submit" class="btn btn-lg btn-primary btn-block" value="New" name="frm" />
		</div>
	</form>
	<br><br>
	<div class="conteiner-fluid">
	<div class="center-block well">

	<h1>Explain how to use</h1>
	<h3>
	Please fill up all the Pilot details. <br>
	If you have your own PPC or you add a new PPC for group that owner one PPC.<br>
	You have first to, add a new PPC in the PPS service.<br>
	Now you can Logbook your flights - In the Flights Service.<br>
	In order to add more Pilots to the PPC - enter the Owner service and add Pilots. (You can add only registered users).<br>
	Add pilots with there User Name.
	<br><br>
	<strong>Fly safe & Enjoy your flights.</strong>
	</h3>

</div>
</div>
	
</body>
</html>
