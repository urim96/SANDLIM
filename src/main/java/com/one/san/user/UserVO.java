package com.one.san.user;

import java.time.LocalDateTime;

public class UserVO {
	private String u_no;
	private String u_id;
	private String u_pw;
	private String u_nick;
	private String u_name; 
	private String u_phno;
	private String u_addr;
	private String u_addr2;
	private String u_addr3;
	private String u_birth; 
	private String u_email;
	private int u_point; 
	private String u_status;
	private String u_social;
	private LocalDateTime uDate;
	
	public LocalDateTime getuDate() {
		return uDate;
	}
	public void setuDate(LocalDateTime uDate) {
		this.uDate = uDate;
	}
	public String getU_no() {
		return u_no;
	}
	public void setU_no(String u_no) {
		this.u_no = u_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getU_nick() {
		return u_nick;
	}
	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_phno() {
		return u_phno;
	}
	public void setU_phno(String u_phno) {
		this.u_phno = u_phno;
	}
	public String getU_addr() {
		return u_addr;
	}
	public void setU_addr(String u_addr) {
		this.u_addr = u_addr;
	}
	public String getU_addr2() {
		return u_addr2;
	}
	public void setU_addr2(String u_addr2) {
		this.u_addr2 = u_addr2;
	}
	public String getU_addr3() {
		return u_addr3;
	}
	public void setU_addr3(String u_addr3) {
		this.u_addr3 = u_addr3;
	}
	public String getU_birth() {
		return u_birth;
	}
	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public int getU_point() {
		return u_point;
	}
	public void setU_point(int u_point) {
		this.u_point = u_point;
	}
	public String getU_status() {
		return u_status;
	}
	public void setU_status(String u_status) {
		this.u_status = u_status;
	}
	public String getU_social() {
		return u_social;
	}
	public void setU_social(String u_social) {
		this.u_social = u_social;
	}
	
	@Override
	public String toString() {
		return "UserVO [u_no=" + u_no + ", u_id=" + u_id + ", u_pw=" + u_pw + ", u_nick=" + u_nick + ", u_name="
				+ u_name + ", u_phno=" + u_phno + ", u_addr=" + u_addr + ", u_addr2=" + u_addr2 + ", u_addr3=" + u_addr3
				+ ", u_birth=" + u_birth + ", u_email=" + u_email + ", u_point=" + u_point + ", u_status=" + u_status
				+ ", u_social=" + u_social + "]";
	}
}
