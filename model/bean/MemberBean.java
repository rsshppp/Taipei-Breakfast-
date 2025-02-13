package model.bean;

import java.io.Serializable;

//會員表
public class MemberBean implements Serializable{

	private static final long serialVersionUID = 1L;

	private Integer memberID;
	private String memberAcc;
	private String memberPwd;
	private String memberLastName;
	private String memberFirstName;
	private String memberPhone;
	private String memberTel;
	private String memberEmail;
	private String memberAddr;
	private byte[] memberImage;
	private Boolean memberStatus;
	private Boolean memberSuspend;
	private Integer specialPriceID;
	
	public MemberBean() {
	
	}

	public Integer getMemberID() {
		return memberID;
	}

	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}

	public String getMemberAcc() {
		return memberAcc;
	}

	public void setMemberAcc(String memberAcc) {
		this.memberAcc = memberAcc;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberLastName() {
		return memberLastName;
	}

	public void setMemberLastName(String memberLastName) {
		this.memberLastName = memberLastName;
	}

	public String getMemberFirstName() {
		return memberFirstName;
	}

	public void setMemberFirstName(String memberFirstName) {
		this.memberFirstName = memberFirstName;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberTel() {
		return memberTel;
	}

	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberAddr() {
		return memberAddr;
	}

	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}

	public byte[] getMemberImage() {
		return memberImage;
	}

	public void setMemberImage(byte[] memberImage) {
		this.memberImage = memberImage;
	}

	public Boolean getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(Boolean memberStatus) {
		this.memberStatus = memberStatus;
	}

	public Boolean getMemberSuspend() {
		return memberSuspend;
	}

	public void setMemberSuspend(Boolean memberSuspend) {
		this.memberSuspend = memberSuspend;
	}

	public Integer getSpecialPriceID() {
		return specialPriceID;
	}

	public void setSpecialPriceID(Integer specialPriceID) {
		this.specialPriceID = specialPriceID;
	}
}
