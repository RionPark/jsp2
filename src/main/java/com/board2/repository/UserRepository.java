package com.board2.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.board2.common.CommonFactory;
import com.board2.dto.UserDTO;

public class UserRepository {
	public List<UserDTO> selectUsers(UserDTO user){
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectList("UserMapper.selectUsers",user);
		}
	}
	public UserDTO selectUser(int uiNum) {
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectOne("UserMapper.selectUser",uiNum);
		}
	}
	public UserDTO selectUserByIdAndPwd(UserDTO user) {
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectOne("UserMapper.selectUserByIdAndPwd",user);
		}
	}
	public int selectCntById(UserDTO user) {
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectOne("UserMapper.selectCntById",user);
		}
	}
	
	public int insertUser(UserDTO user) {
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.insert("UserMapper.insertUser",user);
		}
	}
	
	public int updateUser(UserDTO user) {
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.update("UserMapper.updateUser",user);
		}
	}
	
	public int deleteUser(UserDTO user) {
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.delete("UserMapper.deleteUser",user);
		}
	}
}
