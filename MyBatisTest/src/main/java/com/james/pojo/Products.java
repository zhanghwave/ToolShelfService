package com.james.pojo;

public class Products {

	private String pid;
	private String pname;
	private String pdesc;
	private Types types;

	@Override
	public String toString() {
		return "Products [pid=" + pid + ", pname=" + pname + ", pdesc=" + pdesc + ", types=" + types + "]";
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPdesc() {
		return pdesc;
	}

	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}

	public Types getTypes() {
		return types;
	}

	public void setTypes(Types types) {
		this.types = types;
	}
}
