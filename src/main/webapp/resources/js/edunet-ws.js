		/////////////////////EDUNET24.de
		
		function controlConnect() {
			controlUnsubscribe();
		    controlSubscribe();
		}
		
		// jquery.atmosphere.response
		function callback(response) {
			// Websocket events.
			jQuery.atmosphere.log('info', ["response.state: " + response.state]);
			jQuery.atmosphere.log('info', ["response.transport: " + response.transport]);
			jQuery.atmosphere.log('info', ["response.status: " + response.status]);
		
			if (response.transport != 'polling' && response.state == 'messageReceived') {
				jQuery.atmosphere.log('info', ["response.responseBody: " + response.responseBody]);
				if (response.status == 200) {
					var data = response.responseBody;
					if (data.length > 0) {												
						var jsonData = JSON.parse(data);
						var teacherGroup = jsonData.teacherGroup;
						var messages = jsonData.messageOfGroup;
						var currentGroupId= jQuery("#edunet-context-currentGroupId").text();						
						//add new message if response is a new message and belongs to currentGroupid						
						if(jsonData.newMessage == true && jsonData.groupId == currentGroupId){							
							addNewMessage(jsonData);
						}else{
							loadGroup(teacherGroup, "#teacherGroup");
							loadMessage(messages);
						}
						
					}
				}
			}
		}
		
		function controlSubscribe() {
			if (!this.callbackAdded) {
				//main-web is container,
				//pubsub ist servlet mapped by web.xml
				//control will be looked up by broadcaster to publish the mesasges
				var userId = jQuery("#edunet-context-userId").text();
				var currentGroupId = jQuery("#edunet-context-currentGroupId").text();
				var location = jQuery.url.attr('protocol') + '://'
				+ jQuery.url.attr('host') + ':' + jQuery.url.attr('port')
				+ '/main-web/services/message/receiver?channel=' + userId
				+ "&currentGroupId=" + currentGroupId;
				this.connectedEndpoint = jQuery.atmosphere.subscribe(location,
					!callbackAdded ? this.callback : null,
							jQuery.atmosphere.request = {
							transport: 'websocket'					
					}
				);
				
				this.callbackAdded = true;
			}	
		}
		
		function controlUnsubscribe(){
			this.callbackAdded = false;
			jQuery.atmosphere.unsubscribe();
		}
		
		function ControlManager(name) {
			this.suscribe = controlSubscribe;
			this.unsubscribe = controlUnsubscribe;
			this.connect = controlConnect;
			this.callback = callback;
			this.connect(name);
		
		}
		
		
		
		function post() {			
			var userId = jQuery("#edunet-context-userId").text();
			var currentGroupId= jQuery("#edunet-context-currentGroupId").text();
			var toSendMessage =  jQuery("#toSendMessage").val();
			var toMessengers= jQuery("#edunet-context-toChannels").text();
			var authorName = jQuery("#edunet-context-username").text();
			
			alert(userId+ " currentgroup : "+currentGroupId+" toSendMessage: "+ toSendMessage+" channels: "+toMessengers+" authorname : "+authorName);
			jQuery.ajax({
				url: '/main-web/services/message/receiver?channel='+userId,
				type: 'POST',
				data:  {authorId: userId, authorName: authorName, currentGroupId: currentGroupId, message: toSendMessage, toChannels: toMessengers },
				contentType:"text/html; charset=utf-8"
			}).fail(function(jqXHR, textStatus) {
		  		alert( "Request failed: " + textStatus );
			});
						
			
			
		}
		
		/**
		 * load group type
		 */
		function loadGroup(group,groupList){			
			for(var i = 0; i< group.length; i++){
				var d=document.createElement('a');
				jQuery(d).addClass("list-group-item").html('<img src="resources/img/account-icons/mail.png">'+group[i].groupName).appendTo($(groupList));
				jQuery(d).attr('href','/main-web/chat?currentGroupId='+group[i].groupId);
			}
		}
		
		function loadMessage(messages){
			for(var i = 0; i< messages.length; i++){
				var messageItem=document.createElement('div');
				jQuery(messageItem).addClass("message-item").appendTo($("#chatContent"));
				var row = document.createElement('div');
				jQuery(row).addClass("row").appendTo(messageItem);
				var avaDiv = document.createElement('div');
				jQuery(avaDiv).addClass("col-lg-1 col-xs-1").appendTo(row).html('<img src="/main-web/resources/img/avatar-big.png" class="img-responsive">');
				var messageRightDiv = document.createElement('div');
				jQuery(messageRightDiv).addClass("col-lg-11 col-xs-11").appendTo(row).html('<header class="message-header"><h3>'
						+messages[i].ownerName+'</h3>'
						+'<ul class="pull-right">'
						+'<li><a href="#"><img src="/main-web/resources/img/account-icons/translate16.png"> Nachricht übersetzen</a></li>'
						+'<li><a href="#"><img src="/main-web/resources/img/account-icons/mail-forward.png"> Weiterleiten</a></li>'
						+'<li><a href="#"><img src="/main-web/resources/img/account-icons/bin.png"> Löschen</a></li>'
						+'</ul>'						
						+'</header><div class="message-body"><p>'+messages[i].message+'</p></div>');
			}
		}
		
		function addNewMessage(newMessage){
			var messageItem=document.createElement('div');
			jQuery(messageItem).addClass("message-item").appendTo($("#chatContent"));
			var row = document.createElement('div');
			jQuery(row).addClass("row").appendTo(messageItem);
			var avaDiv = document.createElement('div');
			jQuery(avaDiv).addClass("col-lg-1 col-xs-1").appendTo(row).html('<img src="/main-web/resources/img/avatar-big.png" class="img-responsive">');
			var messageRightDiv = document.createElement('div');
			jQuery(messageRightDiv).addClass("col-lg-11 col-xs-11").appendTo(row).html('<header class="message-header"><h3>'
					+newMessage.ownerName+'</h3>'
					+'<ul class="pull-right">'
					+'<li><a href="#"><img src="/main-web/resources/img/account-icons/translate16.png"> Nachricht übersetzen</a></li>'
					+'<li><a href="#"><img src="/main-web/resources/img/account-icons/mail-forward.png"> Weiterleiten</a></li>'
					+'<li><a href="#"><img src="/main-web/resources/img/account-icons/bin.png"> Löschen</a></li>'
					+'</ul>'						
					+'</header><div class="message-body"><p>'+newMessage.message+'</p></div>');
		}
		
		
		jQuery(document).ready(function($){
				
			cm = new ControlManager(name);
		 });





