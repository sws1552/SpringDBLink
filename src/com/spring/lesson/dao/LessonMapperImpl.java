package com.spring.lesson.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.spring.lesson.vo.LessonVO;

public class LessonMapperImpl extends SqlSessionDaoSupport implements LessonMapper {
	private static Logger log = Logger.getLogger(LessonMapperImpl.class);
	
	private final String PACKAGE_PATH = "com.spring.lesson.dao.LessonMapper.";
	
	//전체 조회
	@Override	
	public List<LessonVO> listLesson(LessonVO param){
		log.info("listLesson !! ");
		
		List<LessonVO> list = getSqlSession().selectList(PACKAGE_PATH+"listLesson");
		log.info("listLesson list !! " + list);
		
		return list;
	}
	
	//상세 조회
	@Override
	public LessonVO selectLesson(LessonVO param) {
		return (LessonVO)getSqlSession().selectOne(PACKAGE_PATH+"selectLesson");
	}
	
	//등록
	@Override
	public int insertLesson(LessonVO param) {
		log.info("insertLesson !! ");
		
		int nCnt = (int)getSqlSession().insert(PACKAGE_PATH+"insertLesson");
		log.info("insertLesson nCnt !! " + nCnt);
		
		return nCnt;
	}
	
	//수정
	@Override
	public int updateLesson(LessonVO param) {
		log.info("updateLesson !! ");
		
		int nCnt = (int)getSqlSession().update(PACKAGE_PATH+"updateLesson");
		log.info("updateLesson nCnt !! " + nCnt);
		
		return nCnt;
	}
	
	
	//삭제
	@Override
	public int deleteLesson(LessonVO param) {
		log.info("deleteLesson !! ");
		
		int nCnt = (int)getSqlSession().update(PACKAGE_PATH+"deleteLesson");
		log.info("deleteLesson nCnt !! " + nCnt);
		
		return nCnt;
	}
	
	//페이징
	@Override
	public List<LessonVO> listLessonPaging(LessonVO param){
		log.info("LessonMapperImpl listLessonPaging !! ");
		log.info("param.getPagesize !! " + param.getPagesize());
		log.info("param.getGroupsize !! " + param.getGroupsize());
		log.info("param.getCurpage !! " + param.getCurpage());
		log.info("param.getTotalcount !! " + param.getTotalcount());
		
		
		List<LessonVO> list = getSqlSession().selectList(PACKAGE_PATH+"listLessonPaging");
		log.info("param.getPagesize !! " + param.getPagesize());
		log.info("param.getGroupsize !! " + param.getGroupsize());
		log.info("param.getCurpage !! " + param.getCurpage());
		log.info("param.getTotalcount !! " + param.getTotalcount());
		log.info("LessonMapperImpl listLessonPaging list !! " + list);
		
		return list;
	}
}
