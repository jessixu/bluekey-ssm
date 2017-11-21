package com.ibm.bluekey.utils;

import java.util.HashMap;
import java.util.Map;

public class ResponseData {
	//信息码：100表示成功，200表示失败
	private String code;
	private String msg;
	private Map<String, Object> data = new HashMap<>();
	private ResponseData() {}
	
	/**
	 * 处理成功时返回
	 * @return
	 */
	public static ResponseData success()
	{
		ResponseData resData = new ResponseData();
		resData.setCode("100");
		resData.setMsg("success");
		return resData;
	}
	
	/**
	 * 处理失败时返回
	 * @return
	 */
	public static ResponseData error()
	{
		ResponseData resData = new ResponseData();
		resData.setCode("200");
		resData.setMsg("fail");
		return resData;
	}
	
	/**
	 * 追加返回数据
	 * @param key
	 * @param value
	 * @return
	 */
	public  ResponseData add(String key, Object value)
	{
		this.data.put(key, value);
		return this;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getdata() {
		return data;
	}
	public void setdata(Map<String, Object> data) {
		this.data = data;
	}
	
}
