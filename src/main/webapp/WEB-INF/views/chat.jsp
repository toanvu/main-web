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
				chat mit user id = 1 (noface)
				<form action="/main-web/chat/show" value="POST">
					<input type="hidden" name="groupId" value="0" />
					<input type="hidden" name="userId" value="1" />
					<input type="submit" value="chat" />
				</form>				
				<br/>
				chat mit user id = 2 (sontran)
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
		<div id="chat-area">
			<form action="/main-web/chat/send" method="POST">
				<h2>Group name: ${groupName}</h2>
				<input type="hidden" name="groupId" value="${groupId}">
				<div id="chatContent" style="overflow:scroll; width:400px; height:300px;">
					<c:forEach items="${chatContent}" var="message">
						<div class="message" style="font-size: 12px;">
							${message.getOwner().getUsername()} (${message.getCreatedDate().toString()}):  ${message.getText()}
						</div>											
					</c:forEach>				
				</div>
				
				<textarea rows="" cols="" name="newMessage" style="width: 400px; height:200px;"></textarea>
				<br/>
				<input type="submit" value="senden" />
			</form>
		</div>
		<div>
			<form action="/main-web/chat/show">
					<input type="hidden" name="groupId" value="${groupId}" />
					<input type="hidden" name="userId" value="${userId}" />
					<input type="submit" value="refresh" />
			</form>
		</div>
	</div>
</body>
</html>
