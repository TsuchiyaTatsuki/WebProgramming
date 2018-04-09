package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.Common;
import model.User;

public class UserDao {

	public User findByLoginInfo(String loginId, String password) {
		Connection conn = null;

		try {
			conn = DBManager.getConnection();

			String sql = "SELECT * FROM user WHERE login_id = ? and password = ?";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, loginId);
			pStmt.setString(2, Common.convertPassword(password));
			ResultSet rs = pStmt.executeQuery();

			if (!rs.next()) {
				return null;
			}
			String loginIdData = rs.getString("login_id");
			String nameData = rs.getString("name");
			return new User(loginIdData, nameData);

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {

			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;
				}
			}
		}
	}

	public User findUser(String id) {
		Connection conn = null;

		try {
			conn = DBManager.getConnection();

			String sql = "SELECT * FROM user WHERE id = ?";


			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, id);
			ResultSet rs = pStmt.executeQuery();

			if (!rs.next()) {
				return null;
			}
			int userId = rs.getInt("id");
			String loginId = rs.getString("login_id");
			String name = rs.getString("name");
			Date birthDate = rs.getDate("birth_date");
			String password = rs.getString("password");
			String createDate = rs.getString("create_date");
			String updateDate = rs.getString("update_date");

			return new User(userId, loginId, name, birthDate, password, createDate, updateDate);



		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;

		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;
				}
			}

		}

	}

	public List<User> findAll() {
		Connection conn = null;
		List<User> userList = new ArrayList<User>();

		try {
			conn = DBManager.getConnection();

			String sql = "SELECT * FROM user where id not in('1')";

			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt("id");
				String loginId = rs.getString("login_id");
				String name = rs.getString("name");
				Date birthDate = rs.getDate("birth_date");
				String password = rs.getString("password");
				String createDate = rs.getString("create_date");
				String updateDate = rs.getString("update_date");
				User user = new User(id, loginId, name, birthDate, password, createDate, updateDate);

				userList.add(user);

			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {

			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;
				}
			}
		}
		return userList;
	}

	public List<User> findSearch(String loginId, String name, String date1, String date2) {
		Connection conn = null;
		List<User> userList = new ArrayList<User>();

		try {
			conn = DBManager.getConnection();

			String sql = "SELECT * FROM user where id not in('1')";

			if(!loginId.equals("")) {
				sql += " and login_id = '" + loginId + "'";
			}
			if(!name.equals("")) {
				sql += " and name like '%" + name + "%'";
			}
			if(!date1.equals("") && !date2.equals("")) {
				sql += " and birth_date between '" + date1 + "' and '" + date2 + "'";
			}

			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt("id");
				String loginIdDate = rs.getString("login_id");
				String nameDate = rs.getString("name");
				Date birthDate = rs.getDate("birth_date");
				String password = rs.getString("password");
				String createDate = rs.getString("create_date");
				String updateDate = rs.getString("update_date");
				User user = new User(id, loginIdDate, nameDate, birthDate, password, createDate, updateDate);

				userList.add(user);

			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {

			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;
				}
			}
		}
		return userList;
	}

	public boolean newUser(String loginId, String password, String passwordb, String name, String birthDate,
			String createDate) {
		Connection conn = null;

		try {
			conn = DBManager.getConnection();

			if (password.equals(passwordb)) {

				String sql = "insert into user (login_id, name, birth_date, password, create_date, update_date) values(?, ?, ?, ?, ?, ?)";

				PreparedStatement pStmt = conn.prepareStatement(sql);
				pStmt.setString(1, loginId);
				pStmt.setString(2, name);
				pStmt.setString(3, birthDate);
				pStmt.setString(4, Common.convertPassword(password));
				pStmt.setString(5, createDate);
				pStmt.setString(6, createDate);
				pStmt.executeUpdate();

				return true;

			} else {
				return false;

			}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;

		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return false;
				}
			}

		}

	}

	public boolean userUpdate(String id, String password, String passwordb, String name, String birthDate, String updateDate) {
		Connection conn = null;

		try {
			conn = DBManager.getConnection();

			if (password.equals(passwordb)) {

				if(password.equals("")) {
					if(name.equals("") || birthDate.equals("")) {

						return false;
					}

					String sql = "update user set name = ?, birth_date = ?, update_date = ? where id =?";

					PreparedStatement pStmt = conn.prepareStatement(sql);
					pStmt.setString(1, name);
					pStmt.setString(2, birthDate);
					pStmt.setString(3, updateDate);
					pStmt.setString(4, id);
					pStmt.executeUpdate();

					return true;

				}

				String sql = "update user set name = ?, birth_date = ?, password = ?, update_date = ? where id =?";

				PreparedStatement pStmt = conn.prepareStatement(sql);
				pStmt.setString(1, name);
				pStmt.setString(2, birthDate);
				pStmt.setString(3, Common.convertPassword(password));
				pStmt.setString(4, updateDate);
				pStmt.setString(5, id);
				pStmt.executeUpdate();

				return true;

			} else {

				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;

		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return false;
				}
			}

		}

	}

	public boolean userDelete(String id) {
		Connection conn = null;
		try {
			conn = DBManager.getConnection();

			String sql = "delete from user where id = ?";

			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, id);
			pStmt.executeUpdate();

			return true;


		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;


		}finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return false;
				}
			}
		}

	}

}
