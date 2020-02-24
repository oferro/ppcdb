<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Flight Add Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">

</head>
<body>
<h1>Ppc Add Form</h1>
<h2>Menage by: <span>${pilotName}</span></h2>
	<form action="/ppc/addPpc"  method="post" name="frm" class="container">
		<div>
			<label for="ppName">PPC Name</label> 
			<input type="text"	name="ppName" length=15 required/>
		</div>

		<div>
			<label for="ppManuf">PPC Manufactory</label> 
			<input type="text"	name="ppManuf" length=15 required/>
		</div>

		<div>
			<label for="ppEnginType">PPC Engin Type</label> 
			<input type="text"	name="ppEnginType" length=15 required/>
		</div>

		<div>
			<label for="ppEngHourStart">PPC Engin Start Hour</label> 
			<input type="number" name="ppEngHourStart" pattern="^\d*(\.\d{0,1})?$" placeholder="0000.0" required/>
		</div>

		<div>
			<label for="ppFuelQt">PPC Fuel Qt.</label> 
			<input type="number"	name="ppFuelQt" pattern="^\d*(\.\d{0,1})?$" placeholder="000.0"/>
		</div>
		
		<div>
			<label for="ppNotActive">PPC not active</label> 
			<input type="checkbox" name="ppNotActive" value=false readonly>
		</div>
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

		<input type="submit" value="New" name="frm" />
		<input type="button" onclick="cancel()" value="Cancel"/>
	</form>
	
	<script type="text/javascript">
	$(document).on('keydown', 'input[pattern]', function(e){
		  var input = $(this);
		  var oldVal = input.val();
		  var regex = new RegExp(input.attr('pattern'), 'g');

		  setTimeout(function(){
		    var newVal = input.val();
		    if(!regex.test(newVal)){
		      input.val(oldVal); 
		    }
		  }, 0);
		});

	var cancel = function() {
		window.location.href = document.referrer;
	};

	</script>
</body>
</html>
