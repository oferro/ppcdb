<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">

<title>PPC Update Form</title>

</head>
<body>
	<h1>PPC update form</h1>
	<form class="container-fluid" method="post" action="/ppc/updateppc">
		<div class="row">
			<div class="col-lg-4">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<td><label for="id">ID (readonly)</label></td>
							<td>
						<input readonly type="text" name="id"
								value="<c:out  value="${ppc.id}"/>" />
							</td>
							</tr>

						<tr>
							<td><label for="ppNotActive">PPC Not Active</label></td>
							<td>
						<input type="checkbox" name="ppNotActive" 
								value="<c:out  value="${ppc.ppNotActive}"/>" />
							</td>
							</tr>

						<tr>

						<tr>
							<td><label for="ppName">PPC name</label></td>
							<td>
						<input type="text" name="ppName" length=15
								value="<c:out  value="${ppc.ppName}"/>" />
							</td>
							</tr>

						<tr>
							<td><label for="ppManuf">PPC Manufactoey</label></td>
							<td>
						<input type="text" name="ppManuf" length=15
								value="<c:out  value="${ppc.ppManuf}"/>" />
							</td>
							</tr>

						<tr>
							<td><label for="ppEnginType">PPC Engin Type</label></td>
							<td>
						<input type="text" name="ppEnginType" length=15
								value="<c:out  value="${ppc.ppEnginType}"/>" />
							</td>
							</tr>

						<tr>
							<td><label for="ppEngHourStart">PPC Engin Start Hour (0000.0)</label>
							</td>
							<td>
						<input type="number" name="ppEngHourStart"
								min="0" max="9999" step="0.1"
								pattern="^\d*(\.\d{0,1})?$" placeholder="0000.0"
								value="<c:out  value="${ppc.ppEngHourStart}"/>" />
							</td>
							</tr>

						<tr>
							<td><label for="ppFuelQt">PPC Fuel Qt.</label></td>
							<td>
						<input type="number" name="ppFuelQt" pattern="^\d*(\.\d{0,1})?$"
								placeholder="000.0" value="<c:out  value="${ppc.ppFuelQt}"/>" />
							</td>
							</tr>
					</table>

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> 
					<input class="btn btn-primary btn-lg btn-block" type="submit" value="update"
						name="myaction" /> 
					<input class="btn btn-lg btn-block" type="button" value="Cancel"
						onclick="history.back()"/>
	</form>

	<script type="text/javascript">
		$(document).on('keydown', 'input[pattern]', function(e) {
			var input = $(this);
			var oldVal = input.val();
			var regex = new RegExp(input.attr('pattern'), 'g');

			setTimeout(function() {
				var newVal = input.val();
				if (!regex.test(newVal)) {
					input.val(oldVal);
				}
			}, 0);
		});
	</script>

</body>
</html>
