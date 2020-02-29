<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html lang="he" dir="rtl">
<head>
<title>User Flight Logbook</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="style.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>


<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

	<div class="jumbotron text-center">
		<h2>PPC (Power Parashut) Menagement - User Flights</h2>
		<p>Pilot Flight Logbook</p>
	</div>

	<div class="container-fluid">
		<div id="flights">
		<div class="text-center">
			<H2>רשימת טיסות - ${pilot.piFirstName}
			<c:if test="${ppc != null }"> - ${ppc.ppName}</c:if>
			</H2>
			<h3>
				<a href="${contextPath}/addflight">חדש</a> <a href="/flights">רענן</a>
			</h3>

			<input id="myInput" type="text"	placeholder="Search..">
		</div>

			<table class="table table-hover">
				<thead>
					<tr>
						<TH>ID</TH>
						<TH  class="text-right">שם ממג</TH>
						<TH  class="text-right">שם טיס</TH>
						<TH  class="text-right">תאריך טיסה</TH>
						<TH  class="text-right">שעת המראה</TH>
						<TH  class="text-right">שעת נחיתה</TH>
						<TH  class="text-right">שם מנחת</TH>
						<TH  class="text-right">נתיב טיסה</TH>
						<th  class="text-right">נוסע</th>
						<TH  class="text-right">שע"מ מנוע התחלה</TH>
						<TH  class="text-right">שע"מ מנוע סיום</TH>
						<TH  class="text-right">צריכת דלק</TH>
						<TH  class="text-right">צריכת שמן</TH>
						<TH  class="text-right">עלויות נוספות</TH>
						<TH  class="text-right">הערות לתחזוקה</TH>
						<TH  class="text-right">הערות כלליות</TH>
					</tr>
				</thead>
				<tbody id="myTable">
					<c:forEach items="${tisot}" var="t">
						<tr>
							<td><c:out value="${t.id}" /></td>
							<td><c:out value="${t.flPpc.ppName}" /></td>
							<td><c:out value="${t.flPilot.piFirstName}" /></td>
							<td><c:out value="${t.flDate}" /></td>
							<td><c:out value="${t.flToTime}" /></td>
							<td><c:out value="${t.flLndTime}" /></td>
							<td><c:out value="${t.flAirField}" /></td>
							<td><c:out value="${t.flRoute}" /></td>
							<td><c:out value="${t.flPassengerName}" /></td>
							<td><c:out value="${t.flEngHourStart}" /></td>
							<td><c:out value="${t.flEngHourEnd}" /></td>
							<td><c:out value="${t.flFuelQt}" /></td>
							<td><c:out value="${t.flOilQt}" /></td>
							<td><c:out value="${t.flOtherExp}" /></td>
							<td><c:out value="${t.flMaitenance}" /></td>
							<td><c:out value="${t.flRemark}" /></td>
							<td><a class="btn btn-md btn-primary" 
									<c:if test="${t.flPilot.id != pilot.id}">disabled="disabled"</c:if>
									href="flightUpdate/<c:out  value="${t.id}"/>"> עדכון </a>
								<a class="btn btn-xs btn-danger"
									<c:if test="${t.flPilot.id != pilot.id}"> disabled="disabled"</c:if>
									href="flightDel/<c:out  value="${t.id}"/>">מחיקה</a>
								</td>
								
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>
	<div id="contact" class="container-fluid bg-grey text-left">
		<h3>
			<strong>CONTACT</strong>
		</h3>

		<div class="row">
			<div class="col-sm-5 text-left">
				<p>Contact us and we'll get back to you within 24 hours.</p>
				<p>
					<span class="glyphicon glyphicon-map-marker"></span> Israel
				</p>
				<p>
					<span class="glyphicon glyphicon-phone"></span> <a
						href="tel:+972 54-255-5137">+972 54-255-5137</a>
				</p>
				<p>
					<span class="glyphicon glyphicon-envelope"></span> <a
						href="mailto:ofer_ro@yahoo.com?subject=PPC Logbook site"
						target=_blank>ofer_ro@yahoo.com</a>
				</p>
			</div>
		</div>
	</div>

	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
			<!--				<img alt="Logo" src="pilot.jpg" width="10%">
-->
			<div class="navbar-brand">
				<a onclick="document.forms['logoutForm'].submit()">Logout -
					${pilot.piFirstName} ${pilot.piLastName}  (${pageContext.request.userPrincipal.name})</a>
			</div>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${contextPath}/">SERVICES</a></li>
				<li><a href="${contextPath}/userflights">USER FLIGHTS</a></li>
				<li><a href="${contextPath}/userppcs">PPCS</a></li>
				<li><a href="#contact">CONTACT</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<footer class="container-fluid text-center"> <a href="#myPage"
		title="To Top"> <span class="glyphicon glyphicon-chevron-up"></span>
	</a>
	<p>
		Bootstrap Theme Made By <a href="https://www.w3schools.com"
			title="Visit w3schools" target="_blank">www.w3schools.com</a>
	</p>
	</footer>
	<script>
		$(document)
				.ready(
						function() {
							// Add smooth scrolling to all links in navbar + footer link
							$(
									".navbar a, footer a[href='#myPage'],a[href='#flights'],a[href='#pilots'],a[href='#ppcs']")
									.on(
											'click',
											function(event) {

												// Make sure this.hash has a value before overriding default behavior
												if (this.hash !== "") {

													// Prevent default anchor click behavior
													event.preventDefault();

													// Store hash
													var hash = this.hash;

													// Using jQuery's animate() method to add smooth page scroll
													// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
													$('html, body')
															.animate(
																	{
																		scrollTop : $(
																				hash)
																				.offset().top
																	},
																	1200,
																	function() {

																		// Add hash (#) to URL when done scrolling (default click behavior)
																		window.location.hash = hash;
																	});
												} // End if
											});
						})
	</script>
	<script>
		$(document)
				.ready(
						function() {
							$("#myInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#myTable tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});
	</script>
</body>
</html>