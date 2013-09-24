package de.edunet.main.controllers.receivers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
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

import org.atmosphere.websocket.WebSocketEventListenerAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.tags.ParamAware;

import com.google.gson.Gson;

import de.edunet.main.models.message.MessageHandler;
import de.edunet.main.models.message.WSMessageContainer;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MessengerReceiverController {

	private static final Logger logger = LoggerFactory
			.getLogger(MessengerReceiverController.class);

	private Gson gson = new Gson();

	private final MessageHandler messageHanlder;

	/**
	 * A BroadcasterFactory (injected as a singleton) that enables client code
	 * to look up broadcasters.
	 */
	private final BroadcasterFactory bf;

	/**
	 * Instantiates a new instance of the CometController class.
	 * 
	 * @param bf
	 *            A BroadcasterFactory (injected as a singleton) that enables
	 *            client code to look up broadcasters.
	 */
	@Autowired
	public MessengerReceiverController(BroadcasterFactory bf,
			MessageHandler messageHandler) {
		this.messageHanlder = messageHandler;
		this.bf = bf;
	}
	
	@RequestMapping(value = "/chat/{currentGroupId}")
	public String chat(Locale locale, Model model,HttpSession session, @PathParam(value="currentGroupId") int currentGroupId){
		model.addAttribute("currentGroupId", currentGroupId);
		return "chat";
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/services/message/receiver", method = RequestMethod.GET)
	@ResponseBody
	public void listen(AtmosphereResource aResource, HttpSession session,
			@RequestParam String channel) {

		AtmosphereRequest request = aResource.getRequest();
		AtmosphereResponse response = aResource.getResponse();
		String method = request.getMethod();

		//lookup a broadcast 
		Broadcaster bc = this.bf.getDefault().lookup("bc_" + channel);
		//if no was found then create a new one and add to global broadcaster with unique name to lookup later
		if (bc == null) {
			bc = this.bf.getDefault().get();
			aResource.setBroadcaster(bc);
			this.bf.getDefault().add(bc, "bc_" + channel);
		}

		// Suspend the response.
		if ("GET".equalsIgnoreCase(method)) {
			// Log all events on the console, including WebSocket events.
			aResource.addEventListener(new WebSocketEventListenerAdapter());

			response.setContentType("text/html;charset=ISO-8859-1");
			response.setHeader("Access-Control-Expose-Headers",
					HeaderConfig.X_ATMOSPHERE_TRACKING_ID);

			String listenUrl = "";
			try {
				listenUrl = request.getReader().readLine();
			} catch (IOException e) {
				logger.error("something wrong with request URL: "
						+ e.getMessage());
			}

			// get parameter from request url
			Map<String, String> parameters = this.getQueryMap(listenUrl);
			String toTransferMessage ="";
			WSMessageContainer messageContainer = new WSMessageContainer();
			if (parameters.get("currentGroupId") != null) {
				
				messageContainer.setMessageOfGroup(messageHanlder
						.getMessageOfCurrentGroup(Integer.valueOf(parameters
								.get("currentGroupId"))));				
			}
			
			//getAll groups
			messageContainer.setTeacherGroup(messageHanlder.getTeacherGroup(session));
			messageContainer.setParentGroup(messageHanlder.getParentGroup(session));
			messageContainer.setOtherGroup(messageHanlder.getOtherGroup(session));
			
			//transform to json
			toTransferMessage = gson.toJson(messageContainer);

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

				if(toTransferMessage.length()>0){
					bc.broadcast(toTransferMessage);
				}
			}
		}

	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/services/message/post", method = RequestMethod.POST)
	@ResponseBody
	public void post(AtmosphereResource aResource, HttpSession session,
			@RequestParam String channel) {
		AtmosphereRequest request = aResource.getRequest();
		AtmosphereResponse response = aResource.getResponse();
		String method = request.getMethod();

		// post poart
		if ("POST".equalsIgnoreCase(method)) {
			Broadcaster bc = this.bf.getDefault().lookup("bc_" + channel);

			String postedUrl = "";
			try {
				postedUrl = request.getReader().readLine();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// get parameter from request url
			Map<String, String> parameters = this.getQueryMap(postedUrl);

			if (parameters.get("authorId") != null
					&& parameters.get("groupId") != null
					&& parameters.get("message") != null
					&& parameters.get("toChannels") != null) {
				System.out.println("try to broadcast something : "
						+ parameters.get("toChannels"));
				bc.broadcast(" try to broadcast somthing");

			} else {
				System.out.println("url has no parameters :"
						+ messageHanlder.getCurrentUser(session).getUsername());
			}
		}
	}

	private Map<String, String> getQueryMap(String query) {
		Map<String, String> map = new HashMap<String, String>();
		if(query == null || query ==""){
			return map;
		}
		String[] params = query.split("&");		
		for (String param : params) {
			if (param.split("=").length > 1) {
				String name = param.split("=")[0];
				String value = param.split("=")[1];
				map.put(name, value);
			}
		}
		return map;
	}

	private String getLookupBroadCaster(String channel, boolean get) {
		if (get) {
			return "/main-web/services/message/receiver?channel=" + channel;
		}

		return "/main-web/services/message/post/" + channel;
	}

}
