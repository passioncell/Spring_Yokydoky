package com.javalec.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public abstract interface HomeController {

	// ����
	@RequestMapping("/")
	public abstract ModelAndView index(HttpServletRequest request, HttpSession session) throws Exception;

	// �Ź���� ����Ʈ
	@RequestMapping("/article/list")
	public abstract ModelAndView article_list(HttpServletRequest request, HttpSession session) throws Exception;

	// Ű���� ����
	@RequestMapping("/keyword/setting")
	public abstract ModelAndView keyword_setting(HttpServletRequest request, HttpSession session) throws Exception;

	// ������ ����
	@RequestMapping("/member/modify")
	public abstract ModelAndView member_modify(HttpServletRequest request, HttpSession session) throws Exception;
	
	// ������ ����
	@RequestMapping("/member/modify_submit")
	public abstract ModelAndView member_modify_submit(HttpServletRequest request, HttpSession session) throws Exception;

	// �α���(VIEW)
	@RequestMapping("/member/login")
	public abstract ModelAndView member_login(HttpServletRequest request, HttpSession session) throws Exception;

	// �α���(SUBMIT)
	@RequestMapping("/member/login_submit")
	public abstract ModelAndView member_login_submit(HttpServletRequest request, HttpSession session) throws Exception;

	// ȸ������(VIEW)
	@RequestMapping("/member/join")
	public abstract ModelAndView member_join(HttpServletRequest request, HttpSession session) throws Exception;

	// ȸ������(SUBMIT)
	@RequestMapping("/member/join_submit")
	public abstract ModelAndView member_join_submit(HttpServletRequest request, HttpSession session) throws Exception;
	
	// ȸ������(SUBMIT)
	@RequestMapping("/keyword/searchToJSON")
	public abstract ModelAndView searchToJSON(HttpServletRequest request, HttpSession session) throws Exception;

	// �α׾ƿ�
	@RequestMapping("/member/logout")
	public abstract ModelAndView member_logout(HttpServletRequest request, HttpSession session) throws Exception;

}
