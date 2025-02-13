package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.bean.AdministratorBean;
import model.bean.OwnerBean;
import model.service.AdministratorService;
import model.service.OwnerService;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements ServletRequestAware {
	private HttpServletRequest request;
	private String username;
	private String password;
	private OwnerService ownerservice;
	private AdministratorService adminservice;
	private HttpSession session=ServletActionContext.getRequest().getSession();
	private String suspend;
	
	
	public void setAdminservice(AdministratorService adminservice) {
		this.adminservice = adminservice;
	}

	public String getSuspend() {
		return suspend;
	}

	public void setSuspend(String suspend) {
		this.suspend = suspend;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setOwnerservice(OwnerService ownerservice) {
		this.ownerservice = ownerservice;
	}
	
	@Override
	public String execute() throws Exception {
		suspend=null;
		OwnerBean bean=null;
		System.out.println(username);
		System.out.println(password);
		if(username!=null&&username.trim().length()!=0&&password!=null&&password.trim().length()!=0){
			bean=ownerservice.login(username, password);
		}
		if(bean!=null&&bean.getOwnSuspend()==false){
			session.setAttribute("user", bean);
			session.setAttribute("type", "owner");
			return "success";
		}else if(bean!=null&&bean.getOwnSuspend()==true){
			suspend="此帳號已被停權";
			System.out.println(suspend);
			return "res";
		}else{
			suspend="錯誤的帳號密碼";
			System.out.println(suspend);
			return "res";
		}
	}
	
	 public String logout(){
		 session.removeAttribute("user");
		 session.removeAttribute("type");
		 return "success";
	 }
	 
	 public String adminLogin(){
		 AdministratorBean bean=null;
		System.out.println(username);
		System.out.println(password);
		if(username!=null&&username.trim().length()!=0&&password!=null&&password.trim().length()!=0){
			bean=adminservice.login(username, password);
		}
		if(bean!=null){
			session.setAttribute("admin", bean);
			System.out.println("sss");
			return "admin";
		}else{
			suspend="錯誤的帳號密碼";
			System.out.println(suspend);
			return "erradmin";
		}
	 }
	 
	 public String adminLogout(){
		 session.removeAttribute("admin");
		 return "logout";
	 }
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}
	
}
