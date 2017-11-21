package com.ibm.bluekey.bean;

public class Employeeinfo {

	
	private int id;
	private String Name;
	private String ImgURL;
	private String Position;
	private String Department;
	private String Region;
	private String Mobile;
	private String Work;
	private String Email;
	private String Notes_ID;
	private String Preferred_Contact_Method;
	private String Office_location;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getImgURL() {
		return ImgURL;
	}
	public void setImgURL(String imgurl) {
		ImgURL = imgurl;
	}
	public String getPosition() {
		return Position;
	}
	public void setPosition(String position) {
		Position = position;
	}
	public String getDepartment() {
		return Department;
	}
	public void setDepartment(String department) {
		Department = department;
	}
	public String getRegion() {
		return Region;
	}
	public void setRegion(String region) {
		Region = region;
	}
	public String getMobile() {
		return Mobile;
	}
	public void setMobile(String mobile) {
		Mobile = mobile;
	}
	public String getWork() {
		return Work;
	}
	public void setWork(String work) {
		Work = work;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getNotes_ID() {
		return Notes_ID;
	}
	public void setNotes_ID(String notes_ID) {
		Notes_ID = notes_ID;
	}
	public String getPreferred_Contact_Method() {
		return Preferred_Contact_Method;
	}
	public void setPreferred_Contact_Method(String preferred_Contact_Method) {
		Preferred_Contact_Method = preferred_Contact_Method;
	}
	public String getOffice_location() {
		return Office_location;
	}
	public void setOffice_location(String office_location) {
		Office_location = office_location;
	}
	public Employeeinfo(int id, String name, String imgurl,String position, String department, String region, String mobile,
			String work, String email, String notes_ID, String preferred_Contact_Method, String office_location) {
		super();
		this.id = id;
		Name = name;
		ImgURL = imgurl;
		Position = position;
		Department = department;
		Region = region;
		Mobile = mobile;
		Work = work;
		Email = email;
		Notes_ID = notes_ID;
		Preferred_Contact_Method = preferred_Contact_Method;
		Office_location = office_location;
	}
	public Employeeinfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
}
