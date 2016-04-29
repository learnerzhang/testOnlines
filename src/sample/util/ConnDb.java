package sample.util;
import java.sql.*;
public class ConnDb {
	private static ConnDb p = null;
	private Connection conn=null;
	private Statement stmt = null;
	private  ResultSet rs = null;
	
	private ConnDb(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("no driver");
		}
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testonline?useUnicode=true&amp;characterEncoding=UTF-8","root","123456");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("can not connection");
		}
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public static ConnDb createInstance(){
		if(p==null){
			p = new ConnDb();
		}
		return p;
		
	}
	public ResultSet executeQuery(String sql){
		try {
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public void executeUpdate(String sql){
		try {
			stmt.executeUpdate(sql);
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Connection getConn() {
		if (conn==null) {
			try {
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testonline?useUnicode=true&amp;characterEncoding=UTF-8","root","123456");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}
	public void closeDb(){
		try{
			stmt.close();
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();			
		}
		
	}
	public ResultSet getRs() {
		return rs;
	}
	public void setRs(ResultSet rs) {
		this.rs = rs;
	}
}
