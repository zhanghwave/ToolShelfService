package com.james.pojo;

public class Types {
	private int tid;
	private String typename;
	private String typedesc;

	@Override
	public String toString() {
		return "Types [tid=" + tid + ", typename=" + typename + ", typedesc=" + typedesc + "]";
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getTypedesc() {
		return typedesc;
	}

	public void setTypedesc(String typedesc) {
		this.typedesc = typedesc;
	}
}
