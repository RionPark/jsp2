package com.web.service;

import java.util.List;

import com.web.dto.CourseDTO;
import com.web.repository.CourseRepository;

public class CourseService {

	private CourseRepository courseRepo = new CourseRepository();

	public List<CourseDTO> getCourses(CourseDTO course){
		return courseRepo.selectCourses(course);
	}
	public CourseDTO getCourse(int ciNum){
		return courseRepo.selectCourse(ciNum);
	}
	public int addCourse(CourseDTO course){
		return courseRepo.insertCourse(course);
	}
	public int modifyCourse(CourseDTO course){
		return courseRepo.updateCourse(course);
	}
	public int removeCourse(int ciNum) {
		return courseRepo.deleteCourse(ciNum);
	}
}
