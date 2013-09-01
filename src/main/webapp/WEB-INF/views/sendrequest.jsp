<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sendrequest</title>
</head>
<body>

	<h1>Kontaktanfrage senden</h1>

	<h3>${userResponse.getFirstname()} ${userResponse.getLastname()}</h3>

	<form action="/main-web/contact/add/crequest" method="POST">
		<input type="text" name="requestMes" size="100" maxlength="60" height="40" />
		<input type="hidden" name="userId" value="${userResponse.getId()}"/>
		<input type="submit" value="senden"/>
	</form>
</body>
</html>