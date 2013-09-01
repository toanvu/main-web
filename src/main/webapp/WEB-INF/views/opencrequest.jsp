<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Offene Kontaktanfrage</title>
</head>
<body>

	<h1>Kontaktanfrage</h1>
	<table>
		<tr>
			<th>Vorname</th>
			<th>Nachname</th>
			<th>Message</th>
			<th></th>
		</tr>
		<c:forEach items="${allCRequests}" var="crequest">
<!-- 			<form name="replycrequest" action="/home-web/contact/replycrequest" method="POST"> -->
			<tr>
				<td>${crequest.getRequest().getFirstname()}</td>
				<td>${crequest.getRequest().getLastname()}</td>
				<td>${crequest.getMessage()}</td>

				<c:choose>
					<c:when test="${crequest.getStatus() == 'open'}">

						<td><input type="hidden" name="userRequestId" value="${crequest.getRequest().getId()}" /> 
							<input type="hidden" name="actionValue" value="" /> 
							
<!-- 							<input type="submit" onclick="document.replycrequest.actionValue.value = accept" value="Akzeptieren" /> -->
<!-- 							<input type="submit" onclick="document.replycrequest.actionValue.value = reject" value="Ablehnen" /></td> -->

							<a href="/main-web/contact/replycrequest?userRequestId=${crequest.getRequest().getId()}&actionValue=accept">Akzeptieren</a>
							<a href="/main-web/contact/replycrequest?userRequestId=${crequest.getRequest().getId()}&actionValue=reject">Ablehnen</a> 
					</c:when>
					<c:otherwise>
						<td>${crequest.getStatus()}</td>
					</c:otherwise>
				</c:choose>

			</tr>
<!-- 			</form> -->
		</c:forEach>
	</table>
</body>
</html>