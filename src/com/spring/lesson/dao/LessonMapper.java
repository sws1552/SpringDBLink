package com.spring.lesson.dao;

import java.util.List;

import com.spring.lesson.vo.LessonVO;

public interface LessonMapper {
	public List<LessonVO> listLesson(LessonVO param);
	public LessonVO selectLesson(LessonVO param);
	public int insertLesson(LessonVO param);
	public int updateLesson(LessonVO param);
	public int deleteLesson(LessonVO param);
	public List<LessonVO> listLessonPaging(LessonVO param);
}
