<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="he" dir="ltr">
<head>
<title>PPC Logbook System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>


<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

	<div class="jumbotron text-center">
		<h1>PPC (Power Parashut) Menagement</h1>
		<p>Flight Logbook, Maintenance Logbook</p>
		<form class="form-inline">
			<div class="input-group">
				<input type="email" class="form-control" size="50"
					placeholder="Email Address" required>
				<div class="input-group-btn">
					<button type="button" class="btn btn-danger">Subscribe</button>
				</div>
			</div>
		</form>
	</div>
	<div class="container-fluid" id="about">
		<h2>About PPC Logbook</h2>
		<h4>Flights Logbook</h4>
		<p>
			PPC flights record specilaize for PPC. <br> Fuel, Oil
			consamption, Engine hour, Remarks on things to maintain that raize in
			the flight. <br> Pilot, Passenger, Airfield, Description of
			flight route.
		</p>
		<br>
		<h4>Maintenance Logbook</h4>
		<p>
			PPC maintenance record. <br> What, When, Who, Cost ...
		</p>

		<button class="btn btn-default btn-lg">Get in Touch</button>
	</div>

	<div class="container-fluid bg-grey">
		<h2>Our Values</h2>
		<h4>
			<strong>MISSION:</strong> "One Stop Shop" for all the PPC activity
			recording.
		</h4>
		<p>
			<strong>VISION:</strong> To give the PPC owner\s a packadge for full
			life cycle of the PPC.
	</div>

	<div id="services" class="container-fluid text-center">
		<h2>SERVICES</h2>
		<h4>What we offer</h4>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-calendar logo-small"></span>
				<a href=#flights><h4>FLIGHT</h4></a>
				<p>Flight Logbook</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-wrench logo-small"></span>
				<h4>Maintain</h4>
				<p>Maintenance Logbook</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-lock logo-small"></span>
				<a href=#ppcs><h4>PPC</h4></a>
				<p>PPC Details</p>
			</div>
		</div>
		<br> <br>
		<div class="row">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-user logo-small"></span>
				<a href=#pilots><h4>Owners</h4></a>
				<p>Pilots & Partners</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-print logo-small"></span>
				<h4>Reports</h4>
				<p>Flight & log Reports</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-plus logo-small"></span>
				<h4>HARD WORK</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
		</div>
		<div class="row" id="flights">
			<H2>רשימת טיסות</H2>
			<h3>
				<a href="addflight">חדש</a> <a
					href="/">רענן</a>
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
							<td><a
								href="flightDel/<c:out  value="${t.id}"/>">מחיקה</a>
								<a
								href="flightUpdate/<c:out  value="${t.id}"/>">עדכון</a>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
		<div class="row" id="pilots">
			<H2>רשימת טייסים</H2>
			<h3>
				<a href="addpilot">חדש</a> <a
					href="/">רענן</a>
			</h3>
			<table class=table>
				<thead>
					<tr>
						<TH>ID</TH>
						<TH>שם פרטי</TH>
						<TH>שם משפחה</TH>
						<TH>מייל</TH>
						<TH>טלפון</TH>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pilotList}" var="p">
						<tr>
							<td><c:out value="${p.id}" /></td>
							<td><c:out value="${p.piFirstName}" /></td>
							<td><c:out value="${p.piLastName}" /></td>
							<td><c:out value="${p.piEmail}" /></td>
							<td><c:out value="${p.piPhone}" /></td>
							<td><a
								href="pilotDel/<c:out  value="${p.id}"/>">מחיקה</a>
								<a
								href="pilotUpdate/<c:out  value="${p.id}"/>">עדכון</a>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>	
		<div class="row bg-grey" id="ppcs">
			<H2>רשימת כלי ממ"ג</H2>
			<h3>
				<a href="addPpc">חדש</a> <a
					href="/">רענן</a>
			</h3>
			<table class=table>
				<thead>
					<tr>
						<TH>ID</TH>
						<TH>שם ממג</TH>
						<TH>שם יצרן</TH>
						<TH>סוג מנוע</TH>
						<TH>שעמ התחלתי</TH>
						<TH>נפח מיכל דלק</TH>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ppcList}" var="pp">
						<tr>
							<td><c:out value="${pp.id}" /></td>
							<td><c:out value="${pp.ppName}" /></td>
							<td><c:out value="${pp.ppManuf}" /></td>
							<td><c:out value="${pp.ppEnginType}" /></td>
							<td><c:out value="${pp.ppEngHourStart}" /></td>
							<td><c:out value="${pp.ppFuelQt}" /></td>
							<td><a
								href="ppcDel/<c:out  value="${pp.id}"/>">מחיקה</a>
								<a
								href="ppcUpdate/<c:out  value="${pp.id}"/>">עדכון</a>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>	
	</div>
