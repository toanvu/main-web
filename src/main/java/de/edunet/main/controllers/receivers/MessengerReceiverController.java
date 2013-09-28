package de.edunet.main.controllers.receivers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.TimeUnit;

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
import org.atmosphere.cpr.BroadcasterLifeCyclePolicy;
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
import de.edunet24.dev.utils.common.EUtils;
import de.edunet24.message.entityBeans.EGroup;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MessengerReceiverController  {

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
	
	@RequestMapping(value = "/chat")
	public String chat(Locale locale, Model model,HttpSession session, @RequestParam(value="currentGroupId") int currentGroupId){
		EGroup currentGroup = messageHanlder.getMessageBean().getGroup(currentGroupId);
		model.addAttribute("currentUser",messageHanlder.getCurrentUser(session));
		model.addAttribute("currentGroup", currentGroup);
		model.addAttribute("toChannels",EUtils.buildChannels(currentGroup.getMessengers()));
		return "chat";
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/services/message/receiver")
	@ResponseBody
	public void listen(AtmosphereResource aResource, HttpSession session,
			@RequestParam String channel,@RequestParam(value="currentGroupId", required=false) Integer currentGroupId) {

		AtmosphereRequest request = aResource.getRequest();
		AtmosphereResponse response = aResource.getResponse();
		String method = request.getMethod();
		
		
		// ////////////////broadcaster////////////////////////
		// lookup a broadcast
		Broadcaster bc = this.bf.lookup("bc_" + channel);
		// if no was found then create a new one and add to global
		// broadcaster with unique name to lookup later
		if (bc == null) {
			bc = this.bf.get();

			bc.setBroadcasterLifeCyclePolicy(BroadcasterLifeCyclePolicy.EMPTY);
			
			this.bf.add(bc, "bc_" + channel);
		}		
		
		
		// ///////////////////////////////////////////////////

		
		// Suspend the response.
		if ("GET".equalsIgnoreCase(method)) {
			// Log all events on the console, including WebSocket events.
			aResource.addEventListener(new WebSocketEventListenerAdapter());

			//do no delete
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
			Map<String, String> parameters = EUtils.getQueryMap(listenUrl);
			String toTransferMessage ="";
			WSMessageContainer messageContainer = new WSMessageContainer(messageHanlder.getCurrentUser(session).getUsername());
			
			if (currentGroupId != null) {
				
				
//				//create fake message
//				messageHanlder.send(4, "say something 1", session);
				
				messageContainer.createMessageList(messageHanlder
						.getMessageOfCurrentGroup(Integer.valueOf(currentGroupId),session));	
				
			}			
			
			//getAll groups
			messageContainer.createTeacherGroup(messageHanlder.getTeacherGroup(session));
			messageContainer.createParentGroup(messageHanlder.getParentGroup(session));
			messageContainer.createOtherGroup(messageHanlder.getOtherGroup(session));
			
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
				if(aResource.isSuspended()){
					bc.addAtmosphereResource(aResource);
				}else{
					aResource.suspend(-1);
					bc.addAtmosphereResource(aResource);
				}	
				
				
				//one bc has more resource, each new atmosphere resource created by a connection / refresh ....			
//				bc.addAtmosphereResource(aResource);
//				aResource.setBroadcaster(bc).suspend(-1);				
				System.out.println("is suspended : "+aResource.isSuspended());
				

			} else {
				// connection etablisched				
				if(aResource.isSuspended()){
					bc.addAtmosphereResource(aResource);
				}else{
					aResource.suspend(-1);
					bc.addAtmosphereResource(aResource);
				}
				
				//one bc has more resource, each new atmosphere resource created by a connection / refresh ....				
				if(toTransferMessage.length()>0){
					bc.broadcast(toTransferMessage);
				}
			}
			
		}
		
		////////////////////////////////////////////////
		////////////////////////////////////////////////
		////////////////////////////////////////////////
		////////////////////////////////////////////////
		// post poart
		if ("POST".equalsIgnoreCase(method)) {

			

			String postedUrl = "";
			try {
				postedUrl = request.getReader().readLine();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// get parameter from request url
			Map<String, String> parameters = EUtils.getQueryMap(postedUrl);
			System.out.println("posted Url : "+postedUrl +"authorId: "+parameters.get("authorId"));
//			if (parameters.get("authorId") != null
//					&& parameters.get("groupId") != null
//					&& parameters.get("message") != null
//					&& parameters.get("toChannels") != null) {
//				System.out.println("try to broadcast something : "
//						+ parameters.get("toChannels"));
//				bc.broadcast(" try to broadcast somthing");
//
//			} else {
//				System.out.println("url has no parameters :"
//						+ messageHanlder.getCurrentUser(session).getUsername());
//			}
			
			System.out.println("end post request processing: "+bc.getID());
			bc.broadcast("broadcast something to channel");
			
		}

	}

	

}
