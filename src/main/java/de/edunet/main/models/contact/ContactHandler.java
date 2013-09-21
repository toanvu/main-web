package de.edunet.main.models.contact;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import de.edunet24.contact.entityBeans.CRequest;
import de.edunet24.contact.entityBeans.Contact;
import de.edunet24.contact.entityInterfaces.IContactManager;
import de.edunet24.usermanager.entityBeans.User;
import de.edunet24.usermanager.entityInterfaces.ILogin;
import de.edunet24.usermanager.entityInterfaces.IUserManager;

public class ContactHandler {

	private static final Logger logger = LoggerFactory
			.getLogger(ContactHandler.class);

	private ILogin loginBean;
	private IUserManager userManager;
	private IContactManager contactManager;

//	public void init() {
//		allUsers = userManager.getAllUser();
//	}

	public void setLoginBean(ILogin loginBean) {
		this.loginBean = loginBean;
	}

	public void setUserManager(IUserManager userManager) {
		this.userManager = userManager;
	}

	public void setContactManager(IContactManager contactManager) {
		this.contactManager = contactManager;
	}

	public ILogin getLoginBean() {
		return loginBean;
	}

	public IUserManager getUserManager() {
		return userManager;
	}

	public IContactManager getContactManager() {
		return contactManager;
	}

	public List<User> getAllUsers() {
		return userManager.getAllUser();
	}
	
	public List<CRequest> getAllCRequests() {
		return contactManager.getAllCRequests();
	}
	
	public List<User> getContactUsers(List<Contact> contacts, User user){
		return contactManager.getContactUsers(contacts, user);
	}

	public List<User> searchUsers(String firstname, String lastname) {
		logger.info("start search user");

		List<User> listUsers = null;

		if ((lastname != null && !lastname.equals(""))
				&& (firstname != null && !firstname.equals(""))) {
			listUsers = userManager.getUserByFullname(firstname, lastname);
		} else if (lastname != null && !lastname.equals("")) {
			listUsers = userManager.getUserByLastname(lastname);
		} else if (firstname != null && !firstname.equals("")) {
			listUsers = userManager.getUserByFirstname(firstname);
		}

		logger.info("end search user");

		return listUsers;
	}

	public void addCRequest(int userId, String message) {

		User userResponse = getUserById(userId);
		User userRequest = loginBean.getUser();
		CRequest crequest = contactManager.createCRequest(userRequest,
				userResponse, message);
		crequest.setCreatedDate(new Date());
	}

	public User getUserById(int userId) {

		for (User u : userManager.getAllUser()) {
			if (u.getId() == userId) {
				logger.info("Found user with name: " + u.getFullName());
				return u;
			}
		}
		return null;
	}

	public List<CRequest> getRequestByUserResponse() {
		return contactManager.getRequestByUserResponse(loginBean.getUser());
	}

	public List<CRequest> getRequestByUserRequest() {
		return contactManager.getRequestByUserRequest(loginBean.getUser());
	}

	public List<Contact> getAllContact() {
		return contactManager.getContacts(loginBean.getUser());
	}

	public void replyCRequest(int userRequestId, String action) {

		User userRequest = getUserById(userRequestId);
		User currentUser = loginBean.getUser();

		logger.info("action " + action);
		logger.info("update status for userRequestId: " + userRequestId
				+ " userResponseId: " + currentUser.getId());
		
		logger.info("update status for userRequest: " + userRequest
				+ " userResponse: " + currentUser);
		contactManager.updateCRequestStatus(action, userRequest, currentUser);

		if (action.equals("accept")) {
			Contact contact = contactManager.createContact(userRequest,
					currentUser);
			contact.setCreatedDate(new Date());
		}

		contactManager.deleteCRequest(contactManager.getCRequest(userRequest,
				currentUser));
	}

	public boolean checkPermission() {
		return loginBean.isLogin();
	}

}
