<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Kontakt</title>
</head>
<body>
	<h1>Kontakt hinzufügen</h1>

	<h3>Suche nach einem Kontakt</h3>

	<form action="/main-web/contact/search/user" method="POST">
		<table>
			<tr>
				<th>Vorname</th>
				<th>Name</th>
			</tr>
			<tr>
				<td><input type="text" name="sfirstname" class="input-small" /></td>
				<td><input type="text" name="slastname" class="input-small" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="suchen" /></td>
			</tr>
		</table>
	</form>

	<h3>Alle Nutzer</h3>
	
		<table>
			<tr>
				<th>Vorname</th>
				<th>Name</th>
				<th>Status</th>
				<th></th>
			</tr>
			<c:forEach items="${allUsers}" var="user">
			<form action="/main-web/contact/sendrequest" method="POST">
				<tr>
					<td>${user.getFirstname()}</td>
					<td>${user.getLastname()}</td>
					<c:choose>
						<c:when test="${user.getUsertype() == 'other'}">
							<td>Sonstige</td>
						</c:when>
						<c:otherwise>
							<td>${user.getUsertype()}</td>
						</c:otherwise>
					</c:choose>
					<td><input type="hidden" name="userId" value="${user.getId()}" /><input
						type="submit" value="Kontakt hinzufügen" /></td>
				</tr>
			</form>
			</c:forEach>
		</table>
</body>
</html>
