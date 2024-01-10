package Model; 
public class Food { 
int id; 
 String ten; 
 String hinh; 
int gia; 
int soluong;
int thanhtien;
int iddatmon;

 
public int getIddatmon() {
	return iddatmon;
}
public void setIddatmon(int iddatmon) {
	this.iddatmon = iddatmon;
}
public int getThanhtien() {
	return thanhtien;
}
public void setThanhtien(int thanhtien) {
	this.thanhtien = thanhtien;
}
public int getSoluong() {
	return soluong;
}
public void setSoluong(int soluong) {
	this.soluong = soluong;
}
public Food(int id, String ten, String hinh, int gia) { 
 super(); 
 this.id = id; 
 this.ten = ten; 
 this.hinh = hinh; 
 this.gia = gia; 
 } 

public Food(int id, String ten, String hinh, int gia, int soluong, int thanhtien, int iddatmon) { 
	 super(); 
	 this.id = id; 
	 this.ten = ten; 
	 this.hinh = hinh; 
	 this.gia = gia; 
	 this.soluong = soluong;
	 this.thanhtien = thanhtien; 
	 this.iddatmon = iddatmon; 
	 } 
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
	public String getHinh() { 
	 return hinh; 
	 } 
	public void setHinh(String hinh) { 
	 this.hinh = hinh; 
	 } 
	public int getGia() { 
	 return gia; 
	 } 
	public void setGia(int gia) { 
	 this.gia = gia; 
	 } 
	 
	} 

