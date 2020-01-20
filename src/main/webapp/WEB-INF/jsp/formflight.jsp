<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="rtl">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Flight Update Form</title>
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

     <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
     <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

</head>
<body>
	<form:form method="post" action="/Flight/addflight" modelAttribute="flight">
		<div>
			<label for="id_param">ID (readonly)</label> <input readonly
				type="text" name="id_param" value="<c:out  value="${tisa.id}"/>" />
		</div>

		<div>
			<label for="ppcId_param">PPC ID(Int)</label> <input type="text"
				name="ppcId_param" value="<c:out  value="${tisa.flPpc.id}"/>" />
		</div>

		<div>
			<label for="userId_param">User ID(Int)</label> <input type="text"
				name="userId_param" value="<c:out  value="${tisa.flPilot.id}"/>" />
		</div>

		<div>
			<label for="date_param">Flight Date</label> <input type="date"
				name="date_param"  placeholder="YYYY-MM-DD" value="<c:out  value="${tisa.flDate}"/>" />
		</div>

		<div>
			<label for="toHour_param">Time Start</label> <input type="time"
				name="toHour_param" value="<c:out  value="${tisa.flToTime}"/>" />
		</div>

		<div>
			<label for="lndHour_param">Time Landing</label> <input type="time"
				name="lndHour_param" value="<c:out  value="${tisa.flLndTime}"/>" />
		</div>

		<div>
			<label for="airField_param">Air Field</label> <input type="text"
				name="airField_param" value="<c:out  value="${tisa.flAirField}"/>" />
		</div>

		<div>
			<label for="fltRoute_param">Flight Route</label> <input type="text"
				name="fltRoute_param" value="<c:out  value="${tisa.flRoute}"/>" />
		</div>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

		<input type="submit" value="update" name="myaction" />
	</form:form>
</body>
</html>
