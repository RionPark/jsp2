package com.web.service;

import java.util.List;

import com.web.dto.DesktopDTO;
import com.web.repository.DesktopRepository;

public class DesktopService {
	private DesktopRepository desktopRepo = new DesktopRepository();

	public List<DesktopDTO> selectDesktops(DesktopDTO desktop){
		return desktopRepo.selectDesktops(desktop);
	}

	public DesktopDTO selectDesktop(int diNum){
		return desktopRepo.selectDesktop(diNum);
	}

	public int insertDesktop(DesktopDTO desktop){
		return desktopRepo.insertDesktop(desktop);
	}

	public int updateDesktop(DesktopDTO desktop){
		return desktopRepo.updateDesktop(desktop);
	}

	public int deleteDesktop(int diNum){
		return desktopRepo.deleteDesktop(diNum);
	}
}
