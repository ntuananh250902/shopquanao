package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.Food;
import Model.Cart;
import Model.Danhmuc;
import Model.NguoiDung;

public class FoodDAO {

	public List<Food> getList() {

		List<Food> list = new ArrayList<Food>();
		DBService db = new DBService();
		PreparedStatement statement;

		try {
			statement = db.getConn().prepareStatement("SELECT *  from `monan` ORDER BY `id` DESC");
			ResultSet rs = db.executeQuery(statement);

			if (rs != null) {
				while (rs.next()) {
					list.add(new Food(rs.getInt("id"), rs.getString("tenmonan"),

							rs.getString("hinhanh"), rs.getInt("gia")));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List<Danhmuc> List() {

		List<Danhmuc> list = new ArrayList<Danhmuc>();
		DBService db = new DBService();
		PreparedStatement statement;

		try {
			statement = db.getConn().prepareStatement("SELECT *  from `danhmuc`");
			ResultSet rs = db.executeQuery(statement);

			if (rs != null) {
				while (rs.next()) {
					list.add(new Danhmuc(rs.getInt("id"), rs.getString("tendanhmuc"), rs.getInt("trangthai")));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public Food getFoodByID(int id) {
		Food food = null;
		DBService db = new DBService();
		PreparedStatement statement;
		try {
			statement = db.getConn().prepareStatement("SELECT * from `monan` WHERE `id`=?");
			statement.setInt(1, id);

			ResultSet rs = db.executeQuery(statement);

			if (rs != null) {
				while (rs.next()) {
					food = new Food(rs.getInt("id"), rs.getString("tenmonan"),

							rs.getString("hinhanh"), rs.getInt("gia"));
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return food;
	}
	
	public Danhmuc getDanhMucByID(int id) {
		Danhmuc dm = null;
		DBService db = new DBService();
		PreparedStatement statement;
		try {
			statement = db.getConn().prepareStatement("SELECT * from `danhmuc` WHERE `id`=?");
			statement.setInt(1, id);

			ResultSet rs = db.executeQuery(statement);

			if (rs != null) {
				while (rs.next()) {
					dm = new Danhmuc(rs.getInt("id"), rs.getString("tendanhmuc"), rs.getInt("trangthai"));
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dm;
	}

	public void Order(int idnguoidung, int idmonan, int soluong, int gia, int thanhtien) {
		DBService db = new DBService();
		PreparedStatement statement;
		try {
			statement = db.getConn().prepareStatement(
					"INSERT INTO `datmon`(`idnguoidung`,`idmonan`,`soluong`,`gia`,`thanhtien`,`thanhtoan`) values(?,?,?,?,?,?)");
			statement.setInt(1, idnguoidung);
			statement.setInt(2, idmonan);
			statement.setInt(3, soluong);
			statement.setInt(4, gia);
			statement.setInt(5, thanhtien);
			statement.setInt(6, 0);

			db.executeUpdate(statement);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void OrderTrung(int id, int soluong) {
		DBService db = new DBService();
		PreparedStatement statement;
		try {
			statement = db.getConn().prepareStatement("UPDATE `datmon` SET `soluong`=`soluong`+? where `id`=?");
			statement.setInt(1, soluong);
			statement.setInt(2, id);

			db.executeUpdate(statement);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void store(int iddanhmuc, String ten, String hinh, int gia) {
		DBService db = new DBService();
		PreparedStatement statement;
		try {
			statement = db.getConn().prepareStatement("INSERT INTO	`monan`(`iddanhmuc`,`tenmonan`,`hinhanh`,`gia`,`trangthai`) values(?,?,?,?,?)");
			statement.setInt(1, iddanhmuc);
			statement.setString(2, ten);
			statement.setString(3, hinh);
			statement.setInt(4, gia);
			statement.setInt(5, 1);
			db.executeUpdate(statement);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void storeDM(String ten) {
		DBService db = new DBService();
		PreparedStatement statement;
		try {
			statement = db.getConn().prepareStatement("INSERT INTO	`danhmuc`(`tendanhmuc`,`trangthai`) values(?,?)");
			statement.setString(1, ten);
			statement.setInt(2, 1);
			db.executeUpdate(statement);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void update(int id, String tenmonan, String hinh, int gia) {
		// TODO Auto-generated method stub
		DBService db = new DBService();
		PreparedStatement statement;
		try {
			statement = db.getConn()
					.prepareStatement("UPDATE `monan` SET `tenmonan`=?, `hinhanh`=?, `gia`=? where `id`=?");
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
	
	public void updateDM(int id, String ten) {
		// TODO Auto-generated method stub
		DBService db = new DBService();
		PreparedStatement statement;
		try {
			statement = db.getConn()
					.prepareStatement("UPDATE `danhmuc` SET `tendanhmuc`=? where `id`=?");
			statement.setString(1, ten);
			statement.setInt(2, id);
			db.executeUpdate(statement);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void delete(int id) {
		DBService db = new DBService();
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
	
	public void deleteDM(int id) {
		DBService db = new DBService();
		PreparedStatement statement;
		try {
			statement = db.getConn().prepareStatement("UPDATE `danhmuc` SET `trangthai`=? where `id`=?");
			statement.setInt(1, 0);
			statement.setInt(2, id);
			db.executeUpdate(statement);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deletecart(int id) {
		DBService db = new DBService();
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
		DBService db = new DBService();
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

	public void updatett(int userId) {
		// TODO Auto-generated method stub
		DBService db = new DBService();
		PreparedStatement statement;
		try {
			statement = db.getConn().prepareStatement(
					"UPDATE `datmon` SET `thanhtien` = `soluong` * `gia` WHERE `id` > 0 AND `idnguoidung`=?");
			statement.setInt(1, userId);
			db.executeUpdate(statement);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void thanhtoan(int userId) {
		// TODO Auto-generated method stub
		DBService db = new DBService();
		PreparedStatement statement;
		try {
			statement = db.getConn()
					.prepareStatement("UPDATE `datmon` SET `thanhtoan` = 1 WHERE `thanhtoan` = 0 AND `idnguoidung`=?");
			statement.setInt(1, userId);
			db.executeUpdate(statement);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Food> getCartItemsByUserId(int userId) {
		List<Food> list = new ArrayList<>();
		DBService db = new DBService();
		PreparedStatement statement;

		try {
			statement = db.getConn().prepareStatement(
					"SELECT monan.*, datmon.id as iddatmon ,datmon.soluong, datmon.thanhtien FROM monan  JOIN datmon ON monan.id =datmon.idmonan WHERE datmon.idnguoidung = ? AND datmon.thanhtoan = 0");
			statement.setInt(1, userId);
			ResultSet rs = db.executeQuery(statement);

			if (rs != null) {
				while (rs.next()) {
					list.add(new Food(rs.getInt("id"), rs.getString("tenmonan"), rs.getString("hinhanh"),
							rs.getInt("gia"), rs.getInt("soluong"), rs.getInt("thanhtien"), rs.getInt("iddatmon")));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public List<Food> search(String keyword) {
		List<Food> list = new ArrayList<>();
		DBService db = new DBService();
		PreparedStatement statement;

		try {
			statement = db.getConn().prepareStatement("SELECT * FROM monan WHERE tenmonan LIKE ?");
			statement.setString(1, '%' + keyword + '%');
			ResultSet rs = db.executeQuery(statement);

			if (rs != null) {
				while (rs.next()) {
					list.add(new Food(rs.getInt("id"), rs.getString("tenmonan"), rs.getString("hinhanh"),
							rs.getInt("gia")));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

}
