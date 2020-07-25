package com.spring.lesson.service;

import java.util.ArrayList;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.lesson.dao.LessonMapper;
import com.spring.lesson.vo.LessonVO;

@Service
@Transactional
public class LessonServiceImpl implements LessonService{
	private static Logger log = Logger.getLogger(LessonServiceImpl.class);
	
	@Autowired LessonMapper lessonMapper;
	
	//전체 조회
	@Override
	public List<LessonVO> listLesson(LessonVO param){
		log.info("listLesson !! ");
				
		
		List<LessonVO> list = new ArrayList<LessonVO>();
		list = lessonMapper.listLesson(param);
		log.info("listLesson list !! " + list);
		
		return list;
	}
	
	//상세 조회
	@Override
	public LessonVO selectLesson(LessonVO param) {
		log.info("selectLesson !! ");
		log.info("selectLesson param.getnum !! " + param.getNum());
		return lessonMapper.selectLesson(param);
		

	}
	
	//등록
	@Override
	public int insertLesson(LessonVO param) {
		log.info("insertLesson !! ");
						
		int nCnt = lessonMapper.insertLesson(param);
		log.info("insertLesson list !! " + nCnt);
				
		return nCnt;
	}
	
	
	//수정
	@Override
	public int updateLesson(LessonVO param) {
		log.info("updateLesson !! ");
		
		int nCnt = lessonMapper.updateLesson(param);
		log.info("updateLesson list !! " + nCnt);
				
		return nCnt;
	}
	
	//삭제
	@Override
	public int deleteLesson(LessonVO param) {
		log.info("deleteLesson !! ");
		
		int nCnt = lessonMapper.deleteLesson(param);
		log.info("deleteLesson list !! " + nCnt);
				
		return nCnt;
	}
	
	//페이징
	public List<LessonVO> listLessonPaging(LessonVO param){
		log.info("LessonServiceImpl listLessonPaging !! ");
		log.info("param.getPagesize !! " + param.getPagesize());
		log.info("param.getGroupsize !! " + param.getGroupsize());
		log.info("param.getCurpage !! " + param.getCurpage());
		log.info("param.getTotalcount !! " + param.getTotalcount());
		
		List<LessonVO> list = new ArrayList<LessonVO>();
		list = lessonMapper.listLessonPaging(param);
		log.info("param.getPagesize !! " + param.getPagesize());
		log.info("param.getGroupsize !! " + param.getGroupsize());
		log.info("param.getCurpage !! " + param.getCurpage());
		log.info("param.getTotalcount !! " + param.getTotalcount());
		log.info("LessonServiceImpl listLessonPaging list !! " + list);
		
		return list;
	}
	
	
	
	
	
	
}
