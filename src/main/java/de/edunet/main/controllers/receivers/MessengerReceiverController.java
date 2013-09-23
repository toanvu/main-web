package de.edunet.main.controllers.receivers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.PathParam;

import org.atmosphere.cpr.ApplicationConfig;
import org.atmosphere.cpr.AtmosphereRequest;
import org.atmosphere.cpr.AtmosphereResource;
import org.atmosphere.cpr.AtmosphereResourceFactory;
import org.atmosphere.cpr.AtmosphereResponse;
import org.atmosphere.cpr.Broadcaster;
import org.atmosphere.cpr.BroadcasterFactory;
import org.atmosphere.cpr.HeaderConfig;
import org.atmosphere.cpr.MetaBroadcaster;
import org.atmosphere.websocket.WebSocketEventListenerAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.tags.ParamAware;

import com.google.gson.Gson;

import de.edunet.main.models.message.MessageHandler;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MessengerReceiverController {

	private static final Logger logger = LoggerFactory
			.getLogger(MessengerReceiverController.class);

	
	private Gson gson = new Gson();

	/**
	 * A BroadcasterFactory (injected as a singleton) that enables client code
	 * to look up broadcasters.
	 */
	private final BroadcasterFactory bf;
	
	@Inject
	private final MessageHandler messageHanlder;
	

	/**
	 * Instantiates a new instance of the CometController class.
	 * 
	 * @param bf
	 *            A BroadcasterFactory (injected as a singleton) that enables
	 *            client code to look up broadcasters.
	 */
	@Autowired
	public MessengerReceiverController(BroadcasterFactory bf, MessageHandler messageHandler) {
		this.messageHanlder = messageHandler;
		this.bf = bf;
	}


	

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value="/services/message/receiver/{channel}" , method = RequestMethod.GET)
	@ResponseBody
	public void listen(AtmosphereResource aResource,HttpSession session , @PathParam(value="channel") String channel){
//			   @RequestParam int authorId,
//			   @RequestParam String toChannels,
//			   @RequestParam int groupId,
//			   @RequestParam String message) {
		AtmosphereRequest request = aResource.getRequest();
		AtmosphereResponse response = aResource.getResponse();
//		String atmosphereId = response.getHeader(ATMOSPHERE_TRACKING_ID);
		String method = request.getMethod();

		
		// Suspend the response.
		if ("GET".equalsIgnoreCase(method)) {			
			// Log all events on the console, including WebSocket events.
			aResource.addEventListener(new WebSocketEventListenerAdapter());

			response.setContentType("text/html;charset=ISO-8859-1");
			response.setHeader("Access-Control-Expose-Headers", HeaderConfig.X_ATMOSPHERE_TRACKING_ID);
			
		
			
			String atmoTransport = request
					.getHeader(HeaderConfig.X_ATMOSPHERE_TRANSPORT);

			
			if (atmoTransport != null
					&& !atmoTransport.isEmpty()
					&& atmoTransport
							.equalsIgnoreCase(HeaderConfig.LONG_POLLING_TRANSPORT)) {

				request.setAttribute(ApplicationConfig.RESUME_ON_BROADCAST,
						Boolean.TRUE);
				aResource.suspend(-1, false);				
				

			} else {
				// connection etablisched				
				aResource.suspend(-1);
				
				Broadcaster broadcast = this.bf.getDefault().lookup(getLookupBroadCaster(channel,true), true);
				broadcast.broadcast(" atmo key ");
			}
		}		
		
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value="/services/message/post/{channel}", method = RequestMethod.POST)
	@ResponseBody
	public void post(AtmosphereResource aResource,HttpSession session , @PathParam(value="channel") String channel){
//			   @RequestParam int authorId,
//			   @RequestParam String toChannels,
//			   @RequestParam int groupId,
//			   @RequestParam String message) {
		AtmosphereRequest request = aResource.getRequest();
		AtmosphereResponse response = aResource.getResponse();
		String method = request.getMethod();
		
		//post poart
		if ("POST".equalsIgnoreCase(method)) {	
			String atmosphereId = request.getHeader(HeaderConfig.X_ATMOSPHERE_TRACKING_ID);
//			 if (atmosphereId == null || atmosphereId.isEmpty())
//		    {
//		        log.error("Cannot add subscription, as the atmosphere tracking ID was not found");
//		       
//		    }
			
			AtmosphereResource originalResource = AtmosphereResourceFactory.getDefault().find(atmosphereId);
			Broadcaster broadcast = this.bf.getDefault().lookup(getLookupBroadCaster(channel,true), true);

			String postedUrl = "";
			try {
				postedUrl = request.getReader().readLine();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Map<String, String> parameters = this.getQueryMap(postedUrl);
			
			if (parameters.get("authorId") != null
					&& parameters.get("groupId") != null
					&& parameters.get("message") != null && parameters.get("toChannels") != null ) {
				
				broadcast.broadcast(parameters.get("message"),originalResource);
			}else{
				System.out.println("url has no parameters :"+messageHanlder.getCurrentUser(session).getUsername());				
			}
		}		
	}

	private Map<String, String> getQueryMap(String query) {
		String[] params = query.split("&");
		Map<String, String> map = new HashMap<String, String>();
		for (String param : params) {
			if (param.split("=").length > 1) {
				String name = param.split("=")[0];
				String value = param.split("=")[1];
				map.put(name, value);
			}
		}
		return map;
	}

	private String getLookupBroadCaster(String channel, boolean get){
		if(get){
			return "/main-web/services/message/receiver/"+channel;
		}
		
		return  "/main-web/services/message/post/"+channel;
	}

}


