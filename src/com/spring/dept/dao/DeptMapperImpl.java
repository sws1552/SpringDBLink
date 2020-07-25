package com.spring.dept.dao;

import java.util.List;
import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.spring.dept.vo.DeptVO;


public class DeptMapperImpl extends SqlSessionDaoSupport implements DeptMapper {
	private static Logger log = Logger.getLogger(DeptMapperImpl.class);
	
	//매퍼(DAO)경로
	private final String PACKAGE_PATH = "com.spring.dept.dao.DeptMapper.";
	
	@Override
	public List<DeptVO> listDepartment(DeptVO param){
		log.info("DeptMapperImpl listDepartment !! ");
		log.info("DeptMapperImpl listDepartment param !! " + param);
		
		//listDepartment는 DeptDAO에 있는 <select id="listDepartment"를 가리킨다.
		//selectList()함수는 복수 개의 객체를 반환하는 메서드이다.
		// selectOne(),selectMap()
		// 매퍼xml은 dao에 있어야하기에 dao패키지명을 붙힌다.(네임스페이스)
		List<DeptVO> list = getSqlSession().selectList(PACKAGE_PATH+"listDepartment");
		log.info("DeptMapperImpl listDepartment list !! " + list);
		
		return list;
	}
	
	
	@Override
	public DeptVO deptSelect(String deptid) {
		log.info("DeptMapperImpl deptSelect !! ");
		log.info("DeptMapperImpl deptSelect deptid !! " + deptid);
				
		DeptVO dvo = (DeptVO)getSqlSession().selectOne(PACKAGE_PATH+"deptSelect");
		
		log.info("DeptMapperImpl deptSelect dvo !! " + dvo);
		
		return dvo;
	}
	
	@Override
	public int deptInsert(DeptVO param) {
		log.info("DeptMapperImpl deptInsert !! ");
		log.info("DeptMapperImpl deptInsert param !! " + param);
		
		int nCnt = (int)getSqlSession().insert(PACKAGE_PATH+"deptInsert");
		
		log.info("DeptMapperImpl deptInsert nCnt !! " + nCnt);
		
		
		return nCnt;
	}
	
	@Override
	public int deptUpdate(DeptVO param) {
		log.info("DeptMapperImpl deptUpdate !! ");
		log.info("DeptMapperImpl deptUpdate param !! " + param);
		
		int nCnt = (int)getSqlSession().update(PACKAGE_PATH+"deptUpdate");
		
		log.info("DeptMapperImpl deptUpdate nCnt !! " + nCnt);
		
		
		return nCnt;
	}
	
	@Override
	public int deptDelete(DeptVO param) {
		log.info("DeptMapperImpl deptDelete !! ");
		log.info("DeptMapperImpl deptDelete param !! " + param);
		
		int nCnt = (int)getSqlSession().delete(PACKAGE_PATH+"deptDelete");
		
		log.info("DeptMapperImpl deptDelete nCnt !! " + nCnt);
			
		
		return nCnt;
	}

	
	
	
}
