package de.edunet.main.models.message;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import de.edunet24.common.GroupsByRole;
import de.edunet24.dev.utils.handlers.MessageHandler;
import de.edunet24.dev.utils.handlers.UserHandler;
import de.edunet24.message.entityBeans.EGroup;
import de.edunet24.message.entityBeans.Message;
import de.edunet24.usermanager.entityBeans.User;

public class Messenger {
	HttpSession session;
	UserHandler userHandler;
	MessageHandler messageHandler;
	Map<Integer,GroupsByRole> groupsByRoles ;
	
	private static final Logger logger = LoggerFactory
			.getLogger(Messenger.class);

	public Messenger(HttpSession session) {
		this.session = session;
		userHandler = new UserHandler(this.session);
		messageHandler = new MessageHandler();
		// init bean for the first time
		messageHandler.getIMessage().initilizeBean(
				userHandler.getILogin().getUser());
		this.groupsByRoles = this.getGroupByRoles();
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
	
	public User getCurrentUser(){
		return userHandler.getILogin().getUser();
	}
	
	/**
	 * get all groups for each usertype of current user
	 * @return
	 */
	private Map<Integer,GroupsByRole> getGroupByRoles(){
		logger.info("current user is :"+ this.getCurrentUser().getUsername());
		return messageHandler.getIMessage().getGroupsByRole();
	}
	
	/**
	 * get teacher groups
	 * @return
	 */
	public List<EGroup> getTeacherGroup(){		
		return getGroupByRoles().get(1).getValue();
	}
	
	public List<EGroup> getParentGroup(){
		return getGroupByRoles().get(2).getValue();
	}
	
	public List<EGroup> getOtherGroup(){
		return getGroupByRoles().get(3).getValue();
	}

}
