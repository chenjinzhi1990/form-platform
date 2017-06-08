package com.ustcinfo.shop.entity;

import java.io.Serializable;

public class ResultValue<T> implements Serializable {

	
	  private int state;
	  private String msg;
	  private T data;
	  
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}

	
}
