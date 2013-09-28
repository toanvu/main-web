package de.edunet.main.services;

import java.io.IOException;
import java.util.Date;

import org.atmosphere.config.service.AtmosphereHandlerService;
import org.atmosphere.cpr.AtmosphereRequest;
import org.atmosphere.cpr.AtmosphereResource;
import org.atmosphere.cpr.AtmosphereResource.TRANSPORT;
import org.atmosphere.cpr.Broadcaster;
import org.atmosphere.cpr.BroadcasterFactory;
import org.atmosphere.handler.AbstractReflectorAtmosphereHandler;
import org.atmosphere.websocket.WebSocketEventListenerAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


//public class ChatAtmosphereHandler implements AtmosphereHandler {
public class Chat extends AbstractReflectorAtmosphereHandler {
	private static final Logger logger = LoggerFactory.getLogger(Chat.class);

	@Override
	public void onRequest(AtmosphereResource r) throws IOException {
		r.addEventListener(new WebSocketEventListenerAdapter());
		AtmosphereRequest req = r.getRequest();
      String method = req.getMethod();
      Broadcaster b = BroadcasterFactory.getDefault().lookup("subject", true);

      if(method.equalsIgnoreCase("GET")){  
      	b.addAtmosphereResource(r);
      	r.setBroadcaster(b);
      	r.resumeOnBroadcast(r.transport() == TRANSPORT.LONG_POLLING).suspend(-1);
      }else if(method.equalsIgnoreCase("POST")){
      	String body = req.getReader().readLine().trim();
      	String author = body.substring(body.indexOf(":") + 2, body.indexOf(",") - 1);
          String message = body.substring(body.lastIndexOf(":") + 2, body.length() - 2);
          b.broadcast(new Data(author, message).toString());		
      }
	}
	
	private final static class Data {

      private final String text;
      private final String author;

      public Data(String author, String text) {
          this.author = author;
          this.text = text;
      }

      public String toString() {
          return "{ \"text\" : \"" + text + "\", \"author\" : \"" + author + "\" , \"time\" : " + new Date().getTime() + "}";
      }
  }

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
}
