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
	<form class="container-fluid" method="post" action="/pilot/updatePilot">
		<div class="row">
			<div class="col-lg-4">
				<div class="table-responsive">
					<table class="table">

						<tr>
							<td><label for="id">ID (readonly)</label></td>
							<td><input readonly type="text" name="id"
								value="<c:out  value="${pilot.id}"/>" /></td>
						</tr>

						<tr>
							<td><label for="piFirstName">Pilot first name</label></td>
							<td><input type="text" name="piFirstName"
								value="<c:out  value="${pilot.piFirstName}"/>" /></td>
						</tr>

						<tr>
							<td><label for="piLastName">Pilot last name</label></td>
							<td><input type="text" name="piLastName"
								value="<c:out  value="${pilot.piLastName}"/>" /></td>
						</tr>

						<tr>
							<td><label for="piEmail">Pilot email</label></td>
							<td><input type="email" name="piEmail"
								value="<c:out  value="${pilot.piEmail}"/>" /></td>
						</tr>

						<tr>
							<td><label for="piPhone">Pilot phone no.</label></td>
							<td><input type="text" name="piPhone"
								value="<c:out  value="${pilot.piPhone}"/>" /></td>
						</tr>
					</table>

					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
					<input class="btn btn-primary btn-lg btn-block" type="submit" value="update" name="myaction" /> 
					<a class="btn btn-outline-secondary btn-lg btn-block" href="/index#pilots">Cancel</a>

				</div>
			</div>
		</div>
	</form>
</body>
</html>
