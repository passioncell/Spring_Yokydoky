package com.javalec.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.javalec.Dao.ArticleDao;
import com.javalec.Dao.KeywordDao;
import com.javalec.Dao.MemberDao;
import com.javalec.controller.HomeController;
import com.javalec.function.Function;

@Service
public class homeImpl implements HomeController {

	@Autowired
	private Function func;

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private ArticleDao articleDao;
	
	@Autowired
	private KeywordDao keywordDao;
	
	private int maxrow = 8;

	//생성자
	public homeImpl() {
	}

	@Override
	public ModelAndView index(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Welcom index");
		ModelAndView mav = new ModelAndView("index");

		return mav;
	}

	@Override
	public ModelAndView article_list(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Welcom article_list");
		Map<String, Object> map = func.parseMap(request);
		
		String page = "1";
		int start = 1 ;
		int end = 8 ;
		
		//전체 기사의 수
		int totalCount = articleDao.getArticleListCount(map);
		System.out.println(map);
		//첫번째 페이지가 아니라면,
		if (map.get("page") != null && !(map.get("page").equals("")) ){
			page = request.getParameter("page");
			start = (Integer.parseInt(page)-1) * maxrow + 1;
			end = start + maxrow -1;
		}
		
		map.put("start", start);
		map.put("end", end);
		
		List<Map<String, Object>> articleList = articleDao.getArticleList(map);
		
		ModelAndView mav = new ModelAndView("article/list");
		mav.addObject("articleList", articleList);
		mav.addObject("page", page);
		mav.addObject("totalCount", totalCount);
		
		return mav;
	}

	@Override
	public ModelAndView keyword_setting(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Welcom keyword_setting");
		System.out.println("selectedCategory = " + request.getAttribute("selectedCategory"));
		
		Map<String, Object> map = func.parseMap(request);
		map.put("selectedCategory", request.getAttribute("selectedCategory"));
		map.put("userEmail", session.getAttribute("userEmail"));
		
		List<Map<String, Object>> keywordList = keywordDao.getKeywordList();
		ModelAndView mav = new ModelAndView("keyword/setting");
		
		List<Object> jsonList = new ArrayList<Object>();
		String rowString = null;
		for(int i = 0; i<keywordList.size(); i++){
			rowString = "{data:'',"+"value: '" + keywordList.get(i).get("value") +"'}";
			jsonList.add(rowString);
		}
		
		mav.addObject("map", map);
		mav.addObject("keywordList", jsonList);

		return mav;
	}

	@Override
	public ModelAndView member_modify(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Welcom member_modify");

		String userEmail = (String) session.getAttribute("userEmail");
		Map<String, Object> userInfoMap = memberDao.getMyInfo(userEmail);

		ModelAndView mav = new ModelAndView("member/modify");
		mav.addObject("userInfoMap", userInfoMap);

		return mav;
	}

	@Override
	public ModelAndView member_modify_submit(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Welcome member_modify_submit");
		Map<String, Object> map = func.parseMap(request);
		System.out.println(map);
		memberDao.updateMemberInfo(map);

		ModelAndView mav = new ModelAndView("share/alert");
		mav.addObject("key", "수정완료");
		return mav;
	}

	@Override
	public ModelAndView member_login(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Welcom member_login");
		ModelAndView mav = new ModelAndView("member/login");

		return mav;
	}

	@Override
	public ModelAndView member_join(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Welcom member_join");

		ModelAndView mav = new ModelAndView("member/join");

		return mav;
	}

	@Override
	public ModelAndView member_join_submit(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Welcom member_join_submit");

		ModelAndView mav = new ModelAndView("member/login");
		Map<String, Object> map = func.parseMap(request);

		// ���̵� �ߺ��˻�
		int count = memberDao.checkExistUserId(map);

		if (count != 0) {
			return new ModelAndView("/share/alert").addObject("key", "아이디 중복");
		}

		// ȸ������
		memberDao.insertNewMember(map);

		return mav;
	}

	@Override
	public ModelAndView member_login_submit(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Welcom member_login_submit");

		Map<String, Object> map = func.parseMap(request);

		// 로그인 검사
		int count = memberDao.checkLogin(map);

		if (count == 0) {
			return new ModelAndView("/share/alert").addObject("key", "아이디 불일치");
		}

		// �α��� ����ó��

		session.setAttribute("isLogin", "true");
		session.setAttribute("userEmail", map.get("email"));
		System.out.println("세션저장 : userEmail : " + map.get("email") + "  isLogin : " + session.getAttribute("isLogin"));

		ModelAndView mav = new ModelAndView("index");
		mav.addObject("isLogin", true);
		return mav;
	}

	@Override
	public ModelAndView member_logout(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Welcom member_logout");

		session.setAttribute("isLogin", null);
		session.setAttribute("userEmail", null);

		return new ModelAndView("member/login");
	}


	@Override
	public ModelAndView searchToJSON(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Welcom searchToJSON");
		return null;
	}

}
