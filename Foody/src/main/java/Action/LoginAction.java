package Action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import DAO.FoodDAO;
import DAO.UserDAO;
import Model.Food;
import Model.NguoiDung;

public class LoginAction extends ActionSupport implements SessionAware {
	String tendangnhap,matkhau;
	Map<String, Object> session;

	int numberOfElements;
	public int getNumberOfElements() {
		return numberOfElements;
	}

	public void setNumberOfElements(int numberOfElements) {
		this.numberOfElements = numberOfElements;
	}

	public int getNguoidung() {
		return nguoidung;
	}

	public void setNguoidung(int nguoidung) {
		this.nguoidung = nguoidung;
	}
	private int nguoidung;
	List<Food> foodlist;
	public Map<String, Object> getSession() {
		return session;
	}

	public String getTendangnhap() {
		return tendangnhap;
	}

	public void setTendangnhap(String tendangnhap) {
		this.tendangnhap = tendangnhap;
	}

	public String getMatkhau() {
		return matkhau;
	}

	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}
	
	public List<Food> getFoodlist() {
		return foodlist;
	}

	public void setFoodlist(List<Food> foodlist) {
		this.foodlist = foodlist;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public String login() {
		NguoiDung nd = new UserDAO().login(tendangnhap, matkhau);
		if (nd != null) {
			session.put("idnguoidung", nd.getId());
			session.put("nguoidung", nd);
			System.out.println("Login success");
			if (nd.getLoaiquyen().equals("admin")) {
				return "admin";
			} else
				return "khach";
		} else {
			addActionMessage("Bạn nhập sai tên đăng nhập hoặc mật khẩu!");
			System.out.println("Login fail");
			return "login";
		}
	}
	public String logout()
	{
		session.remove("idnguoidung");
		session.remove("nguoidung");
		Object idNguoiDungObject = session.get("idnguoidung");

		if (idNguoiDungObject != null) {
		    int idNguoiDung = (int) idNguoiDungObject;
		    if (idNguoiDung == 0) {
		        foodlist = new FoodDAO().getList();
		    } else {
		        nguoidung = idNguoiDung;
		        foodlist = new FoodDAO().getCartItemsByUserId(nguoidung);
		        numberOfElements = foodlist.size();
		        foodlist = new FoodDAO().getList();
		    }
		} else {
		    foodlist = new FoodDAO().getList();
		}

		return "login";
	}

}
