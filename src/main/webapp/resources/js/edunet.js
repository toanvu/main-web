var alphabet = new Array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
		"L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y",
		"Z");

function addContact(name, id) {
	document.getElementById("userResponseName").innerHTML = name;
	document.getElementById("userResponseId").value = id;
}

function displayUserList(val) {
	for ( var i = 0; i < alphabet.length; i++) {
		if (alphabet[i] == val) {
			jQuery(".userList" + val).css("display", "inline");
		} else {
			jQuery(".userList" + alphabet[i]).css("display", "none");
		}
	}
}

function resetCssClass() {
	for ( var i = 0; i < alphabet.length; i++) {
		jQuery(".userList" + alphabet[i]).css("display", "inline");
	}
}

function inviteFriend(userid, name){
	doInvite(userid, name);
}

function doInvite(userid, name) {			
	var currentUserId = jQuery("#edunet-context-userId").text();
	var currentGroupId= jQuery("#edunet-context-currentGroupId").text();

	
	
	jQuery.ajax({
		url: '/main-web/services/message/receiver?channel='+currentUserId,
		type: 'POST',
		data:  {currentGroupId: currentGroupId, userid: userid, action: "inviteFriend"},
		contentType:"text/html; charset=utf-8"
	}).fail(function(jqXHR, textStatus) {
  		alert( "Request failed: " + textStatus );
	}).done(function(){
		alert(name +" wurde hinzugefügt");
		jQuery("#toSendMessage").val("");				
	});
				
	
	
}