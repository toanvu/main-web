package de.edunet.main.models.message;

import java.util.List;

import de.edunet24.message.entityBeans.EGroup;
import de.edunet24.message.entityBeans.Message;

public class WSMessageContainer {

	List<Message> messageOfGroup;
	List<EGroup> teacherGroup;
	List<EGroup> parentGroup;
	List<EGroup> otherGroup;
	
	public WSMessageContainer(){
		
	}

	public List<Message> getMessageOfGroup() {
		return messageOfGroup;
	}

	public void setMessageOfGroup(List<Message> messageOfGroup) {
		this.messageOfGroup = messageOfGroup;
	}

	public List<EGroup> getTeacherGroup() {
		return teacherGroup;
	}

	public void setTeacherGroup(List<EGroup> teacherGroup) {
		this.teacherGroup = teacherGroup;
	}

	public List<EGroup> getParentGroup() {
		return parentGroup;
	}

	public void setParentGroup(List<EGroup> parentGroup) {
		this.parentGroup = parentGroup;
	}

	public List<EGroup> getOtherGroup() {
		return otherGroup;
	}

	public void setOtherGroup(List<EGroup> otherGroup) {
		this.otherGroup = otherGroup;
	}
	
	
}
