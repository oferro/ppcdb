<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="rtl">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Flight Add Form</title>
</head>
<body>
	<form:form method="post" action="/flight/addflight" modelAttribute="addFlight">
		<div>
			<form:label path="ppName">PPC Name(String)</form:label> 
			<form:input path="ppName" />
		</div>

		<div>
			<form:label path="flDate">Flight Date</form:label> 
			<form:input path="flDate"  placeholder="YYYY-MM-DD" />
		</div>

		<div>
			<form:label path="flToTime">Time Start</form:label> 
			<form:input path="flToTime"  />
		</div>

		<div>
			<form:label path="flLndTime">Time Landing</form:label> 
			<form:input path="flLndTime"  />
		</div>

		<div>
			<form:label path="flAirField">Air Field</form:label> 
			<form:input path="flAirField"  />
		</div>

		<div>
			<form:label path="flRoute">Flight Route</form:label> 
			<form:input path="flRoute"  />
		</div>


		<input type="submit" value="Submit" />
	</form:form>
</body>
</html>
