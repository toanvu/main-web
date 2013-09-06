//package de.edunet.main.services;
//
//import java.io.IOException;
//
//import org.atmosphere.config.service.AtmosphereHandlerService;
//import org.atmosphere.cpr.AtmosphereHandler;
//import org.atmosphere.cpr.AtmosphereRequest;
//import org.atmosphere.cpr.AtmosphereResource;
//import org.atmosphere.cpr.AtmosphereResourceEvent;
//import org.atmosphere.cpr.AtmosphereResponse;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//
//import de.edunet.main.controllers.main.HomeController;
//import de.edunet.main.models.Data;
//
//@AtmosphereHandlerService(path="/chat")
//public class WebSocketHandler implements AtmosphereHandler{
//	private static final Logger log = LoggerFactory.getLogger(WebSocketHandler.class);
//	
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
//		
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
//
//}
