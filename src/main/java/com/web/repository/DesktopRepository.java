package com.web.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.common.CommonFactory;
import com.web.dto.DesktopDTO;

public class DesktopRepository {

	public List<DesktopDTO> selectDesktops(DesktopDTO desktop){
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectList("DesktopMapper.selectDesktops", desktop);
		}
	}

	public DesktopDTO selectDesktop(int biNum){
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectOne("DesktopMapper.selectDesktop", biNum);
		}
	}

	public int insertDesktop(DesktopDTO desktop){
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.insert("DesktopMapper.insertDesktop", desktop);
		}
	}

	public int updateDesktop(DesktopDTO desktop){
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.update("DesktopMapper.updateDesktop", desktop);
		}
	}

	public int deleteDesktop(int biNum){
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.delete("DesktopMapper.deleteDesktop", biNum);
		}
	}
}
