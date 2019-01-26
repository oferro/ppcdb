<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
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
	<form action="/flight/addFlight"  method="post" name="frm" class="container">
		<div class="row">
			<label class="col-1" for="pilotId">Pilot ID : </label> 
			<select class="col-2" name=pilotId>
				<c:forEach var="p" items="${pilotList}">
					<option value="${p.id}">${p.piFirstName}</option>
				</c:forEach>
			</select>
		</div>

		<div>
			<label for="ppcId">PPC ID : </label> 
			<select name=ppcId>
				<c:forEach var="p" items="${ppcList}">
					<option value="${p.id}">${p.ppName}</option>
				</c:forEach>
			</select>
		</div>

		<div>
			<label for="flDate">Flight Date</label> 
			<input type="text"	name="flDate"  placeholder="YYYY-MM-DD" value=<%=date%> />
		</div>

		<div>
			<label for="flToTime">Time Start</label> 
			<input type="text"	name="flToTime"  placeholder="HH:MM"/>
		</div>

		<div>
			<label for="flLndTime">Time Landing</label> 
			<input type="text"	name="flLndTime" placeholder="HH:MM" />
		</div>

		<div>
			<label for="flAirField">Air Field</label> 
			<input type="text"	name="flAirField"/>
		</div>

		<div>
			<label for="flRoute">Flight Route</label> 
			<input type="text"	name="flRoute"  />
		</div>


		<input type="submit" value="Add" name="frm" /> <a href="/">Cancel</a>
	</form>
</body>
</html>