/////////////////////////////Testestestestes
//
//$(function () {
//    "use strict";
//    var userId = jQuery("#edunet-context-userId").text();
//    var content = $('#content');
//
//    var socket = $.atmosphere;
//    var request = { url: 'http://localhost:8080/main-web/services/message/receiver?channel='+userId,
////                    contentType : "text/html;charset=ISO-8859-1",
////                    logLevel : 'debug',
//                    transport : 'long-polling' 
////                    	,                    
////                    maxRequest: 10,
////                    readResponseHeaders : true,
////                    fallbackTransport: 'long-polling'
//                    	};
//    
//    	
//
//    request.onOpen = function(response) {
//    	jQuery.atmosphere.log('info', ["[oneOpen]response.status: " + response.status]);
//        alert('open connection transport: '+response.transport+ ",  body :"+response.responseBody+ " state :"+response.state);
//    };
//
//    request.onMessage = function (response) {
//    	jQuery.atmosphere.log('info', ["[onMessage]response.status: " + response.status]);
//    	var data = response.responseBody;
//		if (data.length > 0) {
//			jQuery("#edunet-context-messageContentArea").val(data);						
//			var jsonData = JSON.parse(data);
//			var teacherGroup = jsonData.teacherGroup;
//			var messages = jsonData.messageOfGroup;
//			loadGroup(teacherGroup, "#teacherGroup");
//			loadMessage(messages);
//		}
//    };
//
//    request.onError = function(response) {
//        alert('Sorry, but there\'s some problem with your '
//            + 'socket or the server is down' );
//    };
//
//    request.onClose = function(response) {
//        alert(" connection will be closed");
//    };
//    
//    request.callback = function(response) {
//		// Websocket events.
//		jQuery.atmosphere.log('info', ["response.state: " + response.state]);
//		jQuery.atmosphere.log('info', ["response.transport: " + response.transport]);
//		jQuery.atmosphere.log('info', ["response.status: " + response.status]);
//	
//		if (response.transport != 'polling' && response.state == 'messageReceived') {
//			jQuery.atmosphere.log('info', ["response.responseBody: " + response.responseBody]);
//			if (response.status == 200) {
//				var data = response.responseBody;
//				if (data.length > 0) {
//					alert(data);
//				}
//			}
//		}
//	};
//
//    var subSocket = socket.subscribe(request);
//    
////    send(10,12);
////    
////    function send(aut,msg){
////    	if(subSocket !== undefined){
////    		subSocket.push(jQuery.stringifyJSON({ authorId : 1 ,groupId : 4, message :"say hello to you", toChannels: 1  }));
////    	}
////    }   
//    
//  
//    
//    
//    /////////////////////////////////////////////////////////////////////////////////////////////////
//    /**
//     * load group type
//     */
//    function loadGroup(group,groupList){			
//    	for(var i = 0; i< group.length; i++){
//    		var d=document.createElement('a');
//    		jQuery(d).addClass("list-group-item").html('<img src="resources/img/account-icons/mail.png">'+group[i].groupName).appendTo($(groupList));
//    		jQuery(d).attr('href','/main-web/chat?currentGroupId='+group[i].groupId);
//    	}
//    }
//
//    function loadMessage(messages){
//    	for(var i = 0; i< messages.length; i++){
//    		var messageItem=document.createElement('div');
//    		jQuery(messageItem).addClass("message-item").appendTo($("#chatContent"));
//    		var row = messageItem=document.createElement('div');
//    		jQuery(messageItem).addClass("row").appendTo(messageItem);
//    		var avaDiv = document.createElement('div');
//    		jQuery(messageItem).addClass("col-lg-1 col-xs-1").appendTo(row).html('<img src="/main-web/resources/img/avatar-big.png" class="img-responsive">');
//    		var messageRightDiv = document.createElement('div');
//    		jQuery(messageItem).addClass("col-lg-11 col-xs-11").appendTo(row).html('<header class="message-header"><h3>'
//    				+messages[i].ownerName+'</h3>'
//    				+'<ul class="pull-right">'
//    				+'<li><a href="#"><img src="/main-web/resources/img/account-icons/translate16.png"> Nachricht übersetzen</a></li>'
//    				+'<li><a href="#"><img src="/main-web/resources/img/account-icons/mail-forward.png"> Weiterleiten</a></li>'
//    				+'<li><a href="#"><img src="/main-web/resources/img/account-icons/bin.png"> Löschen</a></li>'
//    				+'</ul>'						
//    				+'</header><div class="message-body"><p>'+messages[i].message+'</p></div>');
//    	}
//    }
//
//
//    function post() {	
//    	
//    	var request = jQuery.ajax({
////    		url: '/main-web/chat',
//    		url: '/main-web/services/message/receiver',
//    		type: 'POST',
//    		data:  {authorId : 1 ,groupId : 4, message :"say hello to you", toChannels: 1 },
//    		contentType:"xml/application; charset=utf-8",
//    	});
//    				
//    	request.fail(function(jqXHR, textStatus) {
//      		alert( "Request failed: " + textStatus );
//    	});	
//    	
//    }
//
//});



























