package com.javalec.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

	// 생성자
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
		
		// 기본값
		if(map.get("rate")==null){
			map.put("rate", "30");
		}
		
		String page = "1";
		int start = 1;
		int end = 8;
		
		// 유저가 선택한 카테고리가 있다면 초기화(페이지 이동에선 이값이 없음.
		if (map.get("selectedCategory") != null) {
			int selectedCategory = Integer.parseInt(map.get("selectedCategory").toString());
			map.put("selectedCategory", selectedCategory);

		}

		// 전체 기사의 수
		int totalCount = articleDao.getArticleListCount(map);

		// 첫번째 페이지가 아니라면,
		if (map.get("page") != null && !(map.get("page").equals(""))) {
			page = request.getParameter("page");
			start = (Integer.parseInt(page) - 1) * maxrow + 1;
			end = start + maxrow - 1;
		}

		map.put("start", start);
		map.put("end", end);
		
		List<Map<String, Object>> articleList = articleDao.getArticleList(map);
		
		List<String> sumList = func.extractText(articleList, map.get("rate").toString());
		
		for(int i=0; i < sumList.size(); i++){
			articleList.get(i).remove("content");
			articleList.get(i).put("content",sumList.get(i));
		}
		System.out.println(map);
		System.out.println("@@ articleList" + articleList);
