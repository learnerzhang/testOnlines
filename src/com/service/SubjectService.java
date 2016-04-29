package com.service;

import sample.util.ConnDb;
import java.sql.*;

public class SubjectService {

	public boolean verity(String subjectName) throws SQLException {

		ConnDb connDb = ConnDb.createInstance();
		String sql = "select * from subject where subjectName='" + subjectName + "'";
		ResultSet resultSet = connDb.executeQuery(sql);
		if (resultSet.next()) {
			return true;
		}
		return false;
	}

	public void add(String subjectName) {
		// TODO Auto-generated method stub
		ConnDb connDb = ConnDb.createInstance();
		String sql = "insert into subject (subjectName) values ('" + subjectName + "')";
		connDb.executeUpdate(sql);
	}
	public static void main(String[] args) {
		SubjectService service = new SubjectService();
		try {
			System.out.println(service.verity("xxx"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		service.add("计算机网络ccna");
	}

}
