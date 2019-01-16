<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">

<title>Pilot Update Form</title>

</head>
<body>
<h1>Pilot update form</h1>
	<form class="container" method="post" action="/pilot/updatePilot" >
		<div>
			<label for="id">ID (readonly)</label> 
			<input readonly	type="text" name="id" value="<c:out  value="${pilot.id}"/>" />
		</div>

		<div>
			<label for="piFirstName">Pilot first name</label> 
			<input type="text" name="piFirstName" value="<c:out  value="${pilot.piFirstName}"/>" />
		</div>

		<div>
			<label for="piLastName">Pilot last name</label> 
			<input type="text" name="piLastName" value="<c:out  value="${pilot.piLastName}"/>" />
		</div>

		<div>
			<label for="piEmail">Pilot email</label> 
			<input type="email" name="piEmail" value="<c:out  value="${pilot.piEmail}"/>" />
		</div>

		<div>
			<label for="piPw">Pilot login passwoed</label> 
			<input type="password" name="piPw" value="<c:out  value="${pilot.piPw}"/>" />
		</div>

		<div>
			<label for="piPhone">Pilot phone no.</label> 
			<input type="text"	name="piPhone"  value="<c:out  value="${pilot.piPhone}"/>" />
		</div>


		<input type="submit" value="update" name="myaction" /> <a href="/#ppcs">Cancel</a>
	</form>
</body>
</html>
