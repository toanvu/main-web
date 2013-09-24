package de.edunet.main.models.message;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import de.edunet24.message.entityBeans.EGroup;
import de.edunet24.message.entityBeans.Message;

public class WSMessageContainer {

	List<MessageContainer> messageOfGroup = new ArrayList<WSMessageContainer.MessageContainer>();
	List<GroupContainer> teacherGroup = new ArrayList<WSMessageContainer.GroupContainer>();
	List<GroupContainer> parentGroup = new ArrayList<WSMessageContainer.GroupContainer>();
	List<GroupContainer> otherGroup = new ArrayList<WSMessageContainer.GroupContainer>();

	public WSMessageContainer() {

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
					.getOwner().getUsername()));
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

	private void createGroupList(List<GroupContainer> groupList,
			List<EGroup> groups) {
		for (EGroup group : groups) {
			groupList.add(new GroupContainer(group.getGroupName(), group
					.getId()));
		}
	}

	private static class GroupContainer {
		String groupName;
		int groupId;

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

	}

	private static class MessageContainer {
		String message;
		Date sendDate;
		int ownerId;
		String ownerName;

		public MessageContainer(String message, Date sendDate, int ownerId,
				String ownerName) {
			this.setMessage(message);
			this.setOwnerId(ownerId);
			this.setOwnerName(ownerName);
			this.setSendDate(sendDate);
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
