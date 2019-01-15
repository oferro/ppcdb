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
	<form class="container" method="post" action="/ppc/updateppc">
		<div>
			<label for="id">ID (readonly)</label> <input readonly type="text"
				name="id" value="<c:out  value="${ppc.id}"/>" />
		</div>

		<div>
			<label for="ppName">PPC name</label> <input type="text"
				name="ppName" length=15 value="<c:out  value="${ppc.ppName}"/>" />
		</div>

		<div>
			<label for="ppManuf">PPC Manufactoey</label> <input type="text"
				name="ppManuf" length=15 value="<c:out  value="${ppc.ppManuf}"/>" />
		</div>

		<div>
			<label for="ppEnginType">PPC Engin Type</label> <input type="text"
				name="ppEnginType" length=15
				value="<c:out  value="${ppc.ppEnginType}"/>" />
		</div>

		<div>
			<label for="ppEngHourStart">PPC Engin Start Hour</label> 
			<input type="number"
				name="ppEngHourStart"
				pattern="^\d*(\.\d{0,1})?$" placeholder="0000.0"
				value="<c:out  value="${ppc.ppEngHourStart}"/>" />
		</div>

		<div>
			<label for="ppFuelQt">PPC Fuel Qt.</label> <input
				type="number" name="ppFuelQt"
				pattern="^\d*(\.\d{0,1})?$" placeholder="000.0"
				value="<c:out  value="${ppc.ppFuelQt}"/>" />
		</div>

		<input type="submit" value="update" name="myaction" /> <a
			href="/#ppcs">Cancel</a>
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