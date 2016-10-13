package com.javalec.Dao;

import java.util.List;

import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
@SuppressWarnings({"unchecked"})
public class KeywordDao extends SqlSessionDaoSupport{

	public List<Map<String, Object>> getKeywordList(){
		return  (List<Map<String, Object>>) getSqlSession().selectList("keywordDao.getKeywordList");
	}

}
