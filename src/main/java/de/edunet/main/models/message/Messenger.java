package de.edunet.main.models.message;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import de.edunet24.dev.utils.handlers.MessageHandler;
import de.edunet24.dev.utils.handlers.UserHandler;
import de.edunet24.message.entityBeans.Message;

public class Messenger {
	HttpSession session;
	UserHandler userHandler;
	MessageHandler messageHandler;
	private static final Logger logger = LoggerFactory
			.getLogger(Messenger.class);

	public Messenger(HttpSession session) {
		this.session = session;
		userHandler = new UserHandler(this.session);
		messageHandler = new MessageHandler();
		// init bean for the first time
		messageHandler.getIMessage().initilizeBean(
				userHandler.getILogin().getUser());
	}

	/**
	 * 
	 * @param userId
	 * @return groupid
	 */
	public int createNewGroup(int userId) {
		return messageHandler.getIMessage()
				.chatWith(userHandler.getIUsermanager().getUser(userId))
				.getId();

	}

	public List<Message> update(int groupId) {
		// update current group for MessageBean
		messageHandler.getIMessage().updateCurrentGroup(groupId);		
		List<Message> messageByGroup = messageHandler.getIMessage()
				.getMessagesOfCurrentGroup(
						messageHandler.getIMessage().getCurrentGroup());

		return messageByGroup;
	}

	public void send(int groupId, String text) {
		if(groupId>0){
			// update current group for MessageBean
			messageHandler.getIMessage().updateCurrentGroup(groupId);		
			messageHandler.getIMessage().sendMessage(text);
		}
	}
	
	public int getUserId(){
		return userHandler.getILogin().getUser().getId();
	}
}
