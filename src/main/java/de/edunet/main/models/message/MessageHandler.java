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
import de.edunet24.usermanager.entityImp.IESession;
import de.edunet24.usermanager.entityInterfaces.ILogin;
import de.edunet24.usermanager.entityInterfaces.IUserManager;

public class MessageHandler {

	private  ILogin loginBean;

	private  IUserManager userManager;

	private  IMessage messageBean;
	
	private IESession sessionBean;
	
	private 
	
	Map<Integer,GroupsByRole> groupsByRoles ;
	
	private static final Logger logger = LoggerFactory
			.getLogger(MessageHandler.class);

	 public void init() {
		
	}
	 
	 public MessageHandler() {
		 
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
	
	public User getCurrentUser(HttpSession session){
		return sessionBean.getUser((Integer) session.getAttribute("currentUserId"));
	}
	
	/**
	 * get all groups for each usertype of current user
	 * @return
	 */
	private Map<Integer,GroupsByRole> getGroupByRoles(HttpSession session){
		logger.info("current user is :"+ this.getCurrentUser(session).getUsername());
		return messageBean.getGroupsByRole();
	}
	
	/**
	 * get teacher groups
	 * @return
	 */
	public List<EGroup> getTeacherGroup(HttpSession session){		
		return getGroupByRoles(session).get(1).getValue();
	}
	
	public List<EGroup> getParentGroup(HttpSession session){
		return getGroupByRoles(session).get(2).getValue();
	}
	
	public List<EGroup> getOtherGroup(HttpSession session){
		return getGroupByRoles(session).get(3).getValue();
	}
	
	/**
	 * 
	 * @param session
	 * @return
	 */
	public  boolean isBridgeSessionOk(HttpSession session){		
		try {			
			int userIdFromHome = (Integer) session.getServletContext().getContext("/{applicationContextRoot}").getAttribute("currentUserId");		
			System.out.println("loginbean : "+loginBean.getUser().getUsername());
			if(session.getAttribute("currentUserId") == null){
				if(userIdFromHome > 0){					
					//save user into edunet session 
					sessionBean.saveUser(userManager.getUser(userIdFromHome));
					session.setAttribute("currentUserId", userIdFromHome);
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
			System.out.println("userid from main : "+  session.getAttribute("currentUserId"));
			System.out.println("loginbean : "+loginBean.getUser().getUsername());
			return session.getAttribute("currentUserId") != null;			
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

	public void setSessionBean(IESession sessionBean) {
		this.sessionBean = sessionBean;
	}
	
	

}