package com.web.service;

import java.util.List;

import com.web.dto.CpuDTO;
import com.web.repository.CpuRepository;

public class CpuService {

	private CpuRepository cpuRepo = new CpuRepository();
	
	public List<CpuDTO> selectCpus(CpuDTO cpu){
		return cpuRepo.selectCpus(cpu);
	}
}
