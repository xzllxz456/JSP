package com.mystudy;

import java.util.Arrays;

public class MemberVO {
	private String name, age, pwd;
	private String gender;	// radio 값 저장(값 하나)
	private String[] hobby;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String[] getHobby() {
		return hobby;
	}
	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}
	@Override
	public String toString() {
		return "MemberVO [name=" + name + ", age=" + age + ", pwd=" + pwd + ", gender=" + gender + ", hobby="
				+ Arrays.toString(hobby) + "]";
	}
	
	
}
