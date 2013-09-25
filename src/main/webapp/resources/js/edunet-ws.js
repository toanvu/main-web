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
						jQuery("#edunet-context-messageContentArea").val(data);
						alert(data);
						var jsonData = JSON.parse(data);
						var teacherGroup = jsonData.teacherGroup;
						loadGroup(teacherGroup, "#teacherGroup");
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
				var location = jQuery.url.attr('protocol') + '://' + jQuery.url.attr('host') + ':' + jQuery.url.attr('port') + '/main-web/services/message/receiver?channel='+userId;
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
			var currentGroupId= jQuery("#currentGroupId").text();
			var toSendMessage =  jQuery("#toSendMessage").text();
			var toMessengers= jQuery("#edunet-context-channels").text();
			var channels = userId;
			var request = jQuery.ajax({
		//		url: '/main-web/chat',
				url: '/main-web/services/message/post?channel='+2,
				type: 'POST',
				data:  {authorId : userId ,groupId : 1, message :"say hello to you", toChannels: 2 },
				contentType:"xml/application; charset=utf-8",
			});
						
			request.fail(function(jqXHR, textStatus) {
		  		alert( "Request failed: " + textStatus );
			});	
			
		}
		
		function loadGroup(group,groupList){			
			for(var i = 0; i< group.length; i++){
				var d=document.createElement('a');
				jQuery(d).addClass("list-group-item").html('<img src="resources/img/account-icons/mail.png">'+group[i].groupName).appendTo($(groupList));
				jQuery(d).attr('href','/main-web/chat/'+group[i].groupId);
			}
		}
		
		
		jQuery(document).ready(function($){
				
			cm = new ControlManager(name);
		 });