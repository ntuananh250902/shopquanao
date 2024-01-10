package Model;
import java.util.ArrayList;
import java.util.List;

public class Cart { 
int idmonan; 
public Cart(int idmonan, int gia, int tongtien, int soluong, int id, int idnguoidung) {
	super();
	this.idmonan = idmonan;
	this.gia = gia;
	this.tongtien = tongtien;
	this.soluong = soluong;
	this.id = id;
	this.idnguoidung = idnguoidung;
}
int idnguoidung; 
int gia; 
int tongtien;
int soluong;
int id; 
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getIdnguoidung() {
	return idnguoidung;
}
public void setIdnguoidung(int idnguoidung) {
	this.idnguoidung = idnguoidung;
}
public int getIdmonan() {
	return idmonan;
}
public void setIdmonan(int idmonan) {
	this.idmonan = idmonan;
}
public int getGia() {
	return gia;
}
public void setGia(int gia) {
	this.gia = gia;
}
public int getTongtien() {
	return tongtien;
}
public void setTongtien(int tongtien) {
	this.tongtien = tongtien;
}
public int getSoluong() {
	return soluong;
}
public void setSoluong(int soluong) {
	this.soluong = soluong;
}
private List<Food> items;

public Cart() {
    items = new ArrayList<>();
}

public List<Food> getItems() {
    return items;
}

public void setItems(List<Food> items) {
    this.items = items;
}

public void addItem(Food food) {
    items.add(food);
}
}
 

