package com.javalec.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public abstract interface HomeController {

	// 첫화면
	@RequestMapping("/")
	public abstract ModelAndView index(HttpServletRequest request, HttpSession session) throws Exception;

	// 요약기사 : 카테고리순
	@RequestMapping("/article/list")
	public abstract ModelAndView article_list(HttpServletRequest request, HttpSession session) throws Exception;

	// 기사 좋아요
	@RequestMapping("article/doLike")
	public abstract ModelAndView article_doLike(HttpServletRequest request, HttpSession session) throws Exception;

	// 요약기사 : 키워드순
	@RequestMapping("/article/keywordList")
	public abstract ModelAndView article_keyword_list(HttpServletRequest request, HttpSession session) throws Exception;

	// 키워드 설정
	@RequestMapping("/keyword/setting")
	public abstract ModelAndView keyword_setting(HttpServletRequest request, HttpSession session) throws Exception;

	// 키워드 설정
	@RequestMapping("/keyword/insertKeyword")
	public abstract ModelAndView insertKeyword(HttpServletRequest request, HttpSession session) throws Exception;

	// 키워드 삭제
	@RequestMapping("/keyword/deleteKeyword")
	public abstract ModelAndView deleteKeyword(HttpServletRequest request, HttpSession session) throws Exception;

	// 내정보 변경
	@RequestMapping("/member/modify")
	public abstract ModelAndView member_modify(HttpServletRequest request, HttpSession session) throws Exception;

	// 내정보 수정
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

	@RequestMapping("/member/logout_submit")
	ModelAndView member_join_submit(HttpServletRequest request, HttpSession session) throws Exception;

	// 로그아웃
	@RequestMapping("/member/logout")
	public abstract ModelAndView member_logout(HttpServletRequest request, HttpSession session) throws Exception;

}
