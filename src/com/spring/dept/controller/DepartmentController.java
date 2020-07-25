package com.spring.dept.controller;

import java.util.List;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dept.service.DeptService;
import com.spring.dept.vo.DeptVO;


@Controller
public class DepartmentController {
	
	private static Logger log = Logger.getLogger(DepartmentController.class);
	
	private static String CONTEXT_PATH="dept";
	
	// @Autowired : ���������� (set,get)
	// �ַ� ���� ���� �����Ͽ� �ش� Ÿ���� ��ü��  ã�Ƽ� �ڵ����� �Ҵ��Ѵ�.
	@Autowired
	private DeptService deptService;
	
	/* ��ü ��ȸ */
	@RequestMapping("/listDepartment.sws")
	public ModelAndView listDepartment(@ModelAttribute DeptVO param) {
		log.info("DepartmentController listDepartment !! ");
		log.info("DepartmentController listDepartment param !! " + param);
		log.info("param.getDeptid() !! " + param.getDeptid());
		log.info("param.getDeptname() !! " + param.getDeptname());
		log.info("param.getDepttel() !! " + param.getDepttel());
		
		List<DeptVO> list = deptService.listDepartment(param);
		log.info("DepartmentController listDepartment list !! : " + list);
		
		int listCnt = list.size();
		for(int i=0; i<listCnt; i++) {
			DeptVO dvo = (DeptVO)list.get(i);
			log.info("id !! " + dvo.getDeptid());
			log.info("name !! " + dvo.getDeptname());
			log.info("tel !! " + dvo.getDepttel());
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("departmentList",list);
		mav.setViewName(CONTEXT_PATH +"/department");
		log.info("DepartmentController listDepartment mav !! " + mav);
		
		return mav;
	}
	
	
	/*�� ���� ����*/
	@RequestMapping("/selectDepartment.sws")
	public ModelAndView selectDepartment(@RequestParam("deptid") String deptid) {
		log.info("DepartmentController selectDepartment !! ");
		log.info("DepartmentController selectDepartment deptid !! "+ deptid);
		
		DeptVO dvo = deptService.deptSelect(deptid);
		log.info("DepartmentController selectDepartment dvo !! " + dvo);
		
		ModelAndView mav = new ModelAndView();
		
		if(deptid.equals("")) {//��� ��ư Ŭ����
			mav.addObject("mode","insert");
		}else {//���� �Ǵ� ���� ��ư Ŭ����
			mav.addObject("DeptVO",deptService.deptSelect(deptid));
			mav.addObject("mode","update");			
		}
		mav.setViewName(CONTEXT_PATH + "/department_pop");
		
		return mav;
	}
	
	@RequestMapping("/insertDepartment.sws")
	public ModelAndView insertDepartment(@ModelAttribute DeptVO param) {
		log.info("DepartmentController insertDepartment !! ");
		log.info("DepartmentController insertDepartment param !! " + param);
		log.info("param.getDeptid() !! " + param.getDeptid());
		log.info("param.getDeptname() !! " + param.getDeptname());
		log.info("param.getDepttel() !! " + param.getDepttel());
		
		int nCnt = deptService.deptInsert(param);
		log.info("DepartmentController insertDepartment nCnt !! " + nCnt);
		String resultStr = null;
		
		if(nCnt > 0)
			resultStr = "����� �Ϸ� �Ǿ���.";
		else 
			resultStr = "��Ͽ� ������ �־� �Ϸ� ���ߴ�.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",resultStr);
		mav.setViewName("result");
				
		
		return mav;
	}
	
	@RequestMapping("/updateDepartment.sws")
	public ModelAndView updateDepartment(@ModelAttribute DeptVO param) {
		log.info("DepartmentController updateDepartment !! ");
		log.info("DepartmentController updateDepartment param !! " + param);
		log.info("param.getDeptid() !! " + param.getDeptid());
		log.info("param.getDeptname() !! " + param.getDeptname());
		log.info("param.getDepttel() !! " + param.getDepttel());
		
		int nCnt = deptService.deptUpdate(param);
		log.info("DepartmentController updateDepartment nCnt !! " + nCnt);
		String resultStr = null;
		
		if(nCnt > 0)
			resultStr = "���� �Ϸ� �Ǿ���.";
		else
			resultStr = "������ ������ �־� �Ϸ� ���ߴ�";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",resultStr);
		mav.setViewName("result");
		
		
		return mav;
	}
	
	@RequestMapping("/deleteDepartment.sws")
	public ModelAndView deleteDepartment(@ModelAttribute DeptVO param) {
		log.info("DepartmentController deleteDepartment !! ");
		log.info("DepartmentController deleteDepartment param !! " + param);
		log.info("param.getDeptid() !! " + param.getDeptid());
		log.info("param.getDeptname() !! " + param.getDeptname());
		log.info("param.getDepttel() !! " + param.getDepttel());
		
		int nCnt = deptService.deptDelete(param);
		log.info("DepartmentController deleteDepartment nCnt !! " + nCnt);
		String resultStr = null;
		
		if(nCnt > 0)
			resultStr = "���� �Ϸ� �Ǿ���.";
		else
			resultStr = "������ ������ �־� �Ϸ� ���ߴ�.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",resultStr);
		mav.setViewName("result");
		
		return mav;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