//		System.out.println(articleList);
		ModelAndView mav = new ModelAndView("article/list");
		mav.addObject("selectedCategory", map.get("selectedCategory"));
		mav.addObject("articleList", articleList);
		mav.addObject("page", page);
		mav.addObject("totalCount", totalCount);

		return mav;
	}

	@Override
	public ModelAndView deleteKeyword(HttpServletRequest request, HttpSession session) throws Exception {
		Map<String, Object> map = func.parseMap(request);
		map.put("email", session.getAttribute("userEmail"));
		keywordDao.deleteKeyword(map);

		ModelAndView mav = new ModelAndView("share/alert");
		mav.addObject("key", "키워드 삭제");
		return mav;
	}

	@Override
	public ModelAndView keyword_setting(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Welcom keyword_setting");

		Map<String, Object> map = func.parseMap(request);
		map.put("selectedCategory", request.getAttribute("selectedCategory"));
		map.put("email", session.getAttribute("userEmail"));

		List<Map<String, Object>> keywordList = keywordDao.getKeywordList();
		ModelAndView mav = new ModelAndView("keyword/setting");

		// 검색어 리스트 생성
		List<Object> jsonList = new ArrayList<Object>();
		String rowString = null;
		for (int i = 0; i < keywordList.size(); i++) {
			rowString = "{data:''," + "value: '" + keywordList.get(i).get("keyword") + "'}";
			jsonList.add(rowString);
		}

		// 기존에 추가된 키워드는 삭제
		List<Map<String, Object>> myKeyword = keywordDao.getMyKeyword(map);
		for (int i = 0; i < myKeyword.size(); i++) {
			for (int j = 0; j < jsonList.size(); j++) {
				String tmp[] = jsonList.get(j).toString().split("value: '");
				tmp[1] = tmp[1].replace("'}", "");
				if (tmp[1].equals(myKeyword.get(i).get("keyword").toString())) {
					jsonList.remove(j);
				}
			}
		}

		mav.addObject("map", map);
		mav.addObject("keywordList", jsonList);
		mav.addObject("myKeyword", myKeyword);

		System.out.println(myKeyword);
		return mav;
	}

	// 나만의 키워드 추가
	@Override
	public ModelAndView insertKeyword(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		String userEmail = (String) session.getAttribute("userEmail");
		Map<String, Object> map = func.parseMap(request);
		map.put("email", userEmail);

		keywordDao.insertKeyword(map);
		;

		ModelAndView mav = new ModelAndView("share/alert");
		mav.addObject("key", "키워드 추가");
		return mav;
	}

	@Override
	public ModelAndView member_modify(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Welcom member_modify");

		String userEmail = (String) session.getAttribute("userEmail");
		ArrayList<Map<String, Object>> userInfoMap = memberDao.getMyInfo(userEmail);

		ModelAndView mav = new ModelAndView("member/modify");

		mav.addObject("userInfoMap", userInfoMap.get(0));

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

		// 로그인 세션 저장 및 기본키 저장
		session.setAttribute("isLogin", "true");
		session.setAttribute("userEmail", map.get("email"));
		int userPrimaryKey = memberDao.getUserPk(map);
		session.setAttribute("userPk", userPrimaryKey);

		System.out.println("세션저장 : userPrimaryKey = " + session.getAttribute("userPk") + " userEmail : "
				+ map.get("email") + "  isLogin : " + session.getAttribute("isLogin"));
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
	public @ResponseBody Map<String , Object> article_doLike(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Wecome article_doLike");
		Map<String, Object> requestMap = func.parseMap(request);
		String userEmail = session.getAttribute("userEmail").toString();
		requestMap.put("userEmail", userEmail);

		// 좋아요했는지 안했는지 검사
		int count = articleDao.checkLikeExist(requestMap);

		
		
		Map<String, Object> jsonObject = new HashMap<String, Object>();
	    Map<String, Object> jsonSubObject = null;
	    ArrayList<Map<String, Object>> jsonList = new ArrayList<Map<String, Object>>();
	         
//	    //1번째 데이터
//	    jsonSubObject = new HashMap<String, Object>();
//	    jsonSubObject.put("idx", 1);
//	    jsonSubObject.put("title", "제목입니다");
//	    jsonSubObject.put("create_date", new Date());
//	    jsonList.add(jsonSubObject);
//	    //2번째 데이터
//	    jsonSubObject = new HashMap<String, Object>();
//	    jsonSubObject.put("idx", 2);
//	    jsonSubObject.put("title", "두번째제목입니다");
//	    jsonSubObject.put("create_date", new Date());
//	    jsonList.add(jsonSubObject);
//	    
//	    jsonSubObject = new HashMap<String, Object>();
//	    jsonSubObject.put("idx", 1);
//	    jsonSubObject.put("isExist", true);
//	    jsonList.add(jsonSubObject);
	    
	    jsonObject.put("success", true);
	         
	    
		if (count == 0) {
			// 좋아요 처리 로직
			Map<String, Object> likeMap = new HashMap<String, Object>();
			likeMap.put("userPk", session.getAttribute("userPk"));
			likeMap.put("articleId", requestMap.get("articleId"));

			// 로그 Insert 및 like_count +1
			articleDao.insertLike(likeMap);
			
			jsonObject.put("success", true);
			
			// return new ModelAndView("/share/alert").addObject("key", "좋아요
			// 하였습니다.");
			return jsonObject;
		} else {
			// 이미 좋아요 함.
			// return new ModelAndView("/share/alert").addObject("key", "이미 좋아요를
			// 하셨습니다");
			jsonObject.put("success", false);
			return jsonObject;
		}
	}

	@Override
	public ModelAndView article_keyword_list(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Welcom article_keyword_list");
		Map<String, Object> map = func.parseMap(request);

		String page = "1";
		int start = 1;
		int end = 8;
		
		// 기본값
		if(map.get("rate")==null){
			map.put("rate", "30");
		}

		// 전체 기사의 수
		int totalCount = articleDao.getArticleListCount(map);

		// 첫번째 페이지가 아니라면,
		if (map.get("page") != null && !(map.get("page").equals(""))) {
			page = request.getParameter("page");
			start = (Integer.parseInt(page) - 1) * maxrow + 1;
			end = start + maxrow - 1;
		}

		map.put("start", start);
		map.put("end", end);

		// 유저 기본키 가져오기
		int userPk = (Integer) session.getAttribute("userPk");
		map.put("userPk", userPk);
		map.put("email", session.getAttribute("userEmail"));
		List<Map<String, Object>> tmpKeywordList = keywordDao.getMyKeyword(map);
		
		List<String> keywordList = new ArrayList<String>();
		for(int i = 0; i < tmpKeywordList.size(); i++ ){
			keywordList.add(tmpKeywordList.get(i).get("keyword").toString());
		}

		map.put("keywordList", keywordList);
		System.out.println(map);
		List<Map<String, Object>> articleList = articleDao.getKeywordArticleList(map);
		
		List<String> sumList = func.extractText(articleList, map.get("rate").toString());
		
		for(int i=0; i < sumList.size(); i++){
			articleList.get(i).remove("content");
			articleList.get(i).put("content",sumList.get(i));
		}
		System.out.println("@@ map : "+map);
		System.out.println("totalCount : " + totalCount);
		
		
		ModelAndView mav = new ModelAndView("article/keyword_list");
		mav.addObject("articleList", articleList);
		mav.addObject("page", page);
		mav.addObject("totalCount", totalCount);

		return mav;
	}

	@Override
	public ModelAndView article_rank_list(HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Welcom article_rank_list");
		Map<String, Object> map = func.parseMap(request);

		// 기본값
		if(map.get("rate")==null){
			map.put("rate", "30");
		}
		
		String page = "1";
		int start = 1;
		int end = 8;

		// 전체 기사의 수
		int totalCount = articleDao.getArticleListCount(map);

		// 첫번째 페이지가 아니라면,
		if (map.get("page") != null && !(map.get("page").equals(""))) {
			page = request.getParameter("page");
			start = (Integer.parseInt(page) - 1) * maxrow + 1;
			end = start + maxrow - 1;
		}

		map.put("start", start);
		map.put("end", end);
		
		List<Map<String, Object>> articleList = articleDao.getArticleRankList(map);
		List<String> sumList = func.extractText(articleList, map.get("rate").toString());
		for(int i=0; i < sumList.size(); i++){
			articleList.get(i).remove("content");
			articleList.get(i).put("content",sumList.get(i));
		}
		
		ModelAndView mav = new ModelAndView("article/rank_list");
		mav.addObject("articleList", articleList);
		mav.addObject("page", page);
		mav.addObject("totalCount", totalCount);

		return mav;
	}

//	@Override
//	public ModelAndView member_set_rate(HttpServletRequest request, HttpSession session) throws Exception {
//		// TODO Auto-generated method stub
//		System.out.println("Welcom member_set_rate");
//		Map<String, Object> map = func.parseMap(request);
//		System.out.println(map);
//		
//		ModelAndView mav= null;
//		System.out.println(map.get("returnPage").toString());
//		
//		if(map.get("returnPage").toString().equals("list")){//123
//			return article_list(request, session);
//		}else if(map.get("returnPage").toString() == "keyword"){
//			mav = new ModelAndView("article/keyword_list");
//		}else{
//			mav = new ModelAndView("article/rank_list");
//		}
//		map.remove("returnPage");
//		
//		mav.addObject(map);
//	
//		return mav;
//	}
}
