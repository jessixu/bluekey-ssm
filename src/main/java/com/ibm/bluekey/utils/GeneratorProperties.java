package com.ibm.bluekey.utils;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

import org.json.JSONObject;

public class GeneratorProperties {

	static public String filePath = "config/db.properties";
	
	static public String key1;
	static public String key2;
	static public String key3;
	static public String key4;

	private static String username;
	private static String password;
	private static String host;
	private static int port;
	private static String database;
	
	// 写入 Properties 信息
	public static void WriteProperties(String filePath, String PropKey, String PropValue) throws IOException {
		
		Properties props = new Properties();
		
		// 从数据流中读取属性列表(key-value)
		InputStream fis = new FileInputStream(filePath);
		props.load(fis);
		
		// 调用 Hashtable 的方法 put,使用 getProperty 方法提供并行性
		// 强制要求为属性的 key 和 value 使用字符串,返回值是 Hashtable 调用 put 的结果
		OutputStream fos = new FileOutputStream(filePath);
		props.put(PropKey, PropValue);
		props.store(fos, "Generator Properties");
	}
	
	public static void StartConn() throws IOException {
		
		if (System.getenv("VCAP_SERVICES") != null) {
			JSONObject blueMailJson = new JSONObject(System.getenv("VCAP_SERVICES"));
			JSONObject blueMailCredentials = blueMailJson.getJSONArray("mysql")
					.getJSONObject(0).getJSONObject("credentials");
			
			// 数据库连接操作的用户名、密码和端口号等
			host = blueMailCredentials.getString("host");
			port = blueMailCredentials.getInt("port");
			key3 = blueMailCredentials.getString("username");
			key4 = blueMailCredentials.getString("password");
			database = blueMailCredentials.getString("name");

			WriteProperties(filePath, key1, "com.mysql.jdbc.Driver");
			WriteProperties(filePath, key2, "jdbc:mysql://"+host+":"+port+"/"+database);
			WriteProperties(filePath, key3, username);
			WriteProperties(filePath, key4, password);
			
			System.out.println("Use the BlueMix Properties");
			
		} else {
			
			key1 = "jdbc.driver";
			key2 = "jdbc.url";
			key3 = "jdbc.username";
			key4 = "jdbc.password";
			
			WriteProperties(filePath, key1, "com.mysql.jdbc.Driver");
			WriteProperties(filePath, key2, "jdbc:mysql://localhost:3306/bluekey");
			WriteProperties(filePath, key3, "root");
			WriteProperties(filePath, key4, "root");
			
			System.out.println("Use the localhost Properties");
			}
	}
	
	public static void main(String[] args) throws IOException {

		StartConn();
	}

}