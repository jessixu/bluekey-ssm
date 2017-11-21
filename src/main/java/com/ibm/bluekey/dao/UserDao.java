package com.ibm.bluekey.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ibm.bluekey.bean.Employeeinfo;

public class UserDao {
	public List<Employeeinfo> findByName(String name) throws Exception   {
		// 1加载驱动
		Class.forName("com.mysql.jdbc.Driver");
		// 2.获取Connection对象取
		Connection con = DriverManager.getConnection("jdbc:mysql://us-cdbr-iron-east-04.cleardb.net:3306/ad_0312d4071834f7d",
				"b428703cac57b8", "ca15f7b1");
		// 3.获取Statement对象
		Statement st = con.createStatement();
		// 4.添加操作
		String sql = "select * from employeeinfo where Name like '%"+ name + "%'";//查询语句
		ResultSet rs = st.executeQuery(sql);//
		
		List<Employeeinfo> employeeinfos = new ArrayList<>();
		
		while (rs.next()) {
			Employeeinfo employeeinfo = new Employeeinfo();
			employeeinfo.setId(rs.getInt("id"));
			employeeinfo.setDepartment(rs.getString("Department"));
			employeeinfo.setEmail(rs.getString("Email"));
			employeeinfo.setMobile(rs.getString("Mobile"));
			employeeinfo.setImgURL(rs.getString("ImgURL"));
			employeeinfo.setName(rs.getString("Name"));
			employeeinfo.setOffice_location(rs.getString("Office_location"));
			employeeinfo.setPosition(rs.getString("Position"));
			employeeinfo.setPreferred_Contact_Method(rs.getString("Preferred_Contact_Method"));
			employeeinfo.setRegion(rs.getString("Region"));
			employeeinfo.setWork(rs.getString("Work"));
			employeeinfo.setNotes_ID(rs.getString("Notes_ID"));
			employeeinfos.add(employeeinfo);
		}
		// 5.关闭资源
		st.close();
		con.close();
		return employeeinfos;
	}
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		//findByName("Yang");
		
	}

}
