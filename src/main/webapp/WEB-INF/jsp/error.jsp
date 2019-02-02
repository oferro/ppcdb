<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Error Logbook System</title>
</head>

<body class="container-fluid">
	<h3>Please enter the correct details</h3>
	<div class="alert alert-primary" role="alert">
	<table>
		<tr>
			<p>message:</p> <h2> ${message} </h2>
		<tr>
			<td>
			
			<a class="btn btn-primary btn-lg btn-block" href="/">Retry</a></td>
		</tr>
	</table>
	</div>	

</body>

</html>