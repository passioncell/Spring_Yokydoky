package com.javalec.Dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

@SuppressWarnings({"unchecked", "rawtypes"})
public class MemberDao extends SqlSessionDaoSupport{
	
	
	public Integer checkExistUserId(Map map){
		return (Integer) getSqlSession().selectOne("memberDao.checkExistUserId", map);
		
	}
	
	public void insertNewMember(Map map){
		getSqlSession().insert("memberDao.insertNewMember", map);
	}
	
	public Integer checkLogin(Map map){
		return (Integer) getSqlSession().selectOne("memberDao.checkLogin", map);
	}
	
	public List<Object> getMyInfo(Map map){
		return (List<Object>) getSqlSession().selectList("memberDao.getMyInfo", map);
	}
	
}
