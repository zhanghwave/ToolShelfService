package com.james.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Orders {

	private String oid;
	private String odescr;
	private Users users;
	private Date orderdate;
	private List<Details> details;

	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return "Orders [oid=" + oid + ", odescr=" + odescr + ", users=" + users + ", orderdate=" + sdf.format(orderdate)
				+ ", details=" + details + "]";
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getOdescr() {
		return odescr;
	}

	public void setOdescr(String odescr) {
		this.odescr = odescr;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public List<Details> getDetails() {
		return details;
	}

	public void setDetails(List<Details> details) {
		this.details = details;
	}
}
