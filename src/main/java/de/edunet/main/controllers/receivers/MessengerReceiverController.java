package de.edunet.main.controllers.receivers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.atmosphere.cpr.ApplicationConfig;
import org.atmosphere.cpr.AtmosphereResource;
import org.atmosphere.cpr.Broadcaster;
import org.atmosphere.cpr.BroadcasterFactory;
import org.atmosphere.cpr.HeaderConfig;
import org.atmosphere.websocket.WebSocketEventListenerAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		this.initialiseBroadcaster();
	}

	/**
	 * Start broadcasting the time every 5 seconds using the /comet/time
	 * broadcaster.
	 */
	private void initialiseBroadcaster() {
		final Broadcaster b = this.bf.lookup("/main-web/services/message/receiver?channel=4", true);
	}
	

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/services/message/receiver")
	@ResponseBody
	public void listen(AtmosphereResource aResource,HttpSession session){
//			   @RequestParam int authorId,
//			   @RequestParam String toChannels,
//			   @RequestParam int groupId,
//			   @RequestParam String message) {
		HttpServletRequest request = aResource.getRequest();
		HttpServletResponse response = aResource.getResponse();
		String method = request.getMethod();

		String channel = "4";
		// Suspend the response.
		if ("GET".equalsIgnoreCase(method)) {

			// Log all events on the console, including WebSocket events.
			aResource.addEventListener(new WebSocketEventListenerAdapter());

			response.setContentType("text/html;charset=ISO-8859-1");

			System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbb "+getLookupBroadCaster(channel));
			Broadcaster broadcast = BroadcasterFactory.getDefault().lookup("/main-web/services/message/receiver?channel=4", true);
			aResource.setBroadcaster(broadcast);
			String atmoTransport = request
					.getHeader(HeaderConfig.X_ATMOSPHERE_TRANSPORT);

			if (atmoTransport != null
					&& !atmoTransport.isEmpty()
					&& atmoTransport
							.equalsIgnoreCase(HeaderConfig.LONG_POLLING_TRANSPORT)) {

				request.setAttribute(ApplicationConfig.RESUME_ON_BROADCAST,
						Boolean.TRUE);
				aResource.suspend(-1, false);				
				broadcast.broadcast("hello");

			} else {
				// connection etablisched				
				aResource.suspend(-1);		
				broadcast.broadcast("hello");
			}
		}		
		
		//post poart
		if ("POST".equalsIgnoreCase(method)) {
			System.out.println("post something");
			Broadcaster broadcast = BroadcasterFactory.getDefault().lookup("/main-web/services/message/receiver?channel=4", true);

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
					&& parameters.get("message") != null) {
				broadcast.broadcast(parameters.get("authorId"));
			}else{
				broadcast.broadcast("aaaaaaaaaaaaaaaaaaaa"+messageHanlder.getCurrentUser(session).getUsername());
			}
		}		
	}

	private static Map<String, String> getQueryMap(String query) {
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

	private String getLookupBroadCaster(String channel){
		return "/main-web/services/message/receiver?channel="+channel;
	}

}


