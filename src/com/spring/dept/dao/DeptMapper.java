package com.spring.dept.dao;

import java.util.List;

import com.spring.dept.vo.DeptVO;

public interface DeptMapper {
	
	public List<DeptVO> listDepartment(DeptVO param);
	public DeptVO deptSelect(String deptid);
	public int deptInsert(DeptVO param);
	public int deptUpdate(DeptVO param);
	public int deptDelete(DeptVO param);

}
