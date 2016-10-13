package com.javalec.Dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import org.mybatis.spring.support.SqlSessionDaoSupport;

@SuppressWarnings({"unchecked", "rawtypes"})
public class ArticleDao  extends SqlSessionDaoSupport{
	public Map<String, Object> getArticleList(Map map){
		return  (Map<String, Object>) getSqlSession().selectList("articleDao.getArticleList", map);
	}
}
