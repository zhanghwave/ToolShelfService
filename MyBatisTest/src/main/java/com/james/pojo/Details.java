package com.james.pojo;

public class Details {

	private String did;
	private String ddesc;
	private Products pro;

	@Override
	public String toString() {
		return "Details [did=" + did + ", ddesc=" + ddesc + ", pro=" + pro + "]";
	}

	public String getDid() {
		return did;
	}

	public void setDid(String did) {
		this.did = did;
	}

	public String getDdesc() {
		return ddesc;
	}

	public void setDdesc(String ddesc) {
		this.ddesc = ddesc;
	}

	public Products getPro() {
		return pro;
	}

	public void setPro(Products pro) {
		this.pro = pro;
	}
}
