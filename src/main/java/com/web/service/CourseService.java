package com.web.service;

import java.util.List;

import com.web.dto.CourseDTO;
import com.web.dto.MapSiCiDTO;
import com.web.repository.CourseRepository;
import com.web.repository.MapSiCiRepository;

public class CourseService {

	private CourseRepository courseRepo = new CourseRepository();
	private MapSiCiRepository mapSiCiRepo = new MapSiCiRepository();

	public List<CourseDTO> getCourses(CourseDTO course){
		return courseRepo.selectCourses(course);
	}

	public List<CourseDTO> getCoursesBySiNum(int siNum) {
		return courseRepo.selectCoursesBySiNum(siNum);
	}
	public CourseDTO getCourse(int ciNum){
		return courseRepo.selectCourse(ciNum);
	}
	public int addCourse(CourseDTO course){
		return courseRepo.insertCourse(course);
	}
	public boolean updateMapSiCi(int siNum, List<Integer> ciNumList) {
		MapSiCiDTO mapSiCi = new MapSiCiDTO();
		mapSiCi.setSiNum(siNum);
		mapSiCiRepo.deleteMapSiCi(mapSiCi);
		int result = 0;
		for(int ciNum : ciNumList) {
			mapSiCi.setCiNum(ciNum);
			result += mapSiCiRepo.insertMapSiCi(mapSiCi);
		}
		return ciNumList.size() == result;
	}
	public int modifyCourse(CourseDTO course){
		return courseRepo.updateCourse(course);
	}
	public int removeCourse(int ciNum) {
		return courseRepo.deleteCourse(ciNum);
	}
}
