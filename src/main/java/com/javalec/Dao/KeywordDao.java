package com.javalec.Dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class KeywordDao extends SqlSessionDaoSupport{
	
	public List<Object> getKeywordList(){
		return  (List<Object>) getSqlSession().selectList("keywordDao.getKeywordList");
	}

}
