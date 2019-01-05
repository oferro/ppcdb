<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="he" dir="rtl">
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

	<!-- 
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-8">
				<h2>About Company Page</h2>
				<h4>Lorem ipsum..</h4>
				<p>Lorem ipsum..</p>
				<button class="btn btn-default btn-lg">Get in Touch</button>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-signal logo"></span>
			</div>
		</div>
	</div>
	<div class="container-fluid bg-grey">
		<div class="row">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-globe logo"></span>
			</div>
			<div class="col-sm-8">
				<h2>Our Values</h2>
				<h4>
					<strong>MISSION:</strong> Our mission lorem ipsum..
				</h4>
				<p>
					<strong>VISION:</strong> Our vision Lorem ipsum..
				</p>
			</div>
		</div>
	</div>
-->
	<div id="services" class="container-fluid text-center">
		<h2>SERVICES</h2>
		<h4>What we offer</h4>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-calendar logo-small"></span>
				<h4>FLIGHT</h4>
				<p>Flight Logbook</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-wrench logo-small"></span>
				<h4>Maintain</h4>
				<p>Maintenance Logbook</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-lock logo-small"></span>
				<h4>PPC</h4>
				<p>PPC Details</p>
			</div>
		</div>
		<br> <br>
		<div class="row">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-user logo-small"></span>
				<h4>Owners</h4>
				<p>User & Partners</p>
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
		<div class="row">
			<H2>רשימת טיסות</H2>
			<h3>
				<a href="FlightController?myaction=add">חדש</a> <a
					href="FlightController?myaction=listOfFlights">רענן</a>
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
								href="FlightController?myaction=delete&id=<c:out  value="${t.id}"/>">מחיקה</a>
								<a
								href="flight/id?id=<c:out  value="${t.id}"/>">עדכון</a>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>
	<div id="portfolio" class="container-fluid text-center bg-grey">
		<h2>Portfolio</h2>
		<h4>What we have created</h4>
		<div class="row text-center">
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="paris.jpg" alt="Paris">
					<p>
						<strong>Paris</strong>
					</p>
					<p>Yes, we built Paris</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="newyork.jpg" alt="New York">
					<p>
						<strong>New York</strong>
					</p>
					<p>We built New York</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="sanfran.jpg" alt="San Francisco">
					<p>
						<strong>San Francisco</strong>
					</p>
					<p>Yes, San Fran is ours</p>
				</div>
			</div>
		</div>
	</div>
	<h2>What our customers say</h2>
	<div id="myCarousel" class="carousel slide text-center"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<h4>
					"This company is the best. I am so happy with the result!"<br>
					<span style="font-style: normal;">Michael Roe, Vice
						President, Comment Box</span>
				</h4>
			</div>
			<div class="item">
				<h4>
					"One word... WOW!!"<br> <span style="font-style: normal;">John
						Doe, Salesman, Rep Inc</span>
				</h4>
			</div>
			<div class="item">
				<h4>
					"Could I... BE any more happy with this company?"<br> <span
						style="font-style: normal;">Chandler Bing, Actor,
						FriendsAlot</span>
				</h4>
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<div id="pricing" class="container-fluid">
		<div class="text-center">
			<h2>Pricing</h2>
			<h4>Choose a payment plan that works for you</h4>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<div class="panel panel-default text-center">
					<div class="panel-heading">
						<h1>Basic</h1>
					</div>
					<div class="panel-body">
						<p>
							<strong>20</strong> Lorem
						</p>
						<p>
							<strong>15</strong> Ipsum
						</p>
						<p>
							<strong>5</strong> Dolor
						</p>
						<p>
							<strong>2</strong> Sit
						</p>
						<p>
							<strong>Endless</strong> Amet
						</p>
					</div>
					<div class="panel-footer">
						<h3>$19</h3>
						<h4>per month</h4>
						<button class="btn btn-lg">Sign Up</button>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="panel panel-default text-center">
					<div class="panel-heading">
						<h1>Pro</h1>
					</div>
					<div class="panel-body">
						<p>
							<strong>50</strong> Lorem
						</p>
						<p>
							<strong>25</strong> Ipsum
						</p>
						<p>
							<strong>10</strong> Dolor
						</p>
						<p>
							<strong>5</strong> Sit
						</p>
						<p>
							<strong>Endless</strong> Amet
						</p>
					</div>
					<div class="panel-footer">
						<h3>$29</h3>
						<h4>per month</h4>
						<button class="btn btn-lg">Sign Up</button>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="panel panel-default text-center">
					<div class="panel-heading">
						<h1>Premium</h1>
					</div>
					<div class="panel-body">
						<p>
							<strong>100</strong> Lorem
						</p>
						<p>
							<strong>50</strong> Ipsum
						</p>
						<p>
							<strong>25</strong> Dolor
						</p>
						<p>
							<strong>10</strong> Sit
						</p>
						<p>
							<strong>Endless</strong> Amet
						</p>
					</div>
					<div class="panel-footer">
						<h3>$49</h3>
						<h4>per month</h4>
						<button class="btn btn-lg">Sign Up</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="contact" class="container-fluid bg-grey">
		<h2 class="text-center">CONTACT</h2>
		<div class="row">
			<div class="col-sm-5 text-left">
				<p>Contact us and we'll get back to you within 24 hours.</p>
				<p>
					<span class="glyphicon glyphicon-map-marker"></span> Chicago, US
				</p>
				<p>
					<span class="glyphicon glyphicon-phone"></span> +00 1515151515
				</p>
				<p>
					<span class="glyphicon glyphicon-envelope"></span>
					myemail@something.com
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
	<!-- 
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
				<li><a href="#portfolio">PORTFOLIO</a></li>
				<li><a href="#pricing">PRICING</a></li>
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
					$(".navbar a, footer a[href='#myPage']").on('click',
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