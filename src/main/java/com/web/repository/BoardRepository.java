package com.web.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.common.CommonFactory;
import com.web.dto.BoardDTO;

public class BoardRepository {

	public List<BoardDTO> selectBoards(BoardDTO board){
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectList("BoardMapper.selectBoards", board);
		}
	}

	public BoardDTO selectBoard(int biNum){
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectOne("BoardMapper.selectBoard", biNum);
		}
	}

	public int insertBoard(BoardDTO board){
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.insert("BoardMapper.insertBoard", board);
		}
	}

	public int updateBoard(BoardDTO board){
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.update("BoardMapper.updateBoard", board);
		}
	}

	public int deleteBoard(int biNum){
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.delete("BoardMapper.deleteBoard", biNum);
		}
	}
}
