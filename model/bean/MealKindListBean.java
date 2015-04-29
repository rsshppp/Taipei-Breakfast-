package model.bean;

import java.io.Serializable;

//餐點狀態表-Gary
public class MealKindListBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer mealKindID;
	private String mealKindName;
	private Byte[] defaultImage;
	
	public Integer getMealKindID() {
		return mealKindID;
	}
	public void setMealKindID(Integer mealKindID) {
		this.mealKindID = mealKindID;
	}
	public String getMealKindName() {
		return mealKindName;
	}
	public void setMealKindName(String mealKindName) {
		this.mealKindName = mealKindName;
	}
	public Byte[] getDefaultImage() {
		return defaultImage;
	}
	public void setDefaultImage(Byte[] defaultImage) {
		this.defaultImage = defaultImage;
	}
}