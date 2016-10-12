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

	// 메인
	@RequestMapping("/")
	public abstract ModelAndView index(HttpServletRequest request, HttpSession session) throws Exception;

	// 신문기사 리스트
	@RequestMapping("/article/list")
	public abstract ModelAndView article_list(HttpServletRequest request, HttpSession session) throws Exception;

	// 키워드 설정
	@RequestMapping("/keyword/setting")
	public abstract ModelAndView keyword_setting(HttpServletRequest request, HttpSession session) throws Exception;

	// 내정보 변경
	@RequestMapping("/member/modify")
	public abstract ModelAndView member_modify(HttpServletRequest request, HttpSession session) throws Exception;
	
	// 내정보 변경
	@RequestMapping("/member/modify_submit")
	public abstract ModelAndView member_modify_submit(HttpServletRequest request, HttpSession session) throws Exception;

	// 로그인(VIEW)
	@RequestMapping("/member/login")
	public abstract ModelAndView member_login(HttpServletRequest request, HttpSession session) throws Exception;

	// 로그인(SUBMIT)
	@RequestMapping("/member/login_submit")
	public abstract ModelAndView member_login_submit(HttpServletRequest request, HttpSession session) throws Exception;

	// 회원가입(VIEW)
	@RequestMapping("/member/join")
	public abstract ModelAndView member_join(HttpServletRequest request, HttpSession session) throws Exception;

	// 회원가입(SUBMIT)
	@RequestMapping("/member/join_submit")
	public abstract ModelAndView member_join_submit(HttpServletRequest request, HttpSession session) throws Exception;

	// 로그아웃
	@RequestMapping("/member/logout")
	public abstract ModelAndView member_logout(HttpServletRequest request, HttpSession session) throws Exception;

}
