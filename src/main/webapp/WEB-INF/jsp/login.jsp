<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html lang="he" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>PPC Logbook Welcome</title>
    
    <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    

     <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
     <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

 
 
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

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
	<p>---</p>
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
	<p>---</p>
		<h2>SERVICES</h2>
		<h4>What we offer</h4>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-calendar logo-small"></span> <a
					href=#flights><h4>FLIGHT</h4></a>
				<p>Flight Logbook</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-wrench logo-small"></span>
				<h4>Maintain</h4>
				<p>Maintenance Logbook</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-lock logo-small"></span> <a
					href=#ppcs><h4>PPC</h4></a>
				<p>PPC Details</p>
			</div>
		</div>
		<br> <br>
		<div class="row">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-user logo-small"></span> <a
					href=#pilots><h4>Owners</h4></a>
				<p>Pilots & Partners</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-print logo-small"></span>
				<h4>Reports</h4>
				<p>Flight & log Reports</p>
			</div>
<!-- 
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-plus logo-small"></span>
				<h4>HARD WORK</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
-->			
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
		<h3><strong>CONTACT</strong></h3>  
 
		<div class="row">
			<div class="col-sm-5 text-left">
				<p>Contact us and we'll get back to you within 24 hours.</p>
				<p>
					<span class="glyphicon glyphicon-map-marker"></span> Israel
				</p>
				<p>
					<span class="glyphicon glyphicon-phone"></span> <a href="tel:+972 54-255-5137">+972 54-255-5137</a>
				</p>
				<p>
					<span class="glyphicon glyphicon-envelope"></span> <a
						href="mailto:ofer_ro@yahoo.com?subject=PPC Logbook site" target=_blank>ofer_ro@yahoo.com</a>
				</p>
			</div>
		</div>
	</div>		


<div class="container">

</div>
<!-- /container -->

	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

	<div class="navbar-brand">

   <form method="POST" action="${contextPath}/login" class="form-signin">
<!--        <h2 class="form-heading">Log in</h2>  -->

        <div class="form-group form-group-sm form-inline ${error != null ? 'has-error' : ''}">
<!--           <span>${message}</span> -->
            <input name="username" type="text" class="form-control" placeholder="Username"
                   autofocus="true"/>
            <input name="password" type="password" class="form-control" placeholder="Password"/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button class="btn btn-sm btn-primary" type="submit">Log In</button>
            <a class="small" href="${contextPath}/registration">Create an account</a>
        </div>
         <span>${message}</span>

    </form>
    </div>

<!-- Logout Form			
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		-->			
<!-- 				<img alt="Logo" src="pilot.jpg" width="10%">
		-->
<!-- 
			<div class="navbar-brand">
				<a onclick="document.forms['logoutForm'].submit()">Logout -
					${pilot} (${pageContext.request.userPrincipal.name})</a> 
			</div>
		-->
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#about">ABOUT</a></li>
				<li><a href="#services">SERVICES</a></li>
				<li><a href="#flights">FLIGHTS</a></li>
				<li><a href="#pilots">PILOTS</a></li>
				<li><a href="#ppcs">PPCS</a></li>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>