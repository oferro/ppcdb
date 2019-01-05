<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="rtl">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Flights Page</title>
</head>
<body>
	<H1>רשימת טיסות</H1>
	<h3>
		<a href="/Flight">חדש</a>
	</h3>
	<table class=table>
		<thead>
			<tr>
				<TH>ID</TH>
				<TH>שם ממג</TH>
				<TH>שם טיס</TH>
				<TH>תאריך טיסה</TH>
				<TH>שעת המראה</TH>
				<TH>שעת נחיתה</TH>
				<TH>שם מנחת</TH>
				<TH>נתיב טיסה</TH>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${tisa}" var="t">
				<tr>
					<td><c:out value="${t.id}" /></td>
					<td><c:out value="${t.flPpc.ppName}" /></td>
					<td><c:out value="${t.flPilot.piFirstName}" /></td>
					<td><c:out value="${t.flDate}" /></td>
					<td><c:out value="${t.flToTime}" /></td>
					<td><c:out value="${t.flLndTime}" /></td>
					<td><c:out value="${t.flAirField}" /></td>
					<td><c:out value="${t.flRoute}" /></td>
					<td>
						<a href="FlightController?myaction=delete&id=<c:out  value="${t.id}"/>">מחיקה</a>
						<a href="FlightController?myaction=update&id=<c:out  value="${t.id}"/>">עדכון</a>
					</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
