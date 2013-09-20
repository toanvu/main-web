package de.edunet.main.controllers.contact;

import java.util.ArrayList;
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
import de.edunet.main.models.message.MessageHandler;
import de.edunet24.contact.entityBeans.CRequest;
import de.edunet24.contact.entityBeans.Contact;
import de.edunet24.usermanager.entityBeans.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ContactController {

	private static final Logger logger = LoggerFactory
			.getLogger(ContactController.class);
	
	private ContactHandler contactHandler;
	private MessageHandler messageHandler;
		
	public void setMessageHandler(MessageHandler messageHandler) {
		this.messageHandler = messageHandler;
	}

	public void setContactHandler(ContactHandler contactHandler) {
		this.contactHandler = contactHandler;
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		
		if (!messageHandler.isBridgeSessionOk(session)) {
			return "redirect:../home-web";
		}
		model.addAttribute("currentUser", messageHandler.getCurrentUser());
		
		logger.info("Calling message modul");
		if(!model.containsAttribute("allUsers")){
			List<User> allUsers = contactHandler.getAllUsers();
			init(model, allUsers);
		}
		
		return "contact";
	}

	@RequestMapping(value = "/contactSearchUser", method = RequestMethod.POST)
	public String searchUsers(
			@RequestParam(value = "sfirstname") String firstname,
			@RequestParam(value = "slastname") String lastname,
			Locale locale, Model model, HttpSession session) {
		
		if ((firstname == null || firstname.equals("")) && (lastname == null || lastname.equals(""))) {
			return "redirect:../../contact";
		}
		
		logger.info("start search user");

		List<User> users = contactHandler.searchUsers(firstname, lastname);
		init(model, users);
		logger.info("end search user");
		return "contact";
	}
	
	@RequestMapping(value = "/contactAddCrequest", method = RequestMethod.POST)
	public String addCRequest(
			@RequestParam(value = "userResponseId") String userId,
			@RequestParam(value = "requestMes") String message,
			Model model) {
		
		if (!contactHandler.checkPermission()) {
			return "redirect:/";
		}
		
		logger.info("start add contact request");
		
		contactHandler.addCRequest(Integer.parseInt(userId), message);
		List<User> allUsers = contactHandler.getAllUsers();
		init(model, allUsers);
		logger.info("end add contact request");
		return "contact";
	}
	
	@RequestMapping(value = "/contactlist", method = RequestMethod.GET)
	public String contactList(Model model, HttpSession session) {
		
		if (!contactHandler.checkPermission()) {
			return "redirect:/";
		}
		
		List<CRequest> allCRequests = contactHandler.getRequestByUserResponse();

		logger.info("all requests: " + allCRequests);
		logger.info("all requests size: " + allCRequests.size());

		model.addAttribute("allCRequests", allCRequests);
		return "contactlist";
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
		
		model.addAttribute("allCRequests", contactHandler.getRequestByUserResponse());
		return "contactlist";
	}
	
	public void init(Model model, List<User> users){
		
		for (User user : users) {
			if(user.getId() == messageHandler.getUserId()){
				users.remove(user);
				break;
			}
		}
		
		List<User> listContactUsers = new ArrayList<User>();
		List<User> listCRequestUsers = new ArrayList<User>();
		
		List<Contact> allContacts = contactHandler.getAllContact();
		List<CRequest> allCRequests = contactHandler.getRequestByUserRequest();
		
		logger.info("allContacts: "+ allContacts);
		logger.info("allCRequests: "+ allCRequests);
		
		
		for (User user : users) {
			
			for (Contact contact : allContacts) {
				if(contact.getUser1().getId() == user.getId() || contact.getUser2().getId() == user.getId()){
					listContactUsers.add(user);
					break;
				}		
			}
			for (CRequest crequest : allCRequests) {
//				logger.info("crequest.getResponse().getId() "+crequest.getResponse().getId());
//				logger.info("user.getId()"+user.getId());
				if(crequest.getResponse().getId() == user.getId()){
					logger.info("anfrage gesendet an "+ user.getFullName());
					listCRequestUsers.add(user);
					break;
				}
			}

		}
		logger.info("listContactUsers: "+ listContactUsers);
		logger.info("listCRequestUsers: "+ listCRequestUsers);
		
		model.addAttribute("allUsers", users);
		model.addAttribute("listContactUsers", listContactUsers);
		model.addAttribute("listCRequestUsers", listCRequestUsers);
	}
	
	
//	@RequestMapping(value = "/contact/sendrequest", method = RequestMethod.POST)
//	public String sendContactRequest(
//			@RequestParam(value = "userId") int userId, 
//			Model model, HttpSession session) {
//		
//		if (!contactHandler.checkPermission()) {
//			return "redirect:/";
//		}
//		
//		logger.info("start sending request message");
//		
//		User userResponse = contactHandler.getUserById(userId);
////		logger.info("Found user with name: "+userResponse.getFullName());
//		model.addAttribute("userResponse", userResponse);
//
//		logger.info("end sending request message");
//		return "sendrequest";
//	}
}
