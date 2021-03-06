package de.edunet.main.models.message;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import de.edunet24.common.GroupsByRole;
import de.edunet24.dev.utils.common.EdunetConstants;
import de.edunet24.message.entityBeans.EGroup;
import de.edunet24.message.entityBeans.Message;
import de.edunet24.message.entityInterfaces.IMessage;
import de.edunet24.notification.Interfaces.IUserNotification;
import de.edunet24.usermanager.entityBeans.EContext;
import de.edunet24.usermanager.entityBeans.Role;
import de.edunet24.usermanager.entityBeans.User;
import de.edunet24.usermanager.entityImp.IESession;
import de.edunet24.usermanager.entityInterfaces.ILogin;
import de.edunet24.usermanager.entityInterfaces.IUserManager;

public class MessageHandler {

	private  ILogin loginBean;

	private  IUserManager userManager;

	private  IMessage messageBean;
	
	private IESession sessionBean;
	
	private IUserNotification notificationBean;

	private	Map<Integer,GroupsByRole> groupsByRoles ;
	
	private static final Logger logger = LoggerFactory
			.getLogger(MessageHandler.class);

	public void init() {
		
	}
	 
	public MessageHandler() {
		 
	}	

	/**
	 * create or get group from userid
	 * @param userId
	 * @return groupid
	 */
	public int createNewGroup(int userId, HttpSession session) {
		return messageBean.chatWith(userManager.getUser(userId), getCurrentUser(session))
				.getId();

	}
	
	public boolean deleteMessage(int messageId,int userId){
		return messageBean.delete(messageId,userId);
	}
	
	

	public List<Message> getMessageOfCurrentGroup(int groupId, HttpSession session) {			
		List<Message> messageByGroup = messageBean.getMessagesOfCurrentGroup(
				messageBean.getGroup(groupId),getCurrentUser(session));

		return messageByGroup;
	}

	public Integer send(int groupId, String text, HttpSession session) {
		if(groupId>0){
			// update current group for MessageBean				
			return messageBean.sendMessage(text,messageBean.getGroup(groupId),getCurrentUser(session));
		}
		return 0;
	}
	
	public int getUserId(){
		return loginBean.getUser().getId();
	}
	
	public User getCurrentUser(HttpSession session){
		//TODO do other way to init message bean	
		System.out.println("currentUserId: "+session.getAttribute("currentUserId"));
		return userManager.getUser(((Integer) session.getAttribute("currentUserId")));
	}
	
	/**
	 * get all groups for each usertype of current user
	 * @return
	 */
	private Map<Integer,GroupsByRole> getGroupByRoles(HttpSession session){		
		return messageBean.getGroupsByRole(getCurrentUser(session));
	}
	
	private List<EGroup> getGroupByUserType(HttpSession session, String userType){
		EContext context = getSessionBean().getContext((Integer) session.getAttribute(EdunetConstants.SESSION_CURRENT_USER_ID));		
		return messageBean.getGroupByUserType(context.getUserId(),context.getUserType(), userType);
	}
	
	/**
	 * get teacher groups
	 * @return
	 */
	public List<EGroup> getTeacherGroup(HttpSession session){
		return getGroupByUserType(session, "teacher");
//		return getGroupByRoles(session).get(1).getValue();
	}
	
	public List<EGroup> getParentGroup(HttpSession session){
		return getGroupByUserType(session, "parent");
//		return getGroupByRoles(session).get(2).getValue();
	}
	
	public List<EGroup> getOtherGroup(HttpSession session){
		return getGroupByUserType(session, "other");
//		return getGroupByRoles(session).get(3).getValue();
	}
	
	public List<EGroup> getBasicGroup(HttpSession session) {
		return getGroupByUserType(session, "other");
//		return getGroupByRoles(session).get(4).getValue();
	}

	/**
	 * 
	 * @param session
	 * @return
	 */
	public  boolean isBridgeSessionOk(HttpSession session){		
		try {			
			int userIdFromHome = (Integer) session.getServletContext().getContext("/{applicationContextRoot}").getAttribute(EdunetConstants.SESSION_CURRENT_USER_ID);		
//			System.out.println("loginbean : "+loginBean.getUser().getUsername());
			if(session.getAttribute(EdunetConstants.SESSION_CURRENT_USER_ID) == null){
				if(userIdFromHome > 0){					
					//save user into edunet session
					//TODO : optimization
					User loggingUser = userManager.getUser(userIdFromHome);
//					Role role = userManager.getRole(userIdFromHome).get(0);
					
					sessionBean.saveContext(sessionBean.createEContext(loggingUser,loggingUser.getUsertype(),"de",notificationBean.getNotification(userIdFromHome)));
					session.setAttribute(EdunetConstants.SESSION_CURRENT_USER_ID, userIdFromHome);
					return true;
				}else{
					return false;
				}
			}else{
				System.out.println("currentuser id : "+ session.getAttribute("currentUserId"));
				return true;
			}			
		} catch (Exception e) {			
			logger.error("can not get CurrentUserId from home-app : "+ e.getMessage());
			System.out.println("userid from main : "+  (Integer) session.getServletContext().getContext("/{applicationContextRoot}").getAttribute(EdunetConstants.SESSION_CURRENT_USER_ID));
			System.out.println("loginbean : "+loginBean.getUser().getUsername());
//			e.printStackTrace();
			return session.getAttribute(EdunetConstants.SESSION_CURRENT_USER_ID) != null;			
		}	
		
	}

	public  ILogin getLoginBean() {
		return loginBean;
	}

	public  void setLoginBean(ILogin loginBean) {
		this.loginBean = loginBean;
	}

	public  IUserManager getUserManager() {
		return userManager;
	}

	public  void setUserManager(IUserManager userManager) {
		this.userManager = userManager;
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
	
	public IESession getSessionBean() {
		return sessionBean;
	}
	
	public void setSessionBean(IESession sessionBean) {
		this.sessionBean = sessionBean;
	}

	public void logout(HttpSession session) {
		sessionBean.removeUser((Integer) session.getAttribute(EdunetConstants.SESSION_CURRENT_USER_ID));
		session.setAttribute("currentUserId", null);
	}

	public IUserNotification getNotificationBean() {
		return notificationBean;
	}

	public void setNotificationBean(IUserNotification notificationBean) {
		this.notificationBean = notificationBean;
	}
	
	
	
}
