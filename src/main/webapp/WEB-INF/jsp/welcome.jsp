<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html lang="he" dir="ltr">
<head>
<title>PPC Logbook System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link  rel="stylesheet" href="css/common.css">
<link  rel="stylesheet" href="css/style.css">

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
<!-- 		<form class="form-inline">
			<div class="input-group">
				<input type="email" class="form-control" size="50"
					placeholder="Email Address" required>
				<div class="input-group-btn">
					<button type="button" class="btn btn-danger">Subscribe</button>
				</div>
			</div>
		</form>
		-->
	</div>

	<div id="services" class="container-fluid text-center">
	<p>---</p>
		<h2>SERVICES</h2>
		<h4>Sellect one</h4>
		<br>
		<div class="row">
			<div class="col-sm-3 well">
				<span class="glyphicon glyphicon-calendar logo-small"></span>
				 <a	href=/userflights><h4>FLIGHT</h4></a>
				<p>Flight Logbook</p>
			</div>
			<div class="col-sm-3 well">
				<span class="glyphicon glyphicon-wrench logo-small"></span>
				<h4>Maintain</h4>
				<p>Maintenance Logbook</p>
			</div>
			<div class="col-sm-3 well">
				<span class="glyphicon glyphicon-lock logo-small"></span> <a
					href=/userppcs><h4>PPC</h4></a>
				<p>PPC Details</p>
			</div>
			<div class="col-sm-3 well">
				<span class="glyphicon glyphicon-user logo-small"></span> 
				<h4>Owners</h4>
				<p>Pilots & Partners</p>
			</div>
		</div>
		
					<h3>
<!-- 				<a href="addflight">חדש</a>
	--> 
				<a href="/flights">רענן</a>
			</h3>
		
	<div id="portfolio" class="container-fluid text-center bg-grey">
		<h2>Portfolio</h2>
		<div class="row text-center">
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="static/shokeda.jpg" alt="Shokeda">
					<p>
						<strong>Shokeda</strong>
					</p>
					<p>Yes, we flight at Shokeda</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="static/kfarMaimon.jpg" alt="Kfar Maimon">
					<p>
						<strong>Kfar Maimon</strong>
					</p>
					<p>We built Kfar Maimon</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="static/myPPC.jpg" alt="My PPC">
					<p>
						<strong>My PPC</strong>
					</p>
					<p>Yes, My PPC at Saad airfield</p>
				</div>
			</div>
		</div>
	</div>

	<div id="contact" class="container-fluid bg-grey">
		<h3><strong>CONTACT</strong></h3>  
 
		<div class="row">
			<div class="col-sm-5 text-left">
				<p>Contact us and we'll get back to you within 24 hours.</p>
				<p>
					<span class="glyphicon glyphicon-map-marker"></span> Israel
				</p>
<!--
				<p>
					<span class="glyphicon glyphicon-phone"></span> <a href="tel:+972 54-255-5137">+972 54-255-5137</a>
				</p>
		-->
				<p>
					<span class="glyphicon glyphicon-envelope"></span> <a
						href="mailto:ofer_ro@yahoo.com?subject=PPC Logbook site" target=_blank>ofer_ro@yahoo.com</a>
				</p>
			</div>
<!-- //form to send mail
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
						<button class="btn btn-default pull-right" type="submit"
							onclick=sendMail()>Send</button>
					</div>
				</div>
			</div>
-->			
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
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
<!-- 				<img alt="Logo" src="/resources/static/pilot.jpg" width="10%">
 	-->
			<div class="navbar-brand">
				<a onclick="document.forms['logoutForm'].submit()">Logout -
					${pilot} (${pageContext.request.userPrincipal.name})</a> 
			</div>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
<!-- 				<li><a href="#myPage">ABOUT</a></li>
	-->
				<li><a href="#myPage">SERVICES</a></li>
				<li><a href="${contextPath}/userflights">USER FLIGHTS</a></li>
				<li><a href="${contextPath}/pilotUpdate">PILOT USER DETAIL</a></li>
				<li><a href="${contextPath}/userppcs">PPCS</a></li>
				<li><a href="/flights#contact">CONTACT</a></li>
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
		$(document).ready(
				function() {
					// Add smooth scrolling to all links in navbar + footer link
					$(".navbar a, footer a[href='#myPage'],a[href='#flights'],a[href='#pilots'],a[href='#ppcs']").on('click',
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
	<script>
		
	</script>
</body>
</html>