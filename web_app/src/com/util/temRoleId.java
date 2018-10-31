package com.util;

public  class temRoleId {
	
	public static  String  userId;
	public static  String  admId;
	
	
	public temRoleId(String userId, String admId) {
		
		this.userId = userId;
		this.admId = admId;
	}


	public  static String getUserId() {
		
		return userId;
	}


	public static  void setUserId(String userId) {
		
		userId = userId;
	}


	public static  String getAdmId() {
		return admId;
	}


	public static void setAdmId(String admId) {
		admId = admId;
	}
	
	
	

}
