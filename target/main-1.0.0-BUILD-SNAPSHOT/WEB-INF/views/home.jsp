<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	
	<div id="messenger">
		<div id="groups">
			<h1>Current Group</h1>
			<ul>
				<h2>Lehrer</h2>
				<li><a href="#">group1- </a></li>
				<li><a href="#">group2</a></li>
				<h2>Eltern</h2>
				<li><a href="#">group3</a></li>
				<h2>Sonstiges</h2>
				<li><a href="#">group4</a></li>
			</ul>
		</div>
		<div id="chat-area">
			<form action="" method="POST">
				<h2>Group name: ${groupName}</h2>
				<input type="hidden" name="groupId" value="${groupId}">
				<textarea rows="" cols="">${chatContent}</textarea>
				<br/>
				<textarea rows="" cols="" name="newMessage"></textarea>
				<br/>
				<input type="submit" value="senden" />
			</form>
		</div>
	</div>
</body>
</html>
