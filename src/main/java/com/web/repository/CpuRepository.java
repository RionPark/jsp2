package com.web.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.common.CommonFactory;
import com.web.dto.CpuDTO;

public class CpuRepository {

	public List<CpuDTO> selectCpus(CpuDTO cpu){
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectList("CpuMapper.selectCpus", cpu);
		}
	}
	public static void main(String[] args) {
		CpuRepository cpuRepo = new CpuRepository();
		System.out.println(cpuRepo.selectCpus(null));
	}
}
