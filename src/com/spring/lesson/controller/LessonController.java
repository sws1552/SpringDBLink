package com.spring.lesson.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.lesson.service.LessonService;
import com.spring.lesson.vo.LessonVO;

@Controller
public class LessonController {
	private static Logger log = Logger.getLogger(LessonController.class);

	private static final String CONTEXT_PATH = "lesson";

	@Autowired
	private LessonService lessonService;

	// ��ü ��ȸ
	@RequestMapping("/listLesson.sws")
	public ModelAndView listLesson(@ModelAttribute LessonVO param) {
		log.info("listLesson !! ");
		log.info("listLesson param !! " + param);
		log.info("param.getNum !! " + param.getNum());
		log.info("param.getLname !! " + param.getLname());
		log.info("param.getLnum !! " + param.getLnum());

		List<LessonVO> list = lessonService.listLesson(param);

		ModelAndView mav = new ModelAndView();
		mav.addObject("lessonList", list);
		mav.setViewName(CONTEXT_PATH + "/lesson");

		return mav;
	}

	// ����ȸ
	@RequestMapping("/selectLesson")
	public ModelAndView selectLesson(@ModelAttribute  LessonVO param) {
		log.info("param >>> : " + param);
		log.info("param.getNum() >>> : " + param.getNum());
		
		String num = param.getNum();
		
		ModelAndView mav = new ModelAndView();
	//	if (Integer.parseInt(num) == 0) {}
		
		if ("0".equals(num)) {
			mav.addObject("mode", "insert");
		} else {
			mav.addObject("lessonVO", lessonService.selectLesson(param));
			mav.addObject("mode", "update");
		}
		mav.setViewName(CONTEXT_PATH + "/lesson_pop");
		
		return mav;
		
	}

	// ���
	@RequestMapping("/insertLesson.sws")
	public ModelAndView insertLesson(@ModelAttribute LessonVO param) {
		log.info("insertLesson !! ");
		log.info("insertLesson param !! " + param);
		log.info("param.getNum !! " + param.getNum());
		log.info("param.getLname !! " + param.getLname());
		log.info("param.getLnum !! " + param.getLnum());

		String resultStr = "";
		int result = lessonService.insertLesson(param);
		if (result > 0)
			resultStr = "��� �Ϸ��� �Ϸ�Ǿ����ϴ�.";
		else
			resultStr = "��Ͽ� ������ �־� �Ϸ����� ���Ͽ����ϴ�.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", resultStr);
		mav.setViewName("/result");
		return mav;
	}
	
	
	// ����
	@RequestMapping("/updateLesson.sws")
	public ModelAndView updateLesson(@ModelAttribute LessonVO param) {
		log.info("updateLesson !! ");
		log.info("updateLesson param !! " + param);
		log.info("param.getNum !! " + param.getNum());
		log.info("param.getLname !! " + param.getLname());
		log.info("param.getLnum !! " + param.getLnum());
		
		String resultStr = "";
		int result = lessonService.updateLesson(param);
		if (result > 0)
			resultStr = "���� �Ϸ��� �Ϸ�Ǿ����ϴ�.";
		else
			resultStr = "������ ������ �־� �Ϸ����� ���Ͽ����ϴ�.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", resultStr);
		mav.setViewName("/result");
		return mav;
	}
	
	// ����
	@RequestMapping("/deleteLesson.sws")
	public ModelAndView deleteLesson(@ModelAttribute LessonVO param) {
		log.info("deleteLesson !! ");
		log.info("deleteLesson param !! " + param);
		log.info("param.getNum !! " + param.getNum());
		log.info("param.getLname !! " + param.getLname());
		log.info("param.getLnum !! " + param.getLnum());
		
		String resultStr = "";
		int result = lessonService.deleteLesson(param);
		if (result > 0)
			resultStr = "���� �Ϸ��� �Ϸ�Ǿ����ϴ�.";
		else
			resultStr = "������ ������ �־� �Ϸ����� ���Ͽ����ϴ�.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", resultStr);
		mav.setViewName("/result");
		return mav;
	}
	
	//����¡ ����¡ ����¡ ����¡
	@RequestMapping("/listLessonPaging.sws")
	// �������� �̵��� �׻� @ModelAttribute LessonVO param ���� Ŭ������ ����Ѵ�.
	// form�±� �ȿ� �ִ� name���� vo�� �������� ���ƾ� @ModelAttribute�� set�� ���ش�.
	public ModelAndView listLessonPaging(HttpServletRequest req, @ModelAttribute LessonVO param) {
		log.info("listLessonPaging !! ");
		log.info("listLessonPaging param !! " + param);
		log.info("param.getPagesize !! " + param.getPagesize());
		log.info("param.getGroupsize !! " + param.getGroupsize());
		log.info("param.getCurpage !! " + param.getCurpage());
		log.info("param.getTotalcount !! " + param.getTotalcount());
		
		String pageSize = "1";
		String groupSize = "5";
		String curPage = "1";
		String totalCount = "0";
		
		if(req.getParameter("curPage") != null) {
			curPage = req.getParameter("curPage");
		}
		
		param.setPagesize(pageSize);
		param.setGroupsize(groupSize);
		param.setCurpage(curPage);
		param.setTotalcount(totalCount);
		

		List<LessonVO> list = lessonService.listLessonPaging(param);
		log.info("param.getPagesize !! " + param.getPagesize());
		log.info("param.getGroupsize !! " + param.getGroupsize());
		log.info("param.getCurpage !! " + param.getCurpage());
		log.info("param.getTotalcount !! " + param.getTotalcount());
		log.info("listLessonPaging list !! " + list);

		ModelAndView mav = new ModelAndView();
		mav.addObject("listLessonPaging", list);
		mav.setViewName(CONTEXT_PATH + "/lessonPaging");

		return mav;
	}
	
	
	
	
	
}
