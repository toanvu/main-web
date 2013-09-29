function deleteMessage(id){

	//use ajax to delete message
	$.ajax({
		url: '/main-web/services/message/delete?id='+id,
		type: 'GET',			
		contentType:"text/html; charset=utf-8"
	}).fail(function(jqXHR, textStatus) {
  		alert( "Request failed: " + textStatus );
	}).done(function(data){
		//and update template
		$("#msg_"+id).remove();		
	});	
	
}