<!-- 
	<div id="portfolio" class="container-fluid text-center bg-grey">
		<h2>Portfolio</h2>
		<h4>What we have created</h4>
		<div class="row text-center">
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="shokeda.jpg" alt="Shokeda">
					<p>
						<strong>Shokeda</strong>
					</p>
					<p>Yes, we flight at Shokeda</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="kfarMaimon.jpg" alt="Kfar Maimon">
					<p>
						<strong>Kfar Maimon</strong>
					</p>
					<p>We built Kfar Maimon</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="myPPC.jpg" alt="My PPC">
					<p>
						<strong>My PPC</strong>
					</p>
					<p>Yes, My PPC at Saad airfield</p>
				</div>
			</div>
		</div>
	</div>
	 -->
	<div id="contact" class="container-fluid bg-grey">
		<h2 class="text-center">CONTACT</h2>
		<div class="row">
			<div class="col-sm-5 text-left">
				<p>Contact us and we'll get back to you within 24 hours.</p>
				<p>
					<span class="glyphicon glyphicon-map-marker"></span> Israel
				</p>
				<p>
					<span class="glyphicon glyphicon-phone"></span> +972 54-255-5137
				</p>
				<p>
					<span class="glyphicon glyphicon-envelope"></span>
					<a href="mailto:ofer_ro@yahoo.com?subject=PPC Logbook site">ofer_ro@yahoo.com</a>
				</p>
			</div>
			<div class="col-sm-7">
				<div class="row">
					<div class="col-sm-6 form-group">
						<input class="form-control" id="name" name="name"
							placeholder="Name" type="text" required>
					</div>
					<div class="col-sm-6 form-group">
						<input class="form-control" id="email" name="email"
							placeholder="Email" type="email" required>
					</div>
				</div>
				<textarea class="form-control" id="comments" name="comments"
					placeholder="Comment" rows="5"></textarea>
				<br>
				<div class="row">
					<div class="col-sm-12 form-group">
						<button class="btn btn-default pull-right" type="submit">Send</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Add Google Maps -->
	
<!-- Till I have a user key for google map
		<div id="googleMap" style="height: 400px; width: 100%;"></div>
		<script>
			function myMap() {
				var myCenter = new google.maps.LatLng(41.878114, -87.629798);
				var mapProp = {
					center : myCenter,
					zoom : 12,
					scrollwheel : false,
					draggable : false,
					mapTypeId : google.maps.MapTypeId.ROADMAP
				};
				var map = new google.maps.Map(document
						.getElementById("googleMap"), mapProp);
				var marker = new google.maps.Marker({
					position : myCenter
				});
				marker.setMap(map);
			}
		</script>
		<script
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&callback=myMap"></script>
-->
	<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Logo</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#about">ABOUT</a></li>
				<li><a href="#services">SERVICES</a></li>
				<li><a href="#flights">FLIGHTS</a></li>
				<li><a href="#pilots">PILOTS</a></li>
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
			title="Visit w3schools">www.w3schools.com</a>
	</p>
	</footer>
	<script>
		$(document).ready(
				function() {
					// Add smooth scrolling to all links in navbar + footer link
					$(".navbar a, footer a[href='#myPage'],a[href='#flights'],a[href='#pilots']").on('click',
							function(event) {

								// Make sure this.hash has a value before overriding default behavior
								if (this.hash !== "") {

									// Prevent default anchor click behavior
									event.preventDefault();

									// Store hash
									var hash = this.hash;

									// Using jQuery's animate() method to add smooth page scroll
									// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
									$('html, body').animate({
										scrollTop : $(hash).offset().top
									}, 1200, function() {

										// Add hash (#) to URL when done scrolling (default click behavior)
										window.location.hash = hash;
									});
								} // End if
							});
				})
	</script>
</body>
</html>