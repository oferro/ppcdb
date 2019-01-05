<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="rtl">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Flight Update Form</title>
</head>
<body>
	<form action="FlightController" method="post" name="frm">
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
			<label for="date_param">Flight Date</label> <input type="text"
				name="date_param"  placeholder="YYYY-MM-DD" value="<c:out  value="${tisa.flDate}"/>" />
		</div>

		<div>
			<label for="toHour_param">Time Start</label> <input type="text"
				name="toHour_param" value="<c:out  value="${tisa.flToTime}"/>" />
		</div>

		<div>
			<label for="lndHour_param">Time Landing</label> <input type="text"
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


		<input type="submit" value="update" name="myaction" />
	</form>
</body>
</html>
