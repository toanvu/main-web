package de.edunet.main.controllers.main;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

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
import de.edunet.main.models.spring.session.User;
import de.edunet24.calendar.entityInterface.IAppointment;
import de.edunet24.dev.utils.api.CalendarAPI;
import de.edunet24.dev.utils.http.EResponse;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger LOG = LoggerFactory.getLogger(HomeController.class);

	private MessageHandler messageHandler;
	private ContactHandler contactHandler;
	private IAppointment appointmentBean;
	private User user; 

	public void setMessageHandler(MessageHandler messageHandler) {
		this.messageHandler = messageHandler;
	}

	public void setContactHandler(ContactHandler contactHandler) {
		this.contactHandler = contactHandler;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {		
		boolean isBridgeSessionOk = messageHandler.isBridgeSessionOk(session);
		if (!isBridgeSessionOk) {
			return "redirect:../home-web/";
		}
		model.addAttribute("currentUser", messageHandler.getCurrentUser(session));

		model.addAttribute("allCRequestsUserResponse", contactHandler.getRequestByUserResponse());
	
		LOG.info("user name for firsttime and time after : "+user.getUsername());
		System.out.println("user name for firsttime and time after : "+user.getUsername());
		if(user.getUsername() == null){
			user.setUsername(messageHandler.getCurrentUser(session).getUsername());
		}
		
		
		
		return "home";
	}

	@RequestMapping(value = "/calendar")
	public String calendar(@RequestParam(required = false) String ownerId, @RequestParam(required = false) String date,
			@RequestParam(required = false) String title, @RequestParam(required = false) String notice, @RequestParam(required = false) String share,
			@RequestParam(required = false) String owner) throws Exception {

		Map<String, String> calendarKeys = new HashMap<String, String>();
		calendarKeys.put("ownerId", "1");
		CalendarAPI calendarAPI = new CalendarAPI("", calendarKeys);
		calendarAPI.setRootUrl("http://localhost:8080/restapi/calendar");

		if (date != null && title != null) {
			// appointmentBean.add(notice, owner, ownerId, share, title, date);
			appointmentBean.add("gui test", "noface", "1", "123456", title, date);
			System.out.println("Termin wurde hinzugefügt.");
		}

		return "calendar";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		messageHandler.logout(session);
		return "redirect:../home-web/";
	}

}
