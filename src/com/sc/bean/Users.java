package com.sc.bean;

/**
 * 用户bean 所有用户
 */
public class Users {
	//uid
	private int uid;
	//学号
    private String school_num;
    //姓名
    private String name;
    //年级
    private String grade;
    //学院
    private String school;
    //专业
    private String major;
    //邮箱
    private String email;
    //密码
    private String password;
    //角色 
    private int role;
    //性别
    private String sex;
    //QQ
    private String qq;
    //电话
    private String phone;
    //地址
    private String adress;

    public Users() {
        super();
    }

    public Users(int uid,String school_num, String name, String grade, String school, String major, String email, String password, int role, String sex, String qq, String phone, String adress) {
    	this.uid = uid;
    	this.school_num = school_num;
        this.name = name;
        this.sex = sex;
        this.grade = grade;
        this.school = school;
        this.major = major;
        this.email = email;
        this.password = password;
        this.qq = qq;
        this.phone = phone;
        this.adress = adress;
        this.role = role;
        
    }

    public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getSchool_num() {
        return school_num;
    }

    public void setSchool_num(String school_num) {
        this.school_num = school_num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }
}