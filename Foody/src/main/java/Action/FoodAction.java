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
import Model.Food;

public class FoodAction extends ActionSupport implements SessionAware  {
	
	private Map<String, Object> session;
	
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	private List<Food> foodlist;
	
	public List<Food> getFoodlist() {
		return foodlist;
	}

	public void setFoodlist(List<Food> foodlist) {
		this.foodlist = foodlist;
	}

	public File getHinh() {
		return hinh;
	}

	public void setHinh(File hinh) {
		this.hinh = hinh;
	}

	public String getHinhFileName() {
		return hinhFileName;
	}

	public void setHinhFileName(String hinhFileName) {
		this.hinhFileName = hinhFileName;
	}

	public String getHinhContentType() {
		return hinhContentType;
	}

	public void setHinhContentType(String hinhContentType) {
		this.hinhContentType = hinhContentType;
	}

	public String getTenmonan() {
		return tenmonan;
	}

	public void setTenmonan(String tenmonan) {
		this.tenmonan = tenmonan;
	}

	public int getGia() {
		return gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Food getFood() {
		return food;
	}

	public void setFood(Food food) {
		this.food = food;
	}

	File hinh;
	String hinhFileName;
	String hinhContentType;

	private String tenmonan;
	private int gia;

	private int id;
	private Food food;
	private Danhmuc dm;
	public Danhmuc getDm() {
		return dm;
	}

	public void setDm(Danhmuc dm) {
		this.dm = dm;
	}

	List<Danhmuc> danhMucList;
	List<Integer> idsp;
	List<String> tensp;
	int danhmuc;

	public int getDanhmuc() {
		return danhmuc;
	}

	public void setDanhmuc(int danhmuc) {
		this.danhmuc = danhmuc;
	}

	public List<String> getTensp() {
		return tensp;
	}

	public void setTensp(List<String> tensp) {
		this.tensp = tensp;
	}

	public List<Integer> getIdsp() {
		return idsp;
	}

	public void setIdsp(List<Integer> idsp) {
		this.idsp = idsp;
	}

	public List<Danhmuc> getDanhMucList() {
		return danhMucList;
	}

	public void setDanhMucList(List<Danhmuc> danhMucList) {
		this.danhMucList = danhMucList;
	}

	public String list()
	{
		foodlist=new FoodDAO().getList();
		return SUCCESS;
	}

	public String create()
	{		
		danhMucList = new FoodDAO().List();
		idsp = new ArrayList<Integer>();
		tensp = new ArrayList<String>();
		for (Danhmuc danhmuc : danhMucList) {
			idsp.add(danhmuc.getId());
			tensp.add(danhmuc.getTen());
		}
		return SUCCESS;
	}

	public String store()
	{
		System.out.println(danhmuc);
		String path = ServletActionContext.getServletContext().getRealPath("./img");
		//System.out.println("Image Location:" + path);
		//System.out.println(hinhFileName);
		 if(hinhFileName!=null)
		 {
			// handling the file
			File file = new File(path, hinhFileName);
			
			try {
				
				FileUtils.copyFile(hinh, file);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
		new FoodDAO().store(danhmuc,tenmonan,hinhFileName,gia);
		
		return "list";
	}

	public String edit()
	{
		food=new FoodDAO().getFoodByID(id);
		return SUCCESS;
	}
	
	public String update()
	{
		String path = ServletActionContext.getServletContext().getRealPath("./img");
		//System.out.println("Image Location:" + path);
		//System.out.println(hinhFileName);
		 if(hinhFileName!=null)
		 {
			// handling the file
			File file = new File(path, hinhFileName);
			
			try {
				
				FileUtils.copyFile(hinh, file);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		 }
		 else
		 {
			 food=new FoodDAO().getFoodByID(id);
			 hinhFileName=food.getHinh();
		 }
		 
		new FoodDAO().update(id, tenmonan, hinhFileName, gia);
		
		
		return "list";
	}
	
	public String delete()
	{
		new FoodDAO().delete(id);
		
		return "list";
	}
	
	
	
}
