package de.edunet.main.controllers.main;

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

import de.edunet.main.models.contact.ContactHandler;
import de.edunet.main.models.message.MessageHandler;
import de.edunet24.dev.utils.api.CalendarAPI;

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
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		boolean isBridgeSessionOk = messageHandler.isBridgeSessionOk(session);
		if (!isBridgeSessionOk) {
			return "redirect:../home-web/";
		}
		model.addAttribute("currentUser", messageHandler.getCurrentUser(session));

		model.addAttribute("allCRequestsUserResponse", contactHandler.getRequestByUserResponse());
		Map<String, String> calendarKeys = new HashMap<String, String>();
		calendarKeys.put("ownerId", "1");

		// Test rest API Calendar
		try {
			CalendarAPI calendarAPI = new CalendarAPI("", calendarKeys);
			calendarAPI.setRootUrl("http://localhost:8080/restapi/calendar/search");

			System.out.println("AppointmentContainer and notice of response from search appointment with ownerId = 1 ---"
					+ calendarAPI.parseObject().getEntries().get(0).getNotice());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "home";
	}

	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public String calendar(HttpSession session) {

		return "calendar";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		messageHandler.logout(session);
		return "redirect:../home-web/";
	}

}
