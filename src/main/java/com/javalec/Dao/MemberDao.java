package com.javalec.Dao;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.javalec.bean.Member;

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
	
	public Map<String, Object> getMyInfo(Map map){
		return (Map<String, Object>) getSqlSession().selectList("memberDao.getMyInfo", map);
	}
	
}
