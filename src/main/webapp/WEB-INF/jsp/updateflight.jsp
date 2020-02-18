<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">


<link rel="stylesheet" href="style.css">

<title>Flight Update Form</title>

</head>
<body>
	<h1>Flight update form</h1>
	<form class="container-fluid" method="post"
		action="/flight/updateflight">
		<div class="row">
			<div class="col-lg-4">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<td><label for="id">ID (readonly)</label></td>
							<td><input readonly type="text" name="id" class="col-lg-6"
								value="<c:out  value="${tisa.id}"/>" /></td>
						</tr>


						<tr>
							<th><label for="ppcId">PPC name (readonly)</label></th>
							<td><input readonly type="text"
								value="<c:out  value="${tisa.flPpc.ppName}"/>" />
							</th>
						</tr>

						<tr>
							<td><label for="pilotName">Pilot name (readonly)</label></td>
							<td><input readonly type="text"
								value="<c:out  value="${tisa.flPilot.piFirstName}"/>" /></td>
						</tr>

						<tr>
							<td><label for="flDate">Flight Date</label></td>
							<td><input type="date" name="flDate"
								placeholder="YYYY-MM-DD"
								value="<c:out  value="${tisa.flDate}"/>" /></td>
						</tr>

						<tr>
							<td><label for="flToTime">Time Start</label></td>
							<td><input type="time" name="flToTime"
								value="<c:out  value="${tisa.flToTime}"/>" /></td>
						</tr>

						<tr>
							<td><label for="flLndTime">Time Landing</label></td>
							<td><input type="time" name="flLndTime"
								value="<c:out  value="${tisa.flLndTime}"/>" /></td>
						</tr>

						<tr>
							<td><label for="flAirField">Air Field</label></td>
							<td><input type="text" name="flAirField"
								value="<c:out  value="${tisa.flAirField}"/>" /></td>
						</tr>

						<tr>
							<td><label for="flRoute">Flight Route</label></td>
							<td><input type="text" name="flRoute"
								value="<c:out  value="${tisa.flRoute}"/>" /></td>
						</tr>
					</table>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> 
						<input type="hidden" name="pathName" value=userflights>
						<input class="btn btn-primary btn-lg btn-block" type="submit" value="update"	name="myaction" /> 
						<a class="btn btn-outline-secondary btn-lg btn-block" path="/">Cancel</a>
	</form>
</body>
</html>
