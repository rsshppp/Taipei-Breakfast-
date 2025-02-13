package model.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.Session;

import model.bean.MealBean;
import model.bean.MemberBean;
import model.bean.OrderDetailBean;
import model.bean.OrderSumBean;
import model.bean.OwnerBean;
import model.bean.ShopBean;
import model.dao.MealDAO;
import model.dao.MemberDAO;
import model.dao.OrderDetailDAO;
import model.dao.OrderSumDAO;
import model.dao.OwnerDAO;
import model.dao.ShopDAO;

public class TBService{

	//(-.-)*杜
	private MemberDAO member;
	private ShopDAO shop;
	private OrderSumDAO ordersum;
	private OrderDetailDAO orderdetail;
	private MealDAO meal;
	private OwnerDAO own;
	private SendMailSMTP mailD;

	public TBService(){
	}
//	public TBService(MemberDAO member){
//		this.member = member;
//	}
	public void setMember(MemberDAO member) {
		this.member = member;
	}
	public void setShop(ShopDAO shop) {
		this.shop = shop;
	}
	public void setOrdersum(OrderSumDAO ordersum) {
		this.ordersum = ordersum;
	}
	public void setOrderdetail(OrderDetailDAO orderdetail) {
		this.orderdetail = orderdetail;
	}
	public void setMeal(MealDAO meal) {
		this.meal = meal;
	}
	public void setOwn(OwnerDAO own) {
		this.own = own;
	}
	public void setMailD(SendMailSMTP mailD) {
		this.mailD = mailD;
	}
	
	
	//(-.-)*杜
	public boolean CheackAcc(String mai){
		boolean result=false;
		//Ajax用mail檢查Acc有沒有重複
		if(mai!=null){
			boolean m=member.selectMemberByAcc(mai);
			if(m!=true){
				//if(false沒東西){ 允許進行下一步 sendCheackMail()}
				result=true;
			}
			// if(true有重複到){result=false}
		}
		return result;
	}
	
	//(-.-)*杜
	//需要能使用的mail才能註冊,考慮中的功能,很高的機率不會DEMO
	public boolean sendCheackMail(String ma){
		boolean result=false;
			//寄出mail驗證碼
		if(ma!=null){
			String r="";
			for(int i=0;i<5;i++){
				long a=Math.round(Math.random()*9);
				r+=a;
			}
			mailD.send(ma, "台北早餐通信箱驗證", "驗證碼 : "+r);
		}
		return result;
	}
	
	//(-.-)*杜
	public MemberBean insertMember(MemberBean bean) {
		if(bean!=null){
				return member.insertMember(bean);
		}
		return null;
	}

	//(-.-)*杜
	public MemberBean updateMember(MemberBean bean) {
		if(bean!=null){
			return member.updateMember(bean);
		}
		return null;
	}

	//(-.-)*杜
	public List<MemberBean> selectMember(MemberBean bean) {
		List<MemberBean> result=null;
		if(bean!=null && bean.getMemberID()!=0){
			MemberBean a=member.selectMember(bean.getMemberID());
			if(a!=null){
			result = new ArrayList<MemberBean>();
			result.add(a);
			}
		}else{
			result= member.selectMember();
		}
		return result;
	}

	//(-.-)*杜
	public MemberBean selectMemberE(String ea) {
		MemberBean result=null;
//		System.out.println("select e : "+ea);
		if (ea != null) {
			System.out.println("in selectE="+ea);
			MemberBean b = member.selectMemberByMail(ea);
			if (b != null) {
				result = b;
			}
		}
		return result;
	}
	
	
	//(-.-)*杜
	public Boolean deleteMember(int MemberID) {
		System.out.println(MemberID);
		if(MemberID!=0){
			return member.deleteMember(MemberID);
//			return member.rebornMember(MemberID);
		}
		return false;
	}

	//(-.-)*杜
	public boolean changePassword(int MemberID,String memberPwd,String newMemPwd){
		boolean result=false;
//		if (!Arrays.equals(memberPwd.getBytes(), newMemPwd.getBytes())) {
			if(member.changePassword(MemberID, newMemPwd)){
				result = true;
			}
//		}
		return result;
	}
	
