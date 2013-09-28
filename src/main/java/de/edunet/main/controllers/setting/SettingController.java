package de.edunet.main.controllers.setting;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import de.edunet.main.models.message.MessageHandler;
import de.edunet24.usermanager.entityBeans.User;
import de.edunet24.usermanager.entityInterfaces.IUserManager;

@Controller
public class SettingController {

	private static final Logger logger = LoggerFactory
			.getLogger(SettingController.class);

	private MessageHandler messageHandler;

	public void setMessageHandler(MessageHandler messageHandler) {
		this.messageHandler = messageHandler;
	}
	
	

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/setting", method = RequestMethod.GET)
	public String startSetting(Model model, HttpSession session) {

		if (!messageHandler.isBridgeSessionOk(session)) {
			return "redirect:../home-web";
		}
		model.addAttribute("currentUser",
				messageHandler.getCurrentUser(session));

		logger.info("Calling setting modul");

		return "setting";
	}

	@RequestMapping(value = "/changeProfileFoto", method = RequestMethod.POST)
	public String changeProfileFoto(HttpSession session) {
		// TODO to implement
		if (!messageHandler.isBridgeSessionOk(session)) {
			return "redirect:../home-web";
		}
		return "setting";
	}

	@RequestMapping(value = "/changeNewstype", method = RequestMethod.POST)
	public String changeNewstype(
			@RequestParam(value = "newstype") String[] newstype,
			@RequestParam(value = "email") String email,
			@RequestParam(value = "telefon") String telefon, 
			Model model, HttpSession session) {

		// TODO test
		if (!messageHandler.isBridgeSessionOk(session)) {
			return "redirect:../home-web";
		}

		User currentUser = messageHandler.getLoginBean().getUser();
		if(!model.containsAttribute("currentUser"))
			model.addAttribute("currentUser", currentUser);
		
		if (newstype.length > 1)
			currentUser.setNewstype(newstype[0] + ", " + newstype[1]);
		else
			currentUser.setNewstype(newstype[0]);
		currentUser.setEmail(email);
		currentUser.setTelefon(telefon);
		messageHandler.getUserManager().updateUser(currentUser);
		
		return "setting";
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(
			@RequestParam(value = "newPassword1") String newPassword1,
			@RequestParam(value = "newPassword2") String newPassword2,
			@RequestParam(value = "oldPassword") String oldPassword,
			Model model, HttpSession session) {
		
		if (!messageHandler.isBridgeSessionOk(session)) {
			return "redirect:../home-web";
		}
		
		User currentUser = messageHandler.getLoginBean().getUser();
		if(!model.containsAttribute("currentUser"))
			model.addAttribute("currentUser", currentUser);
		
		if(!currentUser.getPassword().equals(md5(oldPassword))){
			model.addAttribute("errMes1", "Die angegebene Passwort ist falsch");
			return "setting";
		}
		
		if(!newPassword1.equals(newPassword2)){
			model.addAttribute("errMes2", "Die angegebene Passworte sind nicht gleich");
			return "setting";
		}
		
		newPassword1 = md5(newPassword1);
		currentUser.setPassword(newPassword1);
		currentUser.setUpdatedDate(new Date());
		messageHandler.getUserManager().updateUser(currentUser);
		
		return "setting";
	}

	@RequestMapping(value = "/changeStatus", method = RequestMethod.POST)
	public String changeStatus(
			@RequestParam(value = "usertype") String usertype,
			Model model, HttpSession session) {
		if (!messageHandler.isBridgeSessionOk(session)) {
			return "redirect:../home-web";
		}
		User currentUser = messageHandler.getLoginBean().getUser();
		logger.info(currentUser.getUsertype());
		logger.info(currentUser.getUsername());
		logger.info(currentUser.getFullName());
		logger.info(currentUser.getEmail());
		currentUser.setUsertype(usertype);
		currentUser.setUpdatedDate(new Date());
		
		messageHandler.getUserManager().updateUser(currentUser);
		
		if(!model.containsAttribute("currentUser"))
			model.addAttribute("currentUser", currentUser);
		return "setting";
	}

	@RequestMapping(value = "/changeSchoolId", method = RequestMethod.POST)
	public String changeSchuleId(
			@RequestParam(value = "schoolId") Long schoolId, 
			Model model, HttpSession session) {
		// TODO tests
		if (!messageHandler.isBridgeSessionOk(session)) {
			return "redirect:../home-web";
		}
		User currentUser = messageHandler.getLoginBean().getUser();
		currentUser.setSchoolId(schoolId);
		currentUser.setUpdatedDate(new Date());
		
		messageHandler.getUserManager().updateUser(currentUser);
		if(!model.containsAttribute("currentUser"))
			model.addAttribute("currentUser", currentUser);
		return "setting";
	}
	
	public String md5(String password) {
		String md5 = null;
		if (null == password)
			return null;

		try {
			// Create MessageDigest object for MD5
			MessageDigest digest = MessageDigest.getInstance("MD5");

			// Update input string in message digest
			digest.update(password.getBytes(), 0, password.length());

			// Converts message digest value in base 16 (hex)
			md5 = new BigInteger(1, digest.digest()).toString(16);

		} catch (NoSuchAlgorithmException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			return null;
		}
		return md5;
	}
	
	
	
	

}
