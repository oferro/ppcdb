<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Flight Add Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">

<%
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  String date = sdf.format(new Date());
%>

</head>
<body>
<h1>Flight Add Form</h1>
	<form action="/flight/addFlight"  method="post" name="frm" class="container-fluid">
		<div class="row col-lg-4 table-responsive">
		<table class="table">
			<tr>
			<td><label class="col-1" for="pilotId">Pilot ID : </label></td> 
			<td><select class="col-2" name=pilotId>
				<c:forEach var="p" items="${pilotList}">
					<option value="${p.id}">${p.piFirstName}</option>
				</c:forEach>
			</select></td>
		</tr>

		<tr>
			<td><label for="ppcId">PPC ID : </label></td> 
			<td><select name=ppcId>
				<c:forEach var="p" items="${ppcList}">
					<option value="${p.ptPpc.id}">${p.ptPpc.ppName}</option>
				</c:forEach></td>
			</select>
		</tr>

		<tr>
			<td><label for="flDate">Flight Date</label></td> 
			<td><input type="date"	name="flDate"  placeholder="YYYY-MM-DD" value=<%=date%> /></td>
		</tr>

		<tr>
			<td><label for="flToTime">Time Start</label></td> 
			<td><input type="time"	name="flToTime"  placeholder="HH:MM"/></td>
		</tr>

		<tr>
			<td><label for="flLndTime">Time Landing</label> </td>
			<td><input type="time"	name="flLndTime" placeholder="HH:MM" /></td>
		</tr>

		<tr>
			<td><label for="flAirField">Air Field</label> </td>
			<td><input type="text"	name="flAirField"/></td>
		</tr>

		<tr>
			<td><label for="flRoute">Flight Route</label> </td>
			<td><input type="text"	name="flRoute"  /></td>
		</tr>
		<tr>
			<td><label for="flPassengerName">Passenger Name</label> </td>
			<td><input type="text"	name="flPassengerName"  /></td>
		</tr>
		<tr>
			<td><label for="flEngHourStart">Eng Start Hour (0000.0)</label> </td>
			<td><input type="number" value=0 min="0.0" max="9999.9" step="0.1"	name="flEngHourStart"  /></td>
		</tr>
		<tr>
			<td><label for="flEngHourEnd">Eng End Hour (0000.0)</label> </td>
			<td><input type="number" value=0 min="0.0" max="9999.9"	name="flEngHourEnd"  /></td>
		</tr>
		<tr>
			<td><label for="flFuelQt">Fuel Consumption (000.0)</label> </td>
			<td><input type="number" value=0 min="0.0" max="999.9" step="0.1" name="flFuelQt"  /></td>
		</tr>
		<tr>
			<td><label for="flOilQt">Oil Consumption (000.0)</label> </td>
			<td><input type="number" value=0 min="0.0" max="999.9" step="0.1" name="flOilQt"  /></td>
		</tr>
		<tr>
			<td><label for="flOtherExp">Other Exp.(000,000.00)</label> </td>
			<td><input type="number" value=0 min="0.00" max="999999.99" step="0.01" name="flOtherExp"  /></td>
		</tr>
		<tr>
			<td><label for="flMaitenance">Maitenance nided</label> </td>
			<td><input type="text"	name="flMaitenance"  /></td>
		</tr>
		<tr>
			<td><label for="flRemark">Remarks</label> </td>
			<td><input type="text"	name="flRemark"  /></td>
		</tr>
	</table>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="pathName" value="${uriName}">
		<input type="submit" class="btn btn-lg btn-block" value="Add" name="frm" /> 
		<input class="btn btn-lg btn-block" type="button" value="Cancel"
			onclick="history.back()" />
	</form>
</body>
</html>
