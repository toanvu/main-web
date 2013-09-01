package de.edunet.main.controllers.contact;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import de.edunet.main.models.contact.ContactHandler;
import de.edunet24.contact.entityBeans.CRequest;
import de.edunet24.usermanager.entityBeans.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ContactController {

	private static final Logger logger = LoggerFactory
			.getLogger(ContactController.class);
	
	private ContactHandler contactHandler;
		
	public void setContactHandle(ContactHandler contactHandler) {
		this.contactHandler = contactHandler;
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		
		if (!contactHandler.checkPermission()) {
			return "redirect:/";
		}
		
		logger.info("Calling message modul");		
		
		List<User> allUsers = contactHandler.showAllUsers();
		model.addAttribute("allUsers", allUsers);

		return "contact";
	}

	@RequestMapping(value = "/contact/search/user", method = RequestMethod.POST)
	public String searchUsers(
			@RequestParam(value = "sfirstname") String firstname,
			@RequestParam(value = "slastname") String lastname,
			Locale locale, Model model, HttpSession session) {
		
		if (!contactHandler.checkPermission()) {
			return "redirect:/";
		}
		
		logger.info("start search user");

		List<User> users = contactHandler.searchUsers(firstname, lastname);
		model.addAttribute("allUsers", users);
		
		logger.info("end search user");
		return "contact";
	}
	
	
	@RequestMapping(value = "/contact/sendrequest", method = RequestMethod.POST)
	public String sendContactRequest(
			@RequestParam(value = "userId") int userId, 
			Model model, HttpSession session) {
		
		if (!contactHandler.checkPermission()) {
			return "redirect:/";
		}
		
		logger.info("start sending request message");
		
		User userResponse = contactHandler.getUserById(userId);
//		logger.info("Found user with name: "+userResponse.getFullName());
		model.addAttribute("userResponse", userResponse);

		logger.info("end sending request message");
		return "sendrequest";
	}
	
	@RequestMapping(value = "/contact/add/crequest", method = RequestMethod.POST)
	public String addCRequest(
			@RequestParam(value = "userId") int userId,
			@RequestParam(value = "requestMes") String message,
			Model model) {
		
		if (!contactHandler.checkPermission()) {
			return "redirect:/";
		}
		
		logger.info("start add contact request");
		
		contactHandler.addCRequest(userId, message);
		model.addAttribute("allUsers", contactHandler.getAllUsers());
		logger.info("end add contact request");
		return "contact";
	}
	
	@RequestMapping(value = "/contact/opencrequest", method = RequestMethod.GET)
	public String openCRequest(Model model, HttpSession session) {
		
		if (!contactHandler.checkPermission()) {
			return "redirect:/";
		}
		
		List<CRequest> allCRequests = contactHandler.getAllCRequests();

		logger.info("all requests: " + allCRequests);
		logger.info("all requests size: " + allCRequests.size());

		model.addAttribute("allCRequests", allCRequests);
		return "opencrequest";
	}

	@RequestMapping(value = "/contact/replycrequest", method = RequestMethod.GET)
	public String replyCRequest(
			@RequestParam(value = "userRequestId") int userRequestId,
			@RequestParam(value = "actionValue") String actionValue,
			Model model, HttpSession session) {
		
		if (!contactHandler.checkPermission()) {
			return "redirect:/";
		}
		
		contactHandler.replyCRequest(userRequestId, actionValue);
		
		model.addAttribute("allCRequests", contactHandler.getAllCRequests());
		return "opencrequest";
	}
}
