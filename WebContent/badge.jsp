<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://backpack.openbadges.org/issuer.js"></script>
</head>
<body>
Click the button to issue your badge
<button value="Issue" onclick="issue()"> </button>

<script>
function issue(){
	OpenBadges.issue_no_modal(['http://gameofbluemix.mybluemix.net/badges/essentials-badge-award.json']);
}

</script>

</body>
</html>