	//(-.-)*杜
	public void losepassword(int MemberID){
		MemberBean bean= member.selectMember(MemberID);
		if(bean!=null){
			char les[] = {
					'A','B','C','D','E','F','G','H','I','J',
					'K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
					'0','1','2','3','4','5','6','7','8','9'};
			char a[] = new char[8];
			for(int i=0;i<a.length;i++){
				a[i]= les[(int)Math.round(Math.random() * (les.length - 1))];
			}
			String b=new String(a);
			System.out.println("// b 是新密碼,用Email寄給Member : "+b);
			if(member.changePassword(MemberID, b)){
				String membermail=bean.getMemberEmail();
				String first=bean.getMemberFirstName();
				mailD.send(membermail, 
						"台北早餐通密碼變更", 
						"Dear "+first+
						" : \n\n 您的新密碼為 : "+b+
						" \n\n 請登入帳戶並修改密碼");
			}else{
				System.out.println("chPass false");
			}
		}
	}

	//(-.-)*杜
	public void losepassown(int ownID){
		OwnerBean bean= own.select(ownID);
		if(bean!=null){
			char les[] = {
					'A','B','C','D','E','F','G','H','I','J',
					'K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
					'0','1','2','3','4','5','6','7','8','9'};
			char a[] = new char[8];
			for(int i=0;i<a.length;i++){
				a[i]= les[(int)Math.round(Math.random() * (les.length - 1))];
			}
			String b=new String(a);
			System.out.println(" b 是新密碼,用Email寄出 : "+b);
			if(own.updatePwd(b, bean.getOwnAcc())!=null){
				String membermail=bean.getOwnEmail();
				String first=bean.getOwnFirstName();
				mailD.send(membermail, 
						"台北早餐通密碼變更", 
						"Dear "+first+
						" : \n\n 您的新密碼為 : "+b+
						" \n\n 請登入帳戶並修改密碼");
			}else{
				System.out.println("own ch Pass false");
			}
		}
	}

	//(-.-)*杜
	public ShopBean selectSByID(int shopID) {
		if (shopID != 0) {
			return shop.select(shopID);
		}
		return null;
	}

	//(-.-)*杜
	public List<ShopBean> selectSByArea(String shopArea) {
		// Ajax 用 shopArea 找出 list 後選出 shopID
		List<ShopBean> result=null;
		if (shopArea != null) {
			result = shop.selectArea(shopArea);
		}
		//前端從BEAN中找Name
		return result;
	}
	
	//(-.-)*杜
	public List<ShopBean> selectSByKeyword(String keyword, String shopArea) {
		//店鋪ID,店鋪所在城市,店鋪所在區域
		List<ShopBean> result=null;

		// Ajax 用 shopArea 找出 list 後選出 shopID
		if (shopArea != null && shopArea.length()!=0) {
			if (keyword != null && keyword.length()!=0) {
				// select shopArea 中符合keyword的部分
				result=shop.selectAK(shopArea, keyword);
			}
		}else{
			// select keyword from shopName,shopCity,shopArea,shopAddr,businessTimeNote
			if (keyword != null && keyword.length()!=0) {
				result = shop.selectKeyword(keyword);
			}
		}
		return result;
	}

	//(-.-)*杜
	public List<OrderSumBean> selectOrdersByTime(int page) {
		// 顯示orderTime, 用orderSumID抓Detail
		return ordersum.queryOrderSumByTime(page);
	}
	
	//(-.-)*杜
	public List<OrderDetailBean> selectOrderDetail(Integer orderSumID) {
		//用orderSumID抓Detail, orderDetailID與orderSumID隱藏不顯示
		return orderdetail.queryOrderDetails(orderSumID);
	}

	//(-.-)*杜
	public MealBean findMeal(Integer mealID) {
		//用orderSumID抓Detail, orderDetailID與orderSumID隱藏不顯示
		return meal.selectOneMeal(mealID);
	}

	//(-.-)*杜
	public List<ShopBean> selectAllowShop(){
		List<ShopBean> a = shop.allowNeedsShop();
		return a;
	}

	//(-.-)*杜
	public boolean allowShop(int ShopID){
		return shop.allowShop(ShopID);
	}

	//(-.-)*杜
	public boolean notallowShop(int ShopID){
		return shop.notAllowShop(ShopID);
	}
	
}
