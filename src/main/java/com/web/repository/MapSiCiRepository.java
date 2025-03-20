package com.web.repository;

import org.apache.ibatis.session.SqlSession;

import com.web.common.CommonFactory;
import com.web.dto.MapSiCiDTO;

public class MapSiCiRepository {

	public int insertMapSiCi(MapSiCiDTO mapSiCi) {
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.insert("MapSiCiMapper.insertMapSiCi", mapSiCi);
		}
	}

	public int deleteMapSiCi(MapSiCiDTO mapSiCi) {
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.delete("MapSiCiMapper.deleteMapSiCi", mapSiCi);
		}
	}
}
