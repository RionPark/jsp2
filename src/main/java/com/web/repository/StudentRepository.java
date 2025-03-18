package com.web.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.common.CommonFactory;
import com.web.dto.StudentDTO;

public class StudentRepository {

	public List<StudentDTO> selectStudents(StudentDTO student) {
		try (SqlSession session = CommonFactory.getSSF().openSession()) {
			return session.selectList("StudentMapper.selectStudents", student);
		}
	}

	public StudentDTO selectStudent(int siNum) {
		try (SqlSession session = CommonFactory.getSSF().openSession()) {
			return session.selectOne("StudentMapper.selectStudent", siNum);
		}
	}

	public int insertStudent(StudentDTO student) {
		try (SqlSession session = CommonFactory.getSSF().openSession(true)) {
			return session.insert("StudentMapper.insertStudent", student);
		}
	}

	public int updateStudent(StudentDTO student) {
		try (SqlSession session = CommonFactory.getSSF().openSession(true)) {
			return session.update("StudentMapper.updateStudent", student);
		}
	}

	public int deleteStudent(int siNum) {
		try (SqlSession session = CommonFactory.getSSF().openSession(true)) {
			return session.delete("StudentMapper.deleteStudent", siNum);
		}
	}
}
