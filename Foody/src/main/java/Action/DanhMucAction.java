package Action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import DAO.FoodDAO;
import Model.Danhmuc;

public class DanhMucAction extends ActionSupport implements SessionAware {

	private Map<String, Object> session;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	List<Danhmuc> danhMucList;
	private Danhmuc danhmuc;

	public Danhmuc getDanhmuc() {
		return danhmuc;
	}

	public void setDanhmuc(Danhmuc danhmuc) {
		this.danhmuc = danhmuc;
	}

	private String ten;
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public List<Danhmuc> getDanhMucList() {
		return danhMucList;
	}

	public void setDanhMucList(List<Danhmuc> danhMucList) {
		this.danhMucList = danhMucList;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public String list() {
		danhMucList = new FoodDAO().List();
		return SUCCESS;
	}

	public String create() {
		return SUCCESS;
	}

	public String store() {
		new FoodDAO().storeDM(ten);
		danhMucList = new FoodDAO().List();
		return "success";
	}

	public String edit() {
		danhmuc = new FoodDAO().getDanhMucByID(id);
		return SUCCESS;
	}

	public String update() {
		new FoodDAO().updateDM(id, ten);
		danhMucList = new FoodDAO().List();
		return "success";
	}

	public String delete() {
		new FoodDAO().deleteDM(id);
		danhMucList = new FoodDAO().List();
		return "success";
	}
}
