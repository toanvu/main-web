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
				chat mit user id = 1
				<form action="/main-web/chat/show" value="POST">
					<input type="hidden" name="groupId" value="0" />
					<input type="hidden" name="userId" value="1" />
					<input type="submit" value="chat" />
				</form>		
				<br/>
				chat mit user id = 2
				<form action="/main-web/chat/show" value="POST">
					<input type="hidden" name="groupId" value="0" />
					<input type="hidden" name="userId" value="2" />
					<input type="submit" value="chat" />
				</form>			
				<h2>Eltern</h2>
				<li><a href="#">group3</a></li>
				<h2>Sonstiges</h2>
				<li><a href="#">group4</a></li>
			</ul>
		</div>		
	</div>
	
	
</body>
</html>
