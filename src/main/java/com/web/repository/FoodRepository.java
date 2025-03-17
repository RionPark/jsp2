package com.web.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.common.CommonFactory;
import com.web.dto.FoodDTO;

public class FoodRepository {
	public List<FoodDTO> selectFoods(FoodDTO food){
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectList("FoodMapper.selectFoods",food);
		}
	}
	public FoodDTO selectFood(int fiNum){
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectOne("FoodMapper.selectFood",fiNum);
		}
	}
	public int insertFood(FoodDTO food){
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.insert("FoodMapper.insertFood",food);
		}
	}
	public int updateFood(FoodDTO food){
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.update("FoodMapper.updateFood",food);
		}
	}
	public int deleteFood(int fiNum){
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.delete("FoodMapper.deleteFood",fiNum);
		}
	}
}
