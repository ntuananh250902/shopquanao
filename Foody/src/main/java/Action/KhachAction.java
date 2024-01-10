package Action;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import DAO.FoodDAO;
import Model.Food;
import Model.NguoiDung;
import Model.Danhmuc;

public class KhachAction extends ActionSupport implements SessionAware {
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	List<Food> foodlist;
	private int idmonan;
	Map<String, Object> session;
	int numberOfElements;

	public int getNumberOfElements() {
		return numberOfElements;
	}

	public void setNumberOfElements(int numberOfElements) {
		this.numberOfElements = numberOfElements;
	}

	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public int getGia() {
		return gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}

	public int getThanhtien() {
		return thanhtien;
	}

	public void setThanhtien(int thanhtien) {
		this.thanhtien = thanhtien;
	}

	private Food food;
	private Danhmuc danhmuc;
	public Danhmuc getDanhmuc() {
		return danhmuc;
	}

	public void setDanhmuc(Danhmuc danhmuc) {
		this.danhmuc = danhmuc;
	}

	private int soluong;
	private int gia;
	private int thanhtien;
	private String keyword;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getIdmonan() {
		return idmonan;
	}

	public void setIdmonan(int idmonan) {
		this.idmonan = idmonan;
	}

	public Food getFood() {
		return food;
	}

	public void setFood(Food food) {
		this.food = food;
	}

	public List<Food> getFoodlist() {
		return foodlist;
	}

	public void setFoodlist(List<Food> foodlist) {
		this.foodlist = foodlist;
	}

	public int getNguoidung() {
		return nguoidung;
	}

	public void setNguoidung(int nguoidung) {
		this.nguoidung = nguoidung;
	}

	private int nguoidung;
	List<Danhmuc> danhMucList;

	public List<Danhmuc> getDanhMucList() {
		return danhMucList;
	}

	public void setDanhMucList(List<Danhmuc> danhMucList) {
		this.danhMucList = danhMucList;
	}

	public String home() {
		Object idNguoiDungObject = session.get("idnguoidung");

		if (idNguoiDungObject != null) {
			int idNguoiDung = (int) idNguoiDungObject;
			if (idNguoiDung == 0) {
				foodlist = new FoodDAO().getList();
				danhMucList = new FoodDAO().List();
			} else {
				nguoidung = idNguoiDung;
				foodlist = new FoodDAO().getCartItemsByUserId(nguoidung);
				numberOfElements = foodlist.size();
				foodlist = new FoodDAO().getList();
				danhMucList = new FoodDAO().List();
			}
		} else {
			nguoidung = 0;
			
			foodlist = new FoodDAO().getList();
			danhMucList = new FoodDAO().List();
		}

		return "success";
	}

	public String order() {
		food = new FoodDAO().getFoodByID(idmonan);
		return SUCCESS;
	}

	public String submitOrder() {
		int userId = (int) session.get("idnguoidung");
		foodlist = new FoodDAO().getCartItemsByUserId(userId);
		int idfood=0;
		int iddatmon=0;
		boolean found = false;
		for (Food food : foodlist) {
			idfood = food.getId();
			iddatmon = food.getIddatmon();
			if (idfood == idmonan) {
				found = true;
				break;
			}
		}

		if (!found) {
			NguoiDung nd = (NguoiDung) session.get("nguoidung");
			new FoodDAO().Order(nd.getId(), idmonan, soluong, gia, thanhtien);
			new FoodDAO().updatett(userId);
		} else {

			new FoodDAO().OrderTrung(iddatmon, soluong);
			new FoodDAO().updatett(userId);
		}
		return SUCCESS;
	}

	public String viewCart() {
		int userId = (int) session.get("idnguoidung");
		foodlist = new FoodDAO().getCartItemsByUserId(userId);
		numberOfElements = foodlist.size();
		return "success";
	}

	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String delete() {
		new FoodDAO().deletecart(id);
		int userId = (int) session.get("idnguoidung");
		foodlist = new FoodDAO().getCartItemsByUserId(userId);
		return "success";
	}

	public String update() {
		int userId = (int) session.get("idnguoidung");
		new FoodDAO().updatecart(id, soluong);
		new FoodDAO().updatett(userId);
		foodlist = new FoodDAO().getCartItemsByUserId(userId);
		return "success";
	}
	
	public String thanhtoan() {
		int userId = (int) session.get("idnguoidung");
		new FoodDAO().thanhtoan(userId);
		return "success";
	}
	
	public String chitiet() {
		Object idNguoiDungObject = session.get("idnguoidung");

		if (idNguoiDungObject != null) {
			int idNguoiDung = (int) idNguoiDungObject;
			if (idNguoiDung == 0) {
				food = new FoodDAO().getFoodByID(idmonan);
				danhMucList = new FoodDAO().List();
			} else {
				nguoidung = idNguoiDung;
				foodlist = new FoodDAO().getCartItemsByUserId(nguoidung);
				numberOfElements = foodlist.size();
				food = new FoodDAO().getFoodByID(idmonan);
				danhMucList = new FoodDAO().List();
			}
		} else {
			nguoidung = 0;
			food = new FoodDAO().getFoodByID(idmonan);
			danhMucList = new FoodDAO().List();
		}

		return "success";
	}
	String word;
	
	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String timkiem() {
		Object idNguoiDungObject = session.get("idnguoidung");

		if (idNguoiDungObject != null) {
			int idNguoiDung = (int) idNguoiDungObject;
			if (idNguoiDung == 0) {
				foodlist = new FoodDAO().search(keyword);
				word= keyword;
				danhMucList = new FoodDAO().List();
			} else {
				nguoidung = idNguoiDung;
				foodlist = new FoodDAO().getCartItemsByUserId(nguoidung);
				numberOfElements = foodlist.size();
				foodlist = new FoodDAO().search(keyword);
				word= keyword;
				danhMucList = new FoodDAO().List();
			}
		} else {
			nguoidung = 0;
			foodlist = new FoodDAO().search(keyword);
			word= keyword;
			danhMucList = new FoodDAO().List();
		}
		return "success";
	}

}
