package de.edunet.main.services;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.atmosphere.cpr.ApplicationConfig;
import org.atmosphere.cpr.AtmosphereHandler;
import org.atmosphere.cpr.AtmosphereRequest;
import org.atmosphere.cpr.AtmosphereResource;
import org.atmosphere.cpr.AtmosphereResourceEvent;
import org.atmosphere.cpr.AtmosphereResponse;
import org.atmosphere.cpr.Broadcaster;
import org.atmosphere.cpr.BroadcasterFactory;
import org.atmosphere.cpr.HeaderConfig;
import org.atmosphere.handler.AbstractReflectorAtmosphereHandler;
import org.atmosphere.websocket.WebSocketEventListenerAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import de.edunet.main.models.Data;


public class WebSocketHandler extends AbstractReflectorAtmosphereHandler{
	private static final Logger log = LoggerFactory.getLogger(WebSocketHandler.class);
	
	@Override
	public void onRequest(AtmosphereResource event) throws IOException {
	
	  HttpServletRequest req = event.getRequest();
	  HttpServletResponse res = event.getResponse();
	  String method = req.getMethod();
	
	  // Suspend the response.
	  if ("GET".equalsIgnoreCase(method)) {
		  
		  // Log all events on the console, including WebSocket events.
          event.addEventListener(new WebSocketEventListenerAdapter());
          
	      res.setContentType("text/html;charset=ISO-8859-1");
	      
	      Broadcaster b = lookupBroadcaster(req.getPathInfo());	      
	      event.setBroadcaster(b);	      
	      String atmoTransport = req.getHeader(HeaderConfig.X_ATMOSPHERE_TRANSPORT);
	      
	      if (atmoTransport != null && !atmoTransport.isEmpty() && 
	    		  atmoTransport.equalsIgnoreCase(HeaderConfig.LONG_POLLING_TRANSPORT)) {
	    	  
	          req.setAttribute(ApplicationConfig.RESUME_ON_BROADCAST, Boolean.TRUE);
	          event.suspend(-1, false);
	          
	      } else {
	          event.suspend(-1);
	      }
	  } else if ("POST".equalsIgnoreCase(method)) {		
		  
	      Broadcaster b = lookupBroadcaster(req.getPathInfo());
	
	      String message = req.getReader().readLine();
	
	      if (message != null && message.indexOf("message") != -1) {
	          b.broadcast(message.substring("message=".length()));
	      }
	  }
	}
	
	@Override
	public void destroy() {
		// empty
	}
	
	Broadcaster lookupBroadcaster(String pathInfo) {
		String[] decodedPath = pathInfo.split("/");
		Broadcaster b = BroadcasterFactory.getDefault().lookup(decodedPath[decodedPath.length - 1], true);
		return b;
	}

	

//	@Override
//	public void destroy() {
//		 log.info("destroy connection");
//		
//	}
//
//	@Override
//	public void onRequest(AtmosphereResource resource) throws IOException {
//		 AtmosphereRequest req = resource.getRequest();
//		       
//          // First, tell Atmosphere to allow bi-directional communication by suspending.
//          if (req.getMethod().equalsIgnoreCase("GET")) {
//              // We are using HTTP long-polling with an invite timeout
//        	  resource.suspend();
//          // Second, broadcast message to all connected users.
//          } else if (req.getMethod().equalsIgnoreCase("POST")) {
//        	  resource.getBroadcaster().broadcast(req.getReader().readLine().trim());
//          } 		
//	}
//
//	@Override
//	public void onStateChange(AtmosphereResourceEvent event) throws IOException {
//		 AtmosphereResource resource = event.getResource();
//		 AtmosphereResponse response = resource.getResponse();
//		
//		 if (resource.isSuspended()) {
//	       String body = event.getMessage().toString();	              
//	              // Simple JSON -- Use Jackson for more complex structure
//	              // Message looks like { "author" : "foo", "message" : "bar" }
//	              String author = body.substring(body.indexOf(":") + 2, body.indexOf(",") - 1);
//	              String message = body.substring(body.lastIndexOf(":") + 2, body.length() - 2);
//	              
//	              response.getWriter().write(new Data(author, message).toString());
//	              switch (resource.transport()) {
//	                  case JSONP:
//	                  case LONG_POLLING:
//	                      event.getResource().resume();
//	                      break;
//	                  case WEBSOCKET :
//	                  case STREAMING:
//	                	  response.getWriter().flush();
//	                      break;
//	              }       
//          } else if (!event.isResuming()){
//              event.broadcaster().broadcast(new Data("Someone", "say bye bye!").toString());
//          }   
//	}

}
