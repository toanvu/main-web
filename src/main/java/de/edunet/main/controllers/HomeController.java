package de.edunet.main.controllers;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import de.edunet.main.models.Messenger;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(
			Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);		
		return "home";
	}
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/chat/show", method = RequestMethod.GET)
	public String viewGroup(
			@RequestParam(value = "groupId") int groupId,
			@RequestParam(value = "userId") int userId,
			Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		logger.info("groupid  = "+ groupId);
		logger.info("userid  = "+ userId);
		
		Messenger messenger = new Messenger(session);
		if(groupId==0){
			int newGroupId = messenger.createNewGroup(userId);
			model.addAttribute("chatContent", messenger.update(newGroupId));
			model.addAttribute("groupId", newGroupId);			
		}else{
			model.addAttribute("chatContent", messenger.update(groupId));
			model.addAttribute("groupId", groupId);			
		}
		model.addAttribute("userId", messenger.getUserId());
		
		
		return "chat";
	}
	
	@RequestMapping(value = "/chat/send", method = RequestMethod.POST)
	public String postMessage(
			@RequestParam(value = "groupId") int groupId,
			@RequestParam(value = "newMessage") String message,			
			Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Messenger messenger = new Messenger(session);
		messenger.send(groupId, message);		
		model.addAttribute("chatContent", messenger.update(groupId));
		model.addAttribute("groupId", groupId);
		model.addAttribute("userId", messenger.getUserId());
		return "chat";
	}
	
}
