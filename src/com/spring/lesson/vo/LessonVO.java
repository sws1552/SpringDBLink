package com.spring.lesson.vo;

public class LessonVO {
	private String num;
	private String lnum;
	private String lname;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	private String pagesize;
	private String groupsize;
	private String curpage;
	private String totalcount;
	
	
	
	
	public LessonVO() {
		
	}
	
		
	public LessonVO(String pagesize, String groupsize, String curpage, String totalcount) {
		super();
		this.pagesize = pagesize;
		this.groupsize = groupsize;
		this.curpage = curpage;
		this.totalcount = totalcount;
	}

	public LessonVO(String num, String lnum, String lname, String deleteyn, String insertdate, String updatedate) {

		this.num = num;
		this.lnum = lnum;
		this.lname = lname;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getLnum() {
		return lnum;
	}

	public void setLnum(String lnum) {
		this.lnum = lnum;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getDeleteyn() {
		return deleteyn;
	}

	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}


	public String getPagesize() {
		return pagesize;
	}


	public void setPagesize(String pagesize) {
		this.pagesize = pagesize;
	}


	public String getGroupsize() {
		return groupsize;
	}


	public void setGroupsize(String groupsize) {
		this.groupsize = groupsize;
	}


	public String getCurpage() {
		return curpage;
	}


	public void setCurpage(String curpage) {
		this.curpage = curpage;
	}


	public String getTotalcount() {
		return totalcount;
	}


	public void setTotalcount(String totalcount) {
		this.totalcount = totalcount;
	}
	
	
	
	

	
	
}
