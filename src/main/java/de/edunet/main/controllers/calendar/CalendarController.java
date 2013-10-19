package de.edunet.main.controllers.calendar;

import java.util.HashMap;
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
import de.edunet24.calendar.entityInterface.IAppointment;
import de.edunet24.dev.utils.api.AppointmentContainer;
import de.edunet24.dev.utils.api.CalendarAPI;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CalendarController {

	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);

	@RequestMapping(value = "/calendar", method = RequestMethod.POST)
	public String home(Model model, HttpSession session, @RequestParam(required = false) String ownerId, @RequestParam(required = false) String date,
			@RequestParam(required = false) String title, @RequestParam(required = false) String notice, @RequestParam(required = false) String share,
			@RequestParam(required = false) String owner) throws Exception {

		Map<String, String> calendarKeys = new HashMap<String, String>();
		calendarKeys.put("ownerId", "1");
		calendarKeys.put("title", title);
		calendarKeys.put("date", date);
		calendarKeys.put("notice", "GUI");
		calendarKeys.put("share", "98989,000");
		calendarKeys.put("owner", "noface");

		CalendarAPI calendarAPI = new CalendarAPI("1", calendarKeys);
		calendarAPI.setRootUrl("http://localhost:8080/restapi/test/calendar/add");
		AppointmentContainer ac = calendarAPI.parseObject();
		model.addAttribute("appointmentContainer", ac);

		// if (date != null && title != null) {
		// appointmentBean.add(notice, owner, ownerId, share, title, date);
		// appointmentBean.add("gui test", "noface", "1", "123456", title, date);
		System.out.println("Termin wurde hinzugefügt." + title + " " + date);

		return "calendar";
	}
}
