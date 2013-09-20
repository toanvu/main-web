package de.edunet.main.models.message;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import de.edunet24.common.GroupsByRole;
import de.edunet24.message.entityBeans.EGroup;
import de.edunet24.message.entityBeans.Message;
import de.edunet24.message.entityInterfaces.IMessage;
import de.edunet24.usermanager.entityBeans.User;
import de.edunet24.usermanager.entityInterfaces.ILogin;
import de.edunet24.usermanager.entityInterfaces.IUserManager;

public class MessageHandler {
	private static ILogin loginBean;
	private static IUserManager userManager;
	private static IMessage messageBean;
	Map<Integer,GroupsByRole> groupsByRoles ;
	
	private static final Logger logger = LoggerFactory
			.getLogger(MessageHandler.class);

	 public void init() {
		
	}

	/**
	 * 
	 * @param userId
	 * @return groupid
	 */
	public int createNewGroup(int userId) {
		return messageBean.chatWith(userManager.getUser(userId))
				.getId();

	}

	public List<Message> update(int groupId) {
		// update current group for MessageBean
		messageBean.updateCurrentGroup(groupId);		
		List<Message> messageByGroup = messageBean.getMessagesOfCurrentGroup(
				messageBean.getCurrentGroup());

		return messageByGroup;
	}

	public void send(int groupId, String text) {
		if(groupId>0){
			// update current group for MessageBean
			messageBean.updateCurrentGroup(groupId);		
			messageBean.sendMessage(text);
		}
	}
	
	public int getUserId(){
		return loginBean.getUser().getId();
	}
	
	public User getCurrentUser(){
		return loginBean.getUser();
	}
	
	/**
	 * get all groups for each usertype of current user
	 * @return
	 */
	private Map<Integer,GroupsByRole> getGroupByRoles(){
		logger.info("current user is :"+ this.getCurrentUser().getUsername());
		return messageBean.getGroupsByRole();
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
	
	/**
	 * 
	 * @param session
	 * @return
	 */
	public static boolean isBridgeSessionOk(HttpSession session){		
		try {			
			int userIdFromHome = (Integer) session.getServletContext().getContext("/{applicationContextRoot}").getAttribute("currentUserId");
			if(loginBean.getUser() == null && userIdFromHome > 0){
				loginBean.setUser(userManager.getUser(userIdFromHome));
				//init for messageBean
				messageBean.initilizeBean(loginBean.getUser());
			}
			//if nouser cached and id from home is null too.
			if(loginBean.getUser() == null && userIdFromHome == 0){
				return false;
			}
		} catch (Exception e) {			
			logger.error("can not get CurrentUserId from home-app : "+ e.getMessage());
			return false;			
		}	
		return true;
	}

	public  ILogin getLoginBean() {
		return loginBean;
	}

	public  void setLoginBean(ILogin loginBean) {
		MessageHandler.loginBean = loginBean;
	}

	public  IUserManager getUserManager() {
		return userManager;
	}

	public  void setUserManager(IUserManager userManager) {
		MessageHandler.userManager = userManager;
	}

	public IMessage getMessageBean() {
		return messageBean;
	}

	public void setMessageBean(IMessage messageBean) {
		this.messageBean = messageBean;
	}

	public Map<Integer, GroupsByRole> getGroupsByRoles() {
		return groupsByRoles;
	}

	public void setGroupsByRoles(Map<Integer, GroupsByRole> groupsByRoles) {
		this.groupsByRoles = groupsByRoles;
	}
	
	

}
