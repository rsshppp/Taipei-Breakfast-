﻿package model.bean;

import java.io.Serializable;

//賣方表
public class OwnerBean implements Serializable{
	
    private static final long serialVersionUID = 1L;
	
    private Integer ownID;
    private String ownAcc;
    private String ownPwd;
    private String ownEmail;
    private String ownLastName;
    private String ownFirstName;
    private Integer ownStatusID;
    private Boolean ownSuspend;
    
    public OwnerBean() {
		
	}
    
	@Override
	public String toString() {
		return "{"+ownID+","+ownAcc+","+ownPwd+","+ownEmail+","+ownLastName+","+
				ownFirstName+","+ownStatusID+","+ownSuspend+"}";
	}

	public Integer getOwnID() {
		return ownID;
	}

	public void setOwnID(Integer ownID) {
		this.ownID = ownID;
	}

	public String getOwnAcc() {
		return ownAcc;
	}

	public void setOwnAcc(String ownAcc) {
		this.ownAcc = ownAcc;
	}

	public String getOwnPwd() {
		return ownPwd;
	}

	public void setOwnPwd(String ownPwd) {
		this.ownPwd = ownPwd;
	}

	public String getOwnEmail() {
		return ownEmail;
	}

	public void setOwnEmail(String ownEmail) {
		this.ownEmail = ownEmail;
	}

	public String getOwnLastName() {
		return ownLastName;
	}

	public void setOwnLastName(String ownLastName) {
		this.ownLastName = ownLastName;
	}

	public String getOwnFirstName() {
		return ownFirstName;
	}

	public void setOwnFirstName(String ownFirstName) {
		this.ownFirstName = ownFirstName;
	}

	public Integer getOwnStatusID() {
		return ownStatusID;
	}

	public void setOwnStatusID(Integer ownStatusID) {
		this.ownStatusID = ownStatusID;
	}

	public Boolean getOwnSuspend() {
		return ownSuspend;
	}

	public void setOwnSuspend(Boolean ownSuspend) {
		this.ownSuspend = ownSuspend;
	}

	
	
//    public static void main(String[] args){   //for test test
//    	OwnerBean bean=new OwnerBean();
//    	bean.setOwnID(12);
//    	System.out.println(bean);
//    }
    
    
}