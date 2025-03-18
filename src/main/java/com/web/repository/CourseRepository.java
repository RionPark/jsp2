package com.web.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.common.CommonFactory;
import com.web.dto.CourseDTO;

public class CourseRepository {

	public List<CourseDTO> selectCourses(CourseDTO course) {
		try (SqlSession session = CommonFactory.getSSF().openSession()) {
			return session.selectList("CourseMapper.selectCourses", course);
		}
	}

	public CourseDTO selectCourse(int ciNum) {
		try (SqlSession session = CommonFactory.getSSF().openSession()) {
			return session.selectOne("CourseMapper.selectCourse", ciNum);
		}
	}

	public int insertCourse(CourseDTO course) {
		try (SqlSession session = CommonFactory.getSSF().openSession(true)) {
			return session.insert("CourseMapper.insertCourse", course);
		}
	}

	public int updateCourse(CourseDTO course) {
		try (SqlSession session = CommonFactory.getSSF().openSession(true)) {
			return session.update("CourseMapper.updateCourse", course);
		}
	}

	public int deleteCourse(int ciNum) {
		try (SqlSession session = CommonFactory.getSSF().openSession(true)) {
			return session.delete("CourseMapper.deleteCourse", ciNum);
		}
	}
	public static void main(String[] args) {
		CourseRepository cr = new CourseRepository();
		System.out.println(cr.selectCourse(1));
		System.out.println(cr.selectCourses(null));
		CourseDTO c = cr.selectCourse(1);
		c.setCiName("JAVA BASIC");
		int result = cr.updateCourse(c);
		System.out.println("수정 : " + result);
	}
}
