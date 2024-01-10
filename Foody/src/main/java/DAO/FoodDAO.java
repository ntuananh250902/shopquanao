package DAO; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.sql.SQLException; 
import java.util.ArrayList; 
import java.util.List; 
import Model.Food; 
import Model.Cart; 
import Model.NguoiDung; 
public class FoodDAO { 
	
	 public List<Food> getList(){ 
	 
	 List<Food> list=new ArrayList<Food>(); 
	 DBService db=new DBService(); 
	 PreparedStatement statement; 
	 
	 try { 
	 statement = db.getConn().prepareStatement("SELECT *  from `monan`"); 
	 ResultSet rs=db.executeQuery(statement); 
	 
	 if(rs!=null) 
	 { 
	 while(rs.next()) 
	 { 
	 list.add( new Food(rs.getInt("id"), 
	rs.getString("tenmonan"), 
	 
	 rs.getString("hinhanh"),rs.getInt("gia"))); 
	 } 
	 } 
	 } catch (SQLException e) { 
	 // TODO Auto-generated catch block 
	 e.printStackTrace(); 
	 } 
	 return list; 
 	} 
	 
	 public Food getFoodByID(int id) 
	 { 
	 Food food=null; 
	 DBService db=new DBService(); 
	 PreparedStatement statement; 
	 try { 
	 statement = db.getConn().prepareStatement("SELECT * from `monan` WHERE `id`=?"); 
	 statement.setInt(1, id); 
	 
	 ResultSet rs=db.executeQuery(statement); 
	 
	 if(rs!=null) 
	 { 
	 while(rs.next()) 
	 { 
	 food=new Food(rs.getInt("id"), 
	rs.getString("tenmonan"), 
	 
	 rs.getString("hinhanh"),rs.getInt("gia")); 
	 } 
	 } 
	 
	 
	 } catch (SQLException e) { 
	 // TODO Auto-generated catch block 
	 e.printStackTrace(); 
	 }
	 return food; 
	 }
	 public void Order(int idnguoidung,int idmonan, int soluong, int gia, int 
			 thanhtien) 
			  { 
			  DBService db=new DBService(); 
			  PreparedStatement statement; 
			  try { 
			  statement = db.getConn().prepareStatement("INSERT INTO `datmon`(`idnguoidung`,`idmonan`,`soluong`,`gia`,`thanhtien`) values(?,?,?,?,?)"); 
			  statement.setInt(1, idnguoidung); 
			  statement.setInt(2, idmonan); 
			  statement.setInt(3, soluong); 
			  statement.setInt(4, gia); 
			  statement.setInt(5, thanhtien); 
//			  statement.setInt(6, 0); 
			  
			  db.executeUpdate(statement); 
			  } catch (SQLException e) { 
			  // TODO Auto-generated catch block 
			  e.printStackTrace(); 
			  } 
	 } 
	 
	 public void store(String ten, String hinh,int gia)
		{
			DBService db=new DBService();
			PreparedStatement statement;
			try {
				statement = db.getConn().prepareStatement("INSERT INTO	`monan`(`tenmonan`,`hinhanh`,`gia`) values(?,?,?)");
				statement.setString(1, ten);
				statement.setString(2, hinh);
				statement.setInt(3, gia);			
				db.executeUpdate(statement);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		public void update(int id, String tenmonan, String hinh, int gia) {
			// TODO Auto-generated method stub
			DBService db=new DBService();
			PreparedStatement statement;
			try {
				statement = db.getConn().prepareStatement("UPDATE `monan` SET `tenmonan`=?, `hinhanh`=?, `gia`=? where `id`=?");
				statement.setString(1, tenmonan);
				statement.setString(2, hinh);
				statement.setInt(3, gia);
				statement.setInt(4, id);	
				db.executeUpdate(statement);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		public void delete(int id) {
			DBService db=new DBService();
			PreparedStatement statement;
			try {
				statement = db.getConn().prepareStatement("DELETE FROM MONAN where id=?");
				statement.setInt(1, id);	
				db.executeUpdate(statement);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		public void deletecart(int id) {
			DBService db=new DBService();
			PreparedStatement statement;
			try {
				statement = db.getConn().prepareStatement("DELETE FROM datmon where id=?");
				statement.setInt(1, id);	
				db.executeUpdate(statement);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		public void updatecart(int id, int sl) {
			// TODO Auto-generated method stub
			DBService db=new DBService();
			PreparedStatement statement;
			try {
				statement = db.getConn().prepareStatement("UPDATE `datmon` SET `soluong`=? where `id`=?");
				statement.setInt(1, sl);
				statement.setInt(2, id);	
				db.executeUpdate(statement);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		public List<Food> getCartItemsByUserId(int userId) {
		    List<Food> list = new ArrayList<>();
		    DBService db=new DBService(); 
			 PreparedStatement statement; 	

			 try { 
				 statement = db.getConn().prepareStatement("SELECT monan.*, datmon.id as iddatmon ,datmon.soluong, datmon.thanhtien FROM monan  JOIN datmon ON monan.id =datmon.idmonan WHERE datmon.idnguoidung = ?"); 
				 statement.setInt(1, userId);
				 ResultSet rs=db.executeQuery(statement); 
				 
				 if(rs!=null) 
				 { 
				 while(rs.next()) 
				 { 
					 list.add( new Food(rs.getInt("id"), 
							 rs.getString("tenmonan"), 
							 rs.getString("hinhanh"),rs.getInt("gia"),rs.getInt("soluong"),rs.getInt("thanhtien"), rs.getInt("iddatmon"))); 
				 } 
				 } 
				 } catch (SQLException e) { 
				 // TODO Auto-generated catch block 
				 e.printStackTrace(); 
				 } 

		    return list;
		}


}

