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

<title>Flight Update Form</title>

</head>
<body>
<h1>Flight update form</h1>
	<form class="container" method="post" action="/flight/updateflight" >
		<div>
			<label for="id">ID (readonly)</label> 
			<input readonly	type="text" name="id" value="<c:out  value="${tisa.id}"/>" />
		</div>

		<div>
			<label for="ppcId">PPC name (readonly)</label> 
			<input readonly type="text" value="<c:out  value="${tisa.flPpc.ppName}"/>" />
		</div>

		<div>
			<label for="pilotName">Pilot name (readonly)</label> 
			<input readonly type="text" value="<c:out  value="${tisa.flPilot.piFirstName}"/>" />
		</div>

		<div>
			<label for="flDate">Flight Date</label> 
			<input type="date"	name="flDate"  placeholder="YYYY-MM-DD" value="<c:out  value="${tisa.flDate}"/>" />
		</div>

		<div>
			<label for="flToTime">Time Start</label> 
			<input type="time"	name="flToTime" value="<c:out  value="${tisa.flToTime}"/>" />
		</div>

		<div>
			<label for="flLndTime">Time Landing</label> 
			<input type="time"	name="flLndTime" value="<c:out  value="${tisa.flLndTime}"/>" />
		</div>

		<div>
			<label for="flAirField">Air Field</label> 
			<input type="text"	name="flAirField" value="<c:out  value="${tisa.flAirField}"/>" />
		</div>

		<div>
			<label for="flRoute">Flight Route</label> 
			<input type="text"	name="flRoute" value="<c:out  value="${tisa.flRoute}"/>" />
		</div>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

		<input type="submit" value="update" name="myaction" /> <a href="/#services">Cancel</a>
	</form>
</body>
</html>
