package com.model;

public class User {
	
 private int userid;
 private String name=null;
 private String password=null;
 private String firstname=null;
 private String lastname=null;
 private int age;
 private String sex=null;
 private String email=null;
 
 private int roleid;
 
 
 //Role id get$set
 public int getRoleid() {
	  return roleid;
	 }
	 public void setRoleid(int roleid) {
	  this.roleid = roleid;
	 }
 
	 
 public String getName() {
  return name;
 }
 public User() {
  // TODO Auto-generated constructor stub
 }
 public void setName(String name) {
  this.name = name;
 }
 public String getPassword() {
  return password;
 }
 public void setPassword(String password) {
  this.password = password;
 }
 public String getEmail() {
  return email;
 }
 public void setEmail(String email) {
  this.email = email;
 }
 public String getSex() {
  return sex;
 }
 public void setSex(String sex) {
  this.sex = sex;
 }
 public int getAge() {
  return age;
 }
 public void setAge(int age) {
  this.age = age;
 }
 public String getLastname() {
  return lastname;
 }
 public void setLastname(String lastname) {
  this.lastname = lastname;
 }
 public String getFirstname() {
  return firstname;
 }
 public void setFirstname(String firstname) {
  this.firstname = firstname;
 }
 
 
public int getUserid() {
	return userid;
}
public void setUserid(int userid) {
	this.userid = userid;
}
 
 
}