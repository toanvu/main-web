//create websocket 	  
var socket = $.atmosphere;

//create request
      var request = { url: 'http://localhost:8080/home-web/chat',
                      contentType : "application/json",
                      logLevel : 'debug',
                      transport : 'websocket' ,
                      fallbackTransport: 'long-polling'};
  
//onOpen  
      request.onOpen = function(response) {
          content.html($('<p>', { text: 'Atmosphere connected using ' + response.transport }));
          input.removeAttr('disabled').focus();
          status.text('Choose name:');
      };

//onMessage. message come from server
      request.onMessage = function (response) {
          var message = response.responseBody;
          try {
              var json = JSON.parse(message);
          } catch (e) {
              console.log('This doesnf2379804bc0adb0c2c6c1ac9450b0a838eedecdf#39;t look like a valid JSON: ', message.data);
              return;
          }
  
          if (!logged) {
              logged = true;
              status.text(myName + ': ').css('color', 'blue');
              input.removeAttr('disabled').focus();
          } else {
              input.removeAttr('disabled');
  
              var me = json.author == author;
              var date =  typeof(json.time) == 'string' ? parseInt(json.time) : json.time;
              addMessage(json.author, json.text, me ? 'blue' : 'black', new Date());
          }
      };
 
//if request has some erros
      request.onError = function(response) {
          content.html($('<p>', { text: 'Sorry, but theref2379804bc0adb0c2c6c1ac9450b0a838eedecdf#39;s some problem with your '
              + 'socket or the server is down' }));
      };
      
 //subcribe 
      var subSocket = socket.subscribe(request);
  
 //push message to server     
      input.keydown(function(e) {
          if (e.keyCode === 13) {
              var msg = $(this).val();
  
              // First message is always the author's name
              if (author == null) {
                  author = msg;
              }
  
              subSocket.push(JSON.stringify({ author: author, message: msg }));
              $(this).val('');
  
              input.attr('disabled', 'disabled');
              if (myName === false) {
                  myName = msg;
              }
          }
      });
      
 //show message from server to screen
      
      function addMessage(author, message, color, datetime) {
          content.append('<p><span style="color:' + color + '">' + author + '</span> @ ' +
              + (datetime.getHours() < 10 ? '0' + datetime.getHours() : datetime.getHours()) + ':'
              + (datetime.getMinutes() < 10 ? '0' + datetime.getMinutes() : datetime.getMinutes())
              + ': ' + message + '</p>');
      }