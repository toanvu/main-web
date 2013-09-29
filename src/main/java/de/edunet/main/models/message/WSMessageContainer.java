package de.edunet.main.models.message;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import de.edunet24.message.entityBeans.EGroup;
import de.edunet24.message.entityBeans.Message;
import de.edunet24.usermanager.entityBeans.User;

public class WSMessageContainer {

	private String currentUser ;
	List<MessageContainer> messageOfGroup = new ArrayList<WSMessageContainer.MessageContainer>();
	List<GroupContainer> teacherGroup = new ArrayList<WSMessageContainer.GroupContainer>();
	List<GroupContainer> parentGroup = new ArrayList<WSMessageContainer.GroupContainer>();
	List<GroupContainer> otherGroup = new ArrayList<WSMessageContainer.GroupContainer>();
	List<GroupContainer> basicGroup = new ArrayList<WSMessageContainer.GroupContainer>();

	public WSMessageContainer(String currentUser) {
		this.currentUser = currentUser;
	}

	public List<MessageContainer> getMessageOfGroup() {
		return messageOfGroup;
	}

	public void setMessageOfGroup(List<MessageContainer> messageOfGroup) {
		this.messageOfGroup = messageOfGroup;
	}

	public List<GroupContainer> getTeacherGroup() {
		return teacherGroup;
	}

	public void setTeacherGroup(List<GroupContainer> teacherGroup) {
		this.teacherGroup = teacherGroup;
	}

	public List<GroupContainer> getParentGroup() {
		return parentGroup;
	}

	public void setParentGroup(List<GroupContainer> parentGroup) {
		this.parentGroup = parentGroup;
	}

	public List<GroupContainer> getOtherGroup() {
		return otherGroup;
	}

	public void setOtherGroup(List<GroupContainer> otherGroup) {
		this.otherGroup = otherGroup;
	}

	public void createMessageList(List<Message> messages) {
		for (Message message : messages) {
			messageOfGroup.add(new MessageContainer(message.getText(), message
					.getCreatedDate(), message.getOwner().getId(), message
					.getOwner().getUsername(), message.getGroup().getId(),message.getId()));
		}
	}

	public void createTeacherGroup(List<EGroup> groups) {
		createGroupList(teacherGroup, groups);
	}

	public void createParentGroup(List<EGroup> groups) {
		createGroupList(parentGroup, groups);
	}

	public void createOtherGroup(List<EGroup> groups) {
		createGroupList(otherGroup, groups);
	}
	
	public void createBasicGroup(List<EGroup> g) {
		createGroupList(basicGroup, g);
	}
	
	

	public List<GroupContainer> getGroups() {
		return basicGroup;
	}

	public void setGroups(List<GroupContainer> groups) {
		this.basicGroup = groups;
	}

	private void createGroupList(List<GroupContainer> groupList,
			List<EGroup> groups) {
		for (EGroup group : groups) {
			//TODO : use a function of edunetutils to remove a word from a string with specified delimiter
			String groupName = removeCurrentUser(group.getGroupName(),this.currentUser);			
			groupList.add(new GroupContainer(groupName, group
					.getId()));
		}
	}
	
	private String removeCurrentUser(String groupNames, String currentUser){
		StringBuilder sb = new StringBuilder();
		for(String groupName : groupNames.split(",")){
			if(groupName.equalsIgnoreCase(currentUser)){
				continue;
			}
			sb.append(","+groupName);
		}		
		return sb.toString().substring(1);
	}

	public static class GroupContainer {
		String groupName;
		int groupId;
		boolean newGroup = false;

		public GroupContainer(String groupName, int groupId) {
			this.setGroupId(groupId);
			this.setGroupName(groupName);
		}

		public String getGroupName() {
			return groupName;
		}

		public void setGroupName(String groupName) {
			this.groupName = groupName;
		}

		public int getUserId() {
			return groupId;
		}

		public void setGroupId(int groupId) {
			this.groupId = groupId;
		}

		public boolean isNewGroup() {
			return newGroup;
		}

		public void setNewGroup(boolean newGroup) {
			this.newGroup = newGroup;
		}

		public int getGroupId() {
			return groupId;
		}
		
		

	}

	public static class MessageContainer {
		int messageId;
		String message;
		Date sendDate;
		int ownerId;
		String ownerName;
		int groupId;
		boolean newMessage = false;

		public MessageContainer(String message, Date sendDate, int ownerId,
				String ownerName,int groupId,int messageId) {
			this.setMessage(message);
			this.setOwnerId(ownerId);
			this.setOwnerName(ownerName);
			this.setSendDate(sendDate);
			this.setGroupId(groupId);
			this.setMessageId(messageId);
		}
		
		
		

		public int getMessageId() {
			return messageId;
		}




		public void setMessageId(int messageId) {
			this.messageId = messageId;
		}




		public boolean isNewMessage() {
			return newMessage;
		}



		public void setNewMessage(boolean newMessage) {
			this.newMessage = newMessage;
		}



		public int getGroupId() {
			return groupId;
		}



		public void setGroupId(int groupId) {
			this.groupId = groupId;
		}



		public String getMessage() {
			return message;
		}

		public void setMessage(String message) {
			this.message = message;
		}

		public Date getSendDate() {
			return sendDate;
		}

		public void setSendDate(Date sendDate) {
			this.sendDate = sendDate;
		}

		public int getOwnerId() {
			return ownerId;
		}

		public void setOwnerId(int ownerId) {
			this.ownerId = ownerId;
		}

		public String getOwnerName() {
			return ownerName;
		}

		public void setOwnerName(String ownerName) {
			this.ownerName = ownerName;
		}

	}
}
