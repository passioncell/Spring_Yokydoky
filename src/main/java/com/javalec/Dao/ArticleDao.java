package com.javalec.Dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

@SuppressWarnings({"unchecked", "rawtypes"})
public class ArticleDao  extends SqlSessionDaoSupport{
	
	public List<Map<String, Object>> getArticleList(Map map){
		return  (List<Map<String, Object>>) getSqlSession().selectList("articleDao.getArticleList", map);
	}
	
	public Integer getArticleListCount(Map map){
		return  (Integer) getSqlSession().selectOne("articleDao.getArticleListCount", map);
	}
	
	public Integer checkLikeExist(Map map){
		return (Integer) getSqlSession().selectOne("articleDao.checkLikeExist", map);
	}
	
	public void insertLike(Map map){
		getSqlSession().insert("articleDao.insertLike", map);
	}
	
}
