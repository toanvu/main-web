package de.edunet.main.models.spring.session;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import de.edunet24.notification.entityBeans.UserNotification;

public class User implements Serializable{

private int userId;
	
	private String username;
	
	private int roleId;
	
	private String roleName;
	
	private String userType;
	
	private String userKey;
	
	private static final String DEFAULT_LANGUAGE ="de"; 
	
	private String currentLanguage;
	
	private List<UserNotification> notifications = new ArrayList<UserNotification>();
	
	public User(){
		
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserKey() {
		return userKey;
	}

	public void setUserKey(String userKey) {
		this.userKey = userKey;
	}

	public String getCurrentLanguage() {
		return currentLanguage;
	}

	public void setCurrentLanguage(String currentLanguage) {
		this.currentLanguage = currentLanguage;
	}

	public List<UserNotification> getNotifications() {
		return notifications;
	}

	public void setNotifications(List<UserNotification> notifications) {
		this.notifications = notifications;
	}
	
	
}
