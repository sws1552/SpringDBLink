package com.spring.dept.service;

import java.util.List;

import com.spring.dept.vo.DeptVO;

public interface DeptService {
	public List<DeptVO> listDepartment(DeptVO param);
	public DeptVO deptSelect(String deptid);
	public int deptInsert(DeptVO param);
	public int deptUpdate(DeptVO param);
	public int deptDelete(DeptVO param);
}
