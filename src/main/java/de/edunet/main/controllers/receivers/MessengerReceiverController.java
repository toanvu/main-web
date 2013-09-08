package de.edunet.main.controllers.receivers;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.atmosphere.cpr.Broadcaster;
import org.atmosphere.cpr.BroadcasterFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import de.edunet.main.models.Data;
import de.edunet.main.models.message.MessageHandler;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/services/message/receiver")
public class MessengerReceiverController {

	private static final Logger logger = LoggerFactory
			.getLogger(MessengerReceiverController.class);

	private MessageHandler messenger;
	private Gson gson = new Gson();

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "", method = RequestMethod.POST)
	public @ResponseBody Data home(			
//			@RequestParam("authorId") String authorId,
//			@RequestParam("groupId") int groupId,
//			@RequestParam("message") String message,
			Locale locale, Model model, HttpSession session) {		
		Data data =  new Data();
		
		String authorId = "1";
		String message = "halalalalal";
		int groupId = 23;
		
		data.setAuthor(""+authorId);
		data.setMessage(message);
		data.setGroupId(groupId);
		
		String dataInJSONFormat = gson.toJson(data);
		notifySubscribers(dataInJSONFormat);
		return data;
	}

	private void notifySubscribers(String state) {
		Broadcaster broadcaster = BroadcasterFactory.getDefault().lookup("control", true);
		if (broadcaster != null) broadcaster.broadcast(state);
	}

}
