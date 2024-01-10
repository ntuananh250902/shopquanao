package Model;

public class Danhmuc {

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
	public int getTrangthai() {
		return trangthai;
	}
	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}
	public Danhmuc(int id, String ten, int trangthai) {
		super();
		this.id = id;
		this.ten = ten;
		this.trangthai = trangthai;
	}
	int id;
	String ten;
	public Danhmuc(String ten, int trangthai) {
		super();
		this.ten = ten;
		this.trangthai = trangthai;
	}
	int trangthai;
}
