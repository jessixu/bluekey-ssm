
package com.ibm.bluekey.bean;

/**   
*    
* 项目名称：bluekey-ssm   
* 类名称：LoginUser   
* 类描述：   
* 创建人：bruce-wu   
* 创建时间：2017年11月7日 上午10:22:46   
* @version        
*/



//包装对象User 用户 增加 authorization信息

public class LoginUser{
	String uid;
	String name;
	String notesId;
	String building;
	String bio;
	String location;
	String orgTitle;
	
	User user;
	Authorization authorization;


	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNotesId() {
		return notesId;
	}

	public void setNotesId(String notesId) {
		this.notesId = notesId;
	}

	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getOrgTitle() {
		return orgTitle;
	}

	public void setOrgTitle(String orgTitle) {
		this.orgTitle = orgTitle;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Authorization getAuthorization() {
		return authorization;
	}

	public void setAuthorization(Authorization authorization) {
		this.authorization = authorization;
	}
}

