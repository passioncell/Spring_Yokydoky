package com.javalec.Dao;

import java.util.ArrayList;
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
	
	public ArrayList<Map<String, Object>> getMyInfo(String eamil){
		return  (ArrayList<Map<String, Object>>) getSqlSession().selectList("memberDao.getMyInfo", eamil);
	}
	
	public void updateMemberInfo(Map map){
		getSqlSession().update("memberDao.updateMemberInfo", map);
	}
	
	public Integer getUserPk(Map map){
		return (Integer) getSqlSession().selectOne("memberDao.getUserPk", map);
	}
	
}
