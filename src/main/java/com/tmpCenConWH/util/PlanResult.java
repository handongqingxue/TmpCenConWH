package com.tmpCenConWH.util;

import java.io.Serializable;

import com.fasterxml.jackson.databind.ObjectMapper;

public class PlanResult implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private static final ObjectMapper MAPPER = new ObjectMapper();  
    private Integer status;  
    private String msg;  
    private Object data;
    
    private String url;
  
    public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public static ObjectMapper getMAPPER() {  
        return MAPPER;  
    }

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "PlanResult [status=" + status + ", msg=" + msg + ", data=" + data + ", url=" + url + "]";
	}  

}
