package de.edunet.main.controllers.main;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import de.edunet.main.models.contact.ContactHandler;
import de.edunet.main.models.message.MessageHandler;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
    
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class); 
	
	private MessageHandler messageHandler;
	private ContactHandler contactHandler;
	
	public void setMessageHandler(MessageHandler messageHandler) {
		this.messageHandler = messageHandler;
	}
    
	public void setContactHandler(ContactHandler contactHandler) {
		this.contactHandler = contactHandler;
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(
			Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		boolean isBridgeSessionOk = messageHandler.isBridgeSessionOk(session);
		if(!isBridgeSessionOk){
			return "redirect:../home-web/";
		}
		model.addAttribute("currentUser", messageHandler.getCurrentUser(session));
		
		model.addAttribute("allCRequestsUserResponse",
				contactHandler.getRequestByUserResponse());
		
		return "home";
	}

	

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(){

		messageHandler.getLoginBean().logout();
		return "redirect:../home-web/";
	}



	
}
