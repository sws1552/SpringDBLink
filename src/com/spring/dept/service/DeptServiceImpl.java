package com.spring.dept.service;

import java.util.ArrayList;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dept.dao.DeptMapper;
import com.spring.dept.vo.DeptVO;


@Service
@Transactional
public class DeptServiceImpl implements DeptService{
	
	private static Logger log = Logger.getLogger(DeptServiceImpl.class);
	
	// 주로 변수 위에 설정하여 해당 타입의 객체를  찾아서 자동으로 할당한다.
	@Autowired
	private DeptMapper deptMapper;
	
	@Override
	public List<DeptVO> listDepartment(DeptVO param){
		log.info("DeptServiceImpl listDepartment !! ");
		log.info("DeptServiceImpl listDepartment param !! " + param);
		
		List<DeptVO> list = new ArrayList<DeptVO>();
		list = deptMapper.listDepartment(param);
		log.info("DeptServiceImpl listDepartment list !! " + list);
		
		return list;
	}
	
	@Override
	public DeptVO deptSelect(String deptid) {
		log.info("DeptServiceImpl deptSelect !! ");
		log.info("DeptServiceImpl deptSelect deptid !! " + deptid);
		
		DeptVO dvo = deptMapper.deptSelect(deptid);
		log.info("DeptServiceImpl deptSelect dvo !! " + dvo);
		
		return dvo;
	}
	
	@Override
	public int deptInsert(DeptVO param) {
		log.info("DeptServiceImpl deptInsert !! ");
		log.info("DeptServiceImpl deptInsert param !! " + param);
		
		int nCnt = (int)deptMapper.deptInsert(param);
		log.info("DeptServiceImpl deptInsert nCnt !! " + nCnt);
		
		
		return nCnt;
	}
	
	@Override
	public int deptUpdate(DeptVO param) {
		log.info("DeptServiceImpl deptUpdate !! ");
		log.info("DeptServiceImpl deptUpdate param !! " + param);
		
		int nCnt = (int)deptMapper.deptUpdate(param);
		log.info("DeptServiceImpl deptUpdate nCnt !! " + nCnt);
		
		return nCnt;
	}
	
	@Override
	public int deptDelete(DeptVO param) {
		log.info("DeptServiceImpl deptDelete !! ");
		log.info("DeptServiceImpl deptDelete param !! " + param);
		
		int nCnt = (int)deptMapper.deptDelete(param);
		log.info("DeptServiceImpl deptDelete nCnt !! " + nCnt);
		
		return nCnt;
	}

	
	
	
}